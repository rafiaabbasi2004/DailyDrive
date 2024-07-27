import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  Future<void> addTask(String title, String date, String description) async {
    try {
      await tasks.add({
        'Title': title,
        'Date': date,
        'Description': description,
        'Status': 'To Do', // Default status when a task is added
      });
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  Future<Map<DateTime, List<Map<String, dynamic>>>> getEvents() async {
    Map<DateTime, List<Map<String, dynamic>>> events = {};

    try {
      QuerySnapshot snapshot = await tasks.where('Status', isNotEqualTo: 'Deleted').get();

      snapshot.docs.forEach((doc) {
        DateTime eventDate = DateTime.parse(doc['Date']); // Assuming 'Date' is stored as String in yyyy-MM-dd format

        if (events[eventDate] == null) {
          events[eventDate] = [];
        }
        events[eventDate]!.add({
          'id': doc.id,
          'Title': doc['Title'],
          'Description': doc['Description'],
          'Date': doc['Date'],
          'Status': doc['Status'],
        });
      });
    } catch (e) {
      print('Error fetching events: $e');
    }

    return events;
  }


  Future<List<Map<String, dynamic>>> getTasksByStatus(String status) async {
    List<Map<String, dynamic>> tasksList = [];

    try {
      QuerySnapshot snapshot = await tasks.where('Status', isEqualTo: status).get();
      snapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        tasksList.add({
          'id': doc.id,
          'Title': data['Title'],
          'Date': data['Date'],
          'Description': data['Description'],
          'Status': data['Status'],
        });
      });
    } catch (e) {
      print('Error fetching tasks by status: $e');
    }

    return tasksList;
  }

  Future<int> getTodayTasksCount() async {
    DateTime today = DateTime.now();
    String todayStr = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

    QuerySnapshot snapshot = await tasks.where('Date', isEqualTo: todayStr).get();
    return snapshot.docs.length;
  }

  Future<int> getCompletedTodayTasksCount() async {
    DateTime today = DateTime.now();
    String todayStr = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

    QuerySnapshot snapshot = await tasks.where('Date', isEqualTo: todayStr).where('Status', isEqualTo: 'Completed').get();
    return snapshot.docs.length;
  }

  Future<void> updateTaskStatus(String taskId, String status) async {
    try {
      await tasks.doc(taskId).update({'Status': status});
    } catch (e) {
      print('Error updating task status: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getTasksByDate(DateTime date) async {
    try {
      String formattedDate = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
      QuerySnapshot snapshot = await tasks.where('Date', isEqualTo: formattedDate).get();
      return snapshot.docs.map((doc) => {
        'id': doc.id,
        'Title': doc['Title'],
        'Description': doc['Description'],
        'Date': doc['Date'],
        'Status': doc['Status'],
      }).toList();
    } catch (e) {
      print('Error fetching tasks by date: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getTasksByDateAndStatus(DateTime date, String status) async {
    try {
      String formattedDate = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
      QuerySnapshot snapshot = await tasks.where('Date', isEqualTo: formattedDate).where('Status', isEqualTo: status).get();
      return snapshot.docs.map((doc) => {
        'id': doc.id,
        'Title': doc['Title'],
        'Description': doc['Description'],
        'Date': doc['Date'],
        'Status': doc['Status'],
      }).toList();
    } catch (e) {
      print('Error fetching tasks by date and status: $e');
      return [];
    }
  }


  Future<void> deleteTask(String taskId) async {
    try {
      await tasks.doc(taskId).delete();
    } catch (e) {
      print('Error deleting task: $e');
    }
  }

  Future<void> updateOverdueTasks() async {
    try {
      DateTime now = DateTime.now();
      String todayStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

      QuerySnapshot snapshot = await tasks
          .where('Date', isLessThan: todayStr)
          .where('Status', isNotEqualTo: 'Completed')
          .get();

      for (var doc in snapshot.docs) {
        await updateTaskStatus(doc.id, 'Remaining');
      }
    } catch (e) {
      print('Error updating overdue tasks: $e');
    }
  }
}

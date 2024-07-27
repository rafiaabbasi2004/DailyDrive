import 'package:kairiz3/addingTAsk/AddService.dart';

class Fetchtotaltasks {
  FirestoreService firestoreService = FirestoreService();

  Future<int> getTotalTodayTasks() async {
    // Get all tasks for today
    List<Map<String, dynamic>> todayTasks = await firestoreService.getTasksByDate(DateTime.now());
    return todayTasks.length;
  }

  Future<int> getCompletedTodayTasks() async {
    // Get all completed tasks for today
    List<Map<String, dynamic>> completedTasks = await firestoreService.getTasksByDateAndStatus(DateTime.now(), 'Completed');
    return completedTasks.length;
  }
}

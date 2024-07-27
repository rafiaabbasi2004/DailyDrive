import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:kairiz3/addingTAsk/AddService.dart'; // Adjust import path as needed

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Map<String, dynamic>>> _events = {};



  Future<void> _fetchEvents() async {
    try {
      FirestoreService firestoreService = FirestoreService();
      Map<DateTime, List<Map<String, dynamic>>> events = await firestoreService.getEvents();
      setState(() {
        _events = events;
        print('Events fetched: $_events'); // Debug print
      });
    } catch (e) {
      print('Error fetching events: $e');
      // Handle error as needed
    }
  }


  void _showEventDetails(Map<String, dynamic> event) {
    DateTime eventDate = DateTime.parse(event['Date']);
    DateTime now = DateTime.now();
    bool isOverdue = eventDate.isBefore(now) && event['Status'] != 'Completed';
    bool isToday = now.year == eventDate.year && now.month == eventDate.month && now.day == eventDate.day;
    bool isNotCompleted = event['Status'] != 'Completed';

    String message;
    if (event['Status'] == 'Completed') {
      message = 'Well done! You did it';
    } else if (isToday && event['Status'] != 'Completed' ) {
      message = 'Hurry up! You can do it';
    } else if(event['Status'] == 'To Do' && !isToday){
      message='No worries, You have time';
    }
    else if (event['Status'] != 'Completed' && !isToday) {
      message = 'Oops, you missed the task.';
    }
    else {
      message = 'Hurry up! You can do it'; // Default message for future tasks
    }

    print('Event Date: $eventDate'); // Debug print
    print('Now: $now'); // Debug print
    print('Is Overdue: $isOverdue'); // Debug print
    print('Is Today: $isToday'); // Debug print
    print('Is Not Completed: $isNotCompleted'); // Debug print
    print('Message: $message'); // Debug print

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 500,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/hurryup.png',
                alignment: Alignment.center,
              ),
              SizedBox(height: 20),
              Text(
                'Task Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                event['Description'],
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                message,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Spacer(),

              if (event['Status'] == 'To Do') ...[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: () => deletetask(event['id']),
                  child: Text(
                    'Delete Task',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ] else if (event['Status'] == 'Completed') ...[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Task Completed',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Future<void> deletetask(String taskId) async {
    FirestoreService firestoreService = FirestoreService();
    bool? confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Task'),
        content: Text('Do you want to delete this task?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await firestoreService.deleteTask(taskId);
      _fetchEvents(); // Refresh events after deletion
    }
  }

  @override
  void initState() {
    super.initState();
    _updateOverdueTasksAndFetchEvents();
  }

  Future<void> _updateOverdueTasksAndFetchEvents() async {
    try {
      FirestoreService firestoreService = FirestoreService();
      await firestoreService.updateOverdueTasks(); // Update overdue tasks
      Map<DateTime, List<Map<String, dynamic>>> events = await firestoreService.getEvents();
      setState(() {
        _events = events;
        print('Events fetched: $_events'); // Debug print
      });
    } catch (e) {
      print('Error updating overdue tasks and fetching events: $e');
      // Handle error as needed
    }
  }

  List<Map<String, dynamic>> _getEventsForDay(DateTime day) {
    final dateOnly = DateTime(day.year, day.month, day.day);
    print('Getting events for day: $dateOnly'); // Debug print
    return _events[dateOnly] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(2100, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.pink[400],
                shape: BoxShape.circle,
              ),
              weekendTextStyle: TextStyle(color: Colors.red),
              holidayTextStyle: TextStyle(color: Colors.green),
              outsideTextStyle: TextStyle(color: Colors.grey),
              defaultTextStyle: TextStyle(color: Colors.black),
              todayTextStyle: TextStyle(color: Colors.white),
              markerDecoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              tableBorder: TableBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tablePadding: EdgeInsets.all(40),
            ),
            eventLoader: (day) {
              final dateOnly = DateTime(day.year, day.month, day.day);
              print('Loading events for day: $dateOnly'); // Debug print
              return _events[dateOnly] ?? [];
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _getEventsForDay(_selectedDay ?? _focusedDay).length,
              itemBuilder: (context, index) {
                Map<String, dynamic> event = _getEventsForDay(_selectedDay ?? _focusedDay)[index];
                DateTime eventDate = DateTime.parse(event['Date']);
                bool isOverdue = eventDate.isBefore(DateTime.now()) && event['Status'] != 'Completed';
                bool isToday = DateTime.now().isAtSameMomentAs(DateTime(eventDate.year, eventDate.month, eventDate.day));

                return Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isOverdue ? Colors.red : Colors.black,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    title: Text(
                      event['Title'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onTap: () => _showEventDetails(event),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

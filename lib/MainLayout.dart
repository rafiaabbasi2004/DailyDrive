import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kairiz3/Drawer/Drawer.dart';
import 'package:kairiz3/Login/getuser.dart';
import 'Bottom/bottomnavbar.dart';
import 'Outlinebuttons.dart';
import 'addingTAsk/AddService.dart';
import 'fetching tasks.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {

   late Future<String?> _nameFuture;
  List<Map<String, dynamic>> allTasks = [];
  List<Map<String, dynamic>> tasks = [];
  String selectedButton = 'To Do'; // Default selected button
  FirestoreService firestoreService = FirestoreService();
  Fetchtotaltasks fetchtotaltasks = Fetchtotaltasks();

  int totalTasks = 0;
  int completedTasks = 0;

  @override
  void initState() {
    super.initState();
    Userdetails userdetails = Userdetails();
    _nameFuture = userdetails.getName();
    _fetchTasks();
    _fetchTaskCounts();
  }

  Future<void> _fetchTasks() async {
    List<Map<String, dynamic>> fetchedTasks = await firestoreService.getTasksByDate(DateTime.now());
    setState(() {
      allTasks = fetchedTasks;
      tasks = _filterTasks(fetchedTasks, selectedButton);
    });
  }

  Future<void> _fetchTaskCounts() async {
    int total = await fetchtotaltasks.getTotalTodayTasks();
    int completed = await fetchtotaltasks.getCompletedTodayTasks();
    setState(() {
      totalTasks = total;
      completedTasks = completed;
    });
  }

  List<Map<String, dynamic>> _filterTasks(List<Map<String, dynamic>> allTasks, String status) {
    if (status == 'To Do') {
      return allTasks;
    } else if (status == 'Remaining') {
      return allTasks.where((task) => task['Status'] != 'Completed').toList();
    } else if (status == 'Completed') {
      return allTasks.where((task) => task['Status'] == 'Completed').toList();
    }
    return [];
  }




  void _updateSelectedButton(String name) {
    setState(() {
      selectedButton = name;
      tasks = _filterTasks(allTasks, name);
    });
  }

  void deletetask(String taskId) async{
    bool? confirm = await showDialog(
        context: context,
        builder: (context) =>
    AlertDialog(
      title: Text('DeleteTask'),
      content: Text('Do you want to delete this task'),
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
    ));
    if(confirm==true){
      await firestoreService.deleteTask(taskId);
      _fetchTasks();
      _fetchTaskCounts();
    }
  }

  void _markTaskAsDone(String taskId) async {
    bool? confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Mark Task as Done'),
        content: Text('Is the task completed?'),
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
      await firestoreService.updateTaskStatus(taskId, 'Completed');
    }
    _fetchTasks();
    _fetchTaskCounts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleAvatar(
            child: Image(
              image: AssetImage('assets/avatar.jpeg'),
              height: 200,
              width: 200,
            ),
          )
        ],
      ),
      drawer: makedrawer(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              child: FutureBuilder<String?>(
                future: _nameFuture,
                builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    String? name = snapshot.data;
                    return Container(
                      height: 40,
                      child: Text(
                        'Hello ${name ?? "User"}!',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    );
                  } else {
                    return Text('Hello User');
                  }
                },
              ),
            ),
            Card(
              elevation: 10.0,
              color: Colors.pink,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.all(5),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today\'s Progress Summary',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(height: 10),
                          Text('$completedTasks of $totalTasks completed'),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    CircularProgressIndicator(
                      value: totalTasks == 0 ? 0 : completedTasks / totalTasks,
                      backgroundColor: Colors.grey,
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Task Overview',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  CustomOutlinedButton(
                    text: 'Today\'s Tasks',
                    bordercolor: Colors.pink,
                    isselected: selectedButton == 'To Do',
                    onpressed: () => _updateSelectedButton('To Do'),
                  ),
                  SizedBox(width: 15),
                  CustomOutlinedButton(
                    text: 'Remaining',
                    bordercolor: Colors.pink,
                    isselected: selectedButton == 'Remaining',
                    onpressed: () => _updateSelectedButton('Remaining'),
                  ),
                  SizedBox(width: 15),
                  CustomOutlinedButton(
                    text: 'Completed',
                    bordercolor: Colors.green,
                    isselected: selectedButton == 'Completed',
                    onpressed: () => _updateSelectedButton('Completed'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    if (selectedButton == 'To Do')
                      Container(
                      height:200,
                        width: 290,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2), // shadow color
                              spreadRadius: 3, // spread radius
                              blurRadius: 4, // blur radius
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Expanded(
                          child: Column(
                            children: [
                              Image(image: AssetImage('assets/todaystask.png')),
                              SizedBox(height: 10),
                              Text('Today\'s task summary'),

                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 10),
                    if (tasks.isEmpty)
                      Container(
                        height: 100,
                        width: 300,
                        alignment: Alignment.center,
                       margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2), // shadow color
                              spreadRadius: 3, // spread radius
                              blurRadius: 4, // blur radius
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Expanded(
                            child: Text("No tasks for today")
                        ),
                      )
                    else
                      ...tasks.map((task) => Container(

                        height: 100,
                        width: 290,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2), // shadow color
                              spreadRadius: 3, // spread radius
                              blurRadius: 4, // blur radius
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                            task['Title'],
                            style: TextStyle(
                              decoration: task['Status'] == 'Completed'
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),



                          subtitle: Text(task['Description']),
                          trailing:  task['Status']!= 'Completed'
                              ? TextButton(
                            onPressed: () => _markTaskAsDone(task['id']),
                            child: Text('Mark Done',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.pink
                            ),),
                          ) : null,

                        ),
                      )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

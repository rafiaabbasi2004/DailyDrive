import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class makedrawer extends StatefulWidget {
  const makedrawer({super.key});

  @override
  State<makedrawer> createState() => _makedrawerState();
}

class _makedrawerState extends State<makedrawer> {
  Future<Map<String, String?>> _fetchUserInfo() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        return {
          'name': userDoc['name'] as String?,
          'email': user.email,
        };
      }
    }
    return {'name': 'Guest', 'email': 'No email'};
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<Map<String, String?>>(
        future: _fetchUserInfo(),
        builder: (BuildContext context, AsyncSnapshot<Map<String, String?>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final userInfo = snapshot.data!;
            return Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(userInfo['name'] ?? 'User'),
                  accountEmail: Text(userInfo['email'] ?? 'No email'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/avatar.jpeg'), // Or use user profile picture if available
                  ),
                  decoration: BoxDecoration(
                    color: Colors.pink
                  )
                ),
                SizedBox(height: 20,),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                SizedBox(height: 20,),
                ListTile(
                  leading: Icon(Icons.task),
                  title: Text('Tasks'),
                  onTap: () {
                    Navigator.pushNamed(context, '/tasks');
                  },
                ),

                SizedBox(height: 20,),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                Spacer(),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ],
            );
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}

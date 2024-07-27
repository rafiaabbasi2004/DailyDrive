import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      // Log in the user with Firebase Auth
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logged in successfully!')),
      );
      Navigator.pushNamed(context, '/main');

      // Navigate to a different page if needed
      // Navigator.pushReplacementNamed(context, '/home');

    } catch (error) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${error.toString()}')),
      );
    }
  }

  void _forgotPassword() {
    final email = _emailController.text.trim();

    if (email.isNotEmpty) {
      _auth.sendPasswordResetEmail(email: email).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password reset email sent!')),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${error.toString()}')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your email address')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Daily Drive',
              style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.pink
              ),
              textAlign: TextAlign.center,
            ),

            Text('Login To start your journey',
              style: TextStyle(
                  fontSize: 15,
              ),),
            SizedBox(height: 20),
            Image.asset('assets/registerr.png'), // Replace with your image asset
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter Email',
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink, // Border color
                    width: 2.0, // Border thickness
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink, // Border color when focused
                    width: 2.0, // Border thickness when focused
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink, // Border color when enabled
                    width: 2.0, // Border thickness when enabled
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Enter Password',
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink, // Border color
                    width: 2.0, // Border thickness
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink, // Border color when focused
                    width: 2.0, // Border thickness when focused
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink, // Border color when enabled
                    width: 2.0, // Border thickness when enabled
                  ),
                ),
              ),
              obscureText: true,
            ),

           Container(
             width: 400,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            alignment: Alignment.centerRight,
            child:  TextButton(
               onPressed: _forgotPassword,
               child: Text(
                 'Forgot Password?',
                 style: TextStyle(
                   color: Colors.pink,
                   fontSize: 12,
                 ),
                 textAlign: TextAlign.right,
               ),
             ),
           ),





          //  SizedBox(height: 10),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink, // Button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),

         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text('Are you a new member?',
             style: TextStyle(
               fontSize: 12,
               color: Colors.pink,

             ),),
             TextButton(
               onPressed: () {
                 Navigator.pushNamed(context, '/register'); // Adjust route as needed
               },
               child: Text(
                 'Register now',
                 style: TextStyle(
                   color: Colors.pink,
                   fontSize: 14,
                 ),
               ),
             ),
           ],
         )
            ,
          ],
        ),
      ),
    );
  }
}

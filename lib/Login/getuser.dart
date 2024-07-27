import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Userdetails {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<String?> getName() async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Fetch the user document from Firestore
        DocumentSnapshot userDoc = await users.doc(user.uid).get();

        // Extract the name from the document
        if (userDoc.exists) {
          return userDoc['name'] as String?;
        } else {
          throw Exception('User document does not exist');
        }
      } else {
        throw Exception('No user is logged in');
      }
    } catch (e) {
      // Handle errors
      print('Error getting user name: $e');
      return null;
    }
  }
}

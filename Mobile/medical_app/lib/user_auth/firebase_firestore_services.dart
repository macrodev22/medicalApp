import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class CustomUser {
  const CustomUser(this.displayName, this.gender, this.userType, this.lungTests,
      this.healthStats);
  final String displayName;
  final String userType;
  final String gender;
  final List lungTests;
  final Map<String, dynamic> healthStats;

  CustomUser.fromJSON(Map<String, dynamic> json)
      : displayName = json['displayName']!,
        gender = json['gender']!,
        userType = json['userType']!,
        lungTests = json['lungTests'] ?? [],
        healthStats = json['healthStats'] ?? {'bloodCount': 'unmeasured'};
}

class FirebaseFirestoreServices {
  // static final var db = Firebase()
  // static final var collection = FirebaseFirestore.instance(db);
  static Future<CustomUser?> getUser(String uid) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(uid);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return CustomUser.fromJSON(snapshot.data()!);
    } else {
      return null;
    }
  }

  static Future<void> updateUserDetails(
      String userId, String field, newData) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({field: newData});
  }
}

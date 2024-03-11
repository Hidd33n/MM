import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CalculationService {
  final User? user;

  CalculationService({required this.user});

  Stream<QuerySnapshot> getCalculations() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('only')
        .snapshots();
  }

  Future<void> deleteCalculation(String docId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('only')
        .doc(docId)
        .delete();
  }
}

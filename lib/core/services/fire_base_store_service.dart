import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taswek/core/services/data_base.dart';

class FireBaseStoreService implements DataBaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String pathName,
    required Map<String, dynamic> data,
  }) async {
    if (data["userId"] != null) {
      await db.collection(pathName).doc(data["userId"]).set(data);
    } else {
      await db.collection(pathName).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String pathName,
    required String docId,
  }) async {
    final documentSnapshot = await db.collection(pathName).doc(docId).get();
    return documentSnapshot.data()!;
  }

  @override
  Future<List<Map<String, dynamic>>> getAllData({required String pathName}) async {
    final querySnapshot = await db.collection(pathName).get();
    return querySnapshot.docs.map((e) => e.data()).toList();
  }
}

abstract class DataBaseService {
  Future<void> addData({
    required String pathName,
    required Map<String, dynamic> data,
  });
  Future<Map<String, dynamic>> getData({
    required String pathName,
    required String docId,
  });
}
import 'package:book_store_manager/repositories/services/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserRepository {
  late UserService _userService;

  UserRepository() {
    _userService = UserService();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> userProfileStream(String uid) {
    return _userService.userProfileStream(uid);
  }

  Future<List<UserModel>> getAllUsers() async {
    return _userService.getAllUsers();
  }

  Future<Map<String, dynamic>> getUserOrderStatistic(String userId) async {
    return _userService.getUserOrderStatistic(userId);
  }
}

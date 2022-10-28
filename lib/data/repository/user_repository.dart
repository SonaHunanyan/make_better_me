import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:make_better_me/domain/entity/user.dart';
import 'package:make_better_me/domain/repository/user_repository.dart';

class UserRepository implements IUserRepository {
  final _collection = FirebaseFirestore.instance.collection('user');

  @override
  Future<void> addUser(User user) async {
    final userJson = user.toJson();
    await _collection.add(userJson).catchError((error) {
      throw Exception('Fail to add user $error');
    });
  }

  @override
  Future<User?> logIn(String username, String password) async {
    final userQuerySnapshot = await _collection
        .where('username', isEqualTo: username)
        .where('password', isEqualTo: password)
        .get()
        .catchError((error) {
      throw Exception('Fail to get products $error');
    });

    final userJson = userQuerySnapshot.docs;
    if (userJson.isEmpty) {
      return null;
    }
    final user = User.fromJson(userJson.first.data());
    return user;
  }
}

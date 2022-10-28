import 'package:make_better_me/domain/entity/user.dart';

abstract class IUserRepository {
  Future<void> addUser(User user);
  Future<User?> logIn(String username,String password);
}

import './../data_providers/auth_data_provider.dart';
import './../models/models.dart';


class AuthRepository {
  final AuthDataProvider dataProvider;
  AuthRepository(this.dataProvider);

  Future<SignUp> register(SignUp user,String url) async {
    return this.dataProvider.register(user, url);
  }
  Future<SignIn> login(SignIn user,String url) async {
    return this.dataProvider.login(user, url);
  }

  Future<String> emailRegistered(String email) async {
    return this.dataProvider.emailRegistered(email);
  }
}
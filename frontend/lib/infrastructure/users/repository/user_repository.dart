import './../data_providers/user_data_provider.dart';
import './../models/models.dart';


class UserRepository {
  final UsersDataProvider dataProvider;
  UserRepository(this.dataProvider);

  Future<User> create(User user,String url) async {
    return this.dataProvider.create(user, url);
  }
  Future<User> login(User user,String url) async {
    return this.dataProvider.login(user, url);
  }

  Future<User> update(String url, User user) async {
    return this.dataProvider.updatePassword(url, user);
  }

  Future<User> fetchById(String url) async {
    return this.dataProvider.fetchById(url);
  }

  Future<List<User>> fetchAll(String) async {
    return this.dataProvider.fetchAll();
  }
  // Future<User> fetchAll(String) async {
  //   return this.dataProvider.fetchAll();
  // }
  Future<User> search() async {
    return this.dataProvider.search();
  }

  Future<void> deactivate(String url) async {
    this.dataProvider.deactivate(url);
  }
}
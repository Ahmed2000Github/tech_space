import 'package:get/get.dart';
import 'package:tech_space/features/Landing/models/user_model.dart';

class UserViewModel extends GetxController {
  var user =
      UserModel(id: '1', name: 'John Doe', email: 'john.doe@example.com').obs;

  void updateUser(String name, String email) {
    user.update((val) {
      val?.name = name;
      val?.email = email;
    });
  }
}

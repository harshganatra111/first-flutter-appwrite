import 'package:appwrite/appwrite.dart';
import 'package:first_appwrite_app/core/res/app_constants.dart';
import 'package:flutter/foundation.dart';

class AuthState extends ChangeNotifier {
  Client client = Client();
  Account account;
  AuthState() {
    _init();
  }
  _init() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId);
    account = Account(client);
  }

  login(String email, String password) async {
    try {
      var result =
          await account.createSession(email: email, password: password);
      print(result);
    } catch (err) {
      print(err);
    }
  }
}

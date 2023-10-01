import 'package:curve_app/app/data/auth/registerResponseModel.dart';

import '../core/prefs.dart';
import '../core/prefs_keys.dart';

class ProfileServices {

  static get currentUser =>
      currentUserModel(Prefs.getMap(PrefsKeys.currentUser));

  static saveUserToken(String token) {
    Prefs.saveString(key: PrefsKeys.token, value: token);
  }

  static currentUserModel(Map<String, dynamic> userData) {
   return RegisterResponseModel.fromJson(userData);
  }

  static saveCurrentUser(Map<String, dynamic> userData) {
    final currentUser = currentUserModel(userData);
    Prefs.setMap(key: PrefsKeys.currentUser, object: currentUser.toJson());
    saveUserToken(currentUser.token);
  }


}
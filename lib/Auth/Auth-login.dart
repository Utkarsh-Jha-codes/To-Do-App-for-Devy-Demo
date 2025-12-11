import 'package:flutter/material.dart';

class AuthService {
  Future<bool> authenticateUser(String email, String password) async {
    // Temporary dummy logic to test navigation
    if (email == "test@gmail.com" && password == "123456") {
      return true;
    }
    return false;
  }
}

class AuthSignIn {
  Future<bool> SignInUser(String email, String password, String ConfirmPassword) async {
    // Temporary dummy logic to test navigation
    if (password == ConfirmPassword && email.contains("@")) {
      return true;
    }
    return false;
  }
}

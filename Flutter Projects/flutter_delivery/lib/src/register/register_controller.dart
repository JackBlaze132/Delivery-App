import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterController{
  BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  Future init(BuildContext context){
    this.context = context;
  }

  void register(){
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print(email);
    print(name);
    print(lastName);
    print(phone);
    print(password);
    print(confirmPassword);
  }
}
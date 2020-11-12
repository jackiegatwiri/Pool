import 'dart:convert';

import 'package:Pool/models/signUpResponseModel.dart';
import 'package:Pool/models/validateForms/validateLoginDetailsModel.dart';
import 'package:Pool/utils/apiCall.dart';
import 'package:Pool/viewModels/validateLogin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Pool/utils/constants.dart' as constants;

enum SignUpState { Busy, Idle, Error }

class SignUpViewModel with ChangeNotifier {
  SignUpState _signUpState = SignUpState.Idle;
  String emailInput;
  String passInput;
  String mobile;
  String confirmPassword;
  bool isSuccess = false;

  void setSignUpState(SignUpState signUpState) {
    _signUpState = signUpState;
    notifyListeners();
  }

  SignUpState get getSignUpState => _signUpState;

  Future<bool> postSignUpDetails() async {
    if (isValid) {
      setSignUpState(SignUpState.Busy);
      try {
        Map<String, String> hashmap = {
          "email": emailInput,
          "password": passInput,
          "mobile": mobile,
          "confirmPassword": confirmPassword
        };

        http.Response response =
            await ApiCall().sendPost(constants.signUp, hashmap);

        if (response.statusCode == 200) {
          SignUpResponseModel _signUpResponseModel =
              SignUpResponseModel.fromJson(json.decode(response.body));

          if (_signUpResponseModel.isSuccessful) {
            isSuccess = true;
          }
        } else {
          print("failed");
        }
      } catch (error) {
        print(error);
      }
    } else {
      print("not valid");
    }
    setSignUpState(SignUpState.Idle);
    print(isSuccess);
    return isSuccess;
  }

  ValidateLoginDetail _email = ValidateLoginDetail(null, null);
  ValidateLoginDetail _password = ValidateLoginDetail(null, null);
  ValidateLoginDetail _mobile = ValidateLoginDetail(null, null);
  ValidateLoginDetail _confirmPassword = ValidateLoginDetail(null, null);

  //Getters
  ValidateLoginDetail get email => _email;
  ValidateLoginDetail get password => _password;

  bool get isValid {
    if (_email.value != null && _password.value != null && _mobile != null) {
      emailInput = _email.value;
      passInput = _password.value;
      mobile = _mobile.value;
      confirmPassword = _confirmPassword.value;
      return true;
    } else {
      return false;
    }
  }

//Setters
  void changeEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(value)) {
      _email = ValidateLoginDetail(value, null);
    } else {
      _email = ValidateLoginDetail(null, "Must be at least 3 characters");
    }
    notifyListeners();
  }

  void chnagePassword(String value) {
    if (value.length >= 3) {
      _password = ValidateLoginDetail(value, null);
    } else {
      _password = ValidateLoginDetail(null, "Must be at least 4 characters");
    }
    notifyListeners();
  }

  void confirmPaasowrd(String value) {
    if (value != _password.value) {
      _confirmPassword = ValidateLoginDetail(value, null);
    } else {
      _confirmPassword = ValidateLoginDetail(null, "Passwords must match!!");
    }
    notifyListeners();
  }

  void saveName(String value) {
    if (value.length != null) {
      _mobile = ValidateLoginDetail(value, null);
    } else {
      _mobile = ValidateLoginDetail(null, "Name is reqiured");
    }
    notifyListeners();
  }

  void submitData() {}

  bool get isSuccessful => isSuccess;
}

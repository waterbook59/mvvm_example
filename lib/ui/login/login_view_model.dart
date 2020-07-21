import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm_example/ui/util/event.dart';
import 'package:mvvm_example/ui/util/state.dart';

class LoginViewModel extends ChangeNotifier {
  var _uiState = UiState.Idle;
  UiState get uiState => _uiState;

  bool get isLogging => uiState == UiState.Loading;

  var _loginSuccessAction = StreamController<String>.broadcast();
  StreamController<String> get loginSuccessAction => _loginSuccessAction;

  void login() {
    _uiState = UiState.Loading;
    notifyListeners();

    Future.delayed(Duration(milliseconds: 750)).then((_) {
      // Login Success!
      _uiState = UiState.Loaded;
      notifyListeners();

      _loginSuccessAction.sink.add("この後pushReplacementでhomePageへ");
      print("sink.addした後");
    });
  }

  @override
  void dispose() {
    _loginSuccessAction.close();

    super.dispose();
  }
}

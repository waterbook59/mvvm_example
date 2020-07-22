import 'package:flutter/material.dart';
import 'package:mvvm_example/ui/home/home_page.dart';
import 'package:mvvm_example/ui/login/login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("LoginPageのbuild内:$context");
    return
//      MultiProvider(
//      providers: [
//        // Injects LoginViewModel into this widgets.
//        ChangeNotifierProvider(create: (_) => LoginViewModel()),
//      ],
//      child:
      Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: _LoginPageBody(),
//      ),
    );
  }
}

class _LoginPageBody extends StatefulWidget {
  @override
  __LoginPageBodyState createState() => __LoginPageBodyState();
}

class __LoginPageBodyState extends State<_LoginPageBody> {
  @override
  void initState() {
    super.initState();
    print("__LoginPageBodyStateのinitStateの中：$context");

    // Listen events by view model.
    var viewModel = Provider.of<LoginViewModel>(context, listen: false);
    viewModel.loginSuccessAction.stream.listen((st) {
      print("__LoginPageBodyStateのinitStateでProviderのcontext:$context");//2回目にここがnullになってる
      print(st);
      Toast.show("ログイン完了！", context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=>HomePage())
      );
//      print("pushReplacementの後:${viewModel.uiState}");
//      Navigator.of(context).pushReplacementNamed("/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LoginViewModel>(context, listen: false);
//    print("LoginPageBodyStateのbuild内:${viewModel.uiState}");
    print("__LoginPageBodyStateのbuild内:$context");

    return Center(
      child: _LoginButton(),
    );
  }
}

class _LoginButton extends StatelessWidget {
  String _getButtonText(LoginViewModel vm) =>
      vm.isLogging ? "Wait..." : "Login";

  VoidCallback _onPressed(LoginViewModel vm,context) {
    if (vm.isLogging) {
      // When returning null, the button become disabled.
      return null;
    } else {
      return () {
        print("Consumer下のLoginボタンonPressed押したとき:$context");
        vm.login();
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    print(" _LoginButtonのbuild内:$context");
    return Consumer<LoginViewModel>(
      builder: (context, viewModel, _) {
        return RaisedButton(
          child: Text(_getButtonText(viewModel)),
          onPressed: _onPressed(viewModel,context),
        );
      },
    );
  }
}

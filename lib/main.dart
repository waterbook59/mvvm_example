import 'package:flutter/material.dart';
import 'package:mvvm_example/ui/home/home_page.dart';
import 'package:mvvm_example/ui/home/home_view_model.dart';
import 'package:mvvm_example/ui/login/login_page.dart';
import 'package:mvvm_example/ui/login/login_view_model.dart';
import 'package:provider/provider.dart';



void main() => runApp(MyApp());

//runApp内にChangeNotifierProviderを持ってきたらエラー!!!!!!!!
//void main() {
//  runApp(
//      MultiProvider(
//          providers: [
//            ChangeNotifierProvider(create: (_) => HomeViewModel()
//            ),
//            ChangeNotifierProvider(create: (_) => LoginViewModel()
//            ),
//          ],
//          child:MyApp(),
//      )
//      );
//
//}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      //ルートを作らなくてもうまくいく
//      initialRoute: "/home",
//      routes: <String, WidgetBuilder>{
//        "/home": (BuildContext context) => HomePage(),
//        "/": (BuildContext context) => LoginPage(),
//      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:market/pages/login_page.dart';
import 'package:market/pages/product/products_page.dart';
import 'package:market/pages/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomAppBarColor: Color(0xFFCDDC39),
        accentColor: Color(0xFFFF5722) ,
        primaryColorDark: Color(0xFFE91E63),
        primaryColor: Color(0xFFE1BEE7),
        textTheme: TextTheme(
        headline1: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold, color: Colors.pink[100]),
        headline3: TextStyle(fontSize: 15.0),
        headline6: TextStyle(fontSize: 12.0),
        bodyText1: TextStyle(fontSize: 14.0), 
        bodyText2: TextStyle(fontWeight: FontWeight.bold,
        color: Colors.pink[100])),
        brightness: Brightness.dark
      ),
      title: 'Tienda en Linea',
      initialRoute: LoginPage.ROUTE,
      routes: {
        ProductsPage.ROUTE : (_) => ProductsPage(),
        LoginPage.ROUTE : (_) => LoginPage(),
        RegisterPage.ROUTE : (_) => RegisterPage(),
 },
    );
  }
}

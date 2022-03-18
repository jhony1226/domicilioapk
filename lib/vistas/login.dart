import 'dart:convert';

import 'package:appdomiicilios/util/header_widget.dart';
import 'package:appdomiicilios/util/theme_helper.dart';
import 'package:appdomiicilios/vistas/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../util/AuthAPI.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  var glovalkey = GlobalKey<ScaffoldState>();
  AuthAPI _authAPI = AuthAPI();
  double _headerHeight = 300;
  Key _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<http.Response> login(String email, String password) async {
    //print("${ApiStrings.url_local}/user/login - ${email}- ${password}" );
    String body = jsonEncode(<String, String>{'email': email, 'password': password});
    http.Response response = await http
        .post(Uri.parse("http://localhost:8081/api/user/login"),
        headers: {
     // 'Authorization': 'bearer ' + token,
      'Content-Type': 'application/json'
    }, body: body);
    return response;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(
              builder: (context) => Home(),
            ),
            (Route<dynamic> route) => false),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: _headerHeight,
                  child: HeaderWidget(
                      _headerHeight,
                      true,
                      Icons
                          .account_circle_sharp), //let's create a common header widget
                ),
                SafeArea(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      margin: EdgeInsets.fromLTRB(
                          20, 10, 20, 10), // This will be the login form
                      child: Column(
                        children: [
                          Text(
                            'App Domicilios',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Ingresa usuario y clave',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 30.0),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: ThemeHelper()
                                        .inputBoxDecorationShaddow(),
                                    child: TextField(
                                      decoration: ThemeHelper()
                                          .textInputDecoration(
                                              'User Name', 'Ingrese Usuario'),
                                      controller: email,
                                      autofocus: true,
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                  SizedBox(height: 30.0),
                                  Container(
                                    decoration: ThemeHelper()
                                        .inputBoxDecorationShaddow(),
                                    child: TextField(
                                      obscureText: true,
                                      decoration: ThemeHelper()
                                          .textInputDecoration(
                                              'Password', 'Ingrese password'),
                                      controller: password,
                                    ),
                                  ),
                                  SizedBox(height: 15.0),
                                  Container(
                                    decoration: ThemeHelper()
                                        .buttonBoxDecoration(context),
                                    child: ElevatedButton(
                                      style: ThemeHelper().buttonStyle(),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(40, 10, 40, 10),
                                        child: Text(
                                          'Sign In'.toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      onPressed: () async {
                                        try {
                                          var req = await  login(
                                              email.text, password.text);
                                          print(req.body);
                                          if (req.statusCode == 200) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Home())
                                            );
                                          }
                                        } catch (err) {
                                          print(err);
                                        }
                                        // this.getUser();

                                      },
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}

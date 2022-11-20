// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:getapi/screens2/dashboard.dart';

import 'package:http/http.dart';

class MartverseLoginScreen extends StatefulWidget {
  static const id = "loginScreen";
  const MartverseLoginScreen({super.key});

  @override
  State<MartverseLoginScreen> createState() => _MartverseLoginScreenState();
}

class _MartverseLoginScreenState extends State<MartverseLoginScreen> {
  void loginProvider(String email, String password) async {
    try {
      Response response = await post(
          Uri.parse(
              "https://marktestapp.pythonanywhere.com/api/auth/rider/login/"),
          body: {"email": "staff2@exarth.com", "password": "poiuy098765"});

      print(response.statusCode);

      if (response.statusCode == 200) {
        print("Success");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  bool isChecked = false;
  String login = '';
  String password = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/mobile-bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/logo-red-1000.png",
                width: 150,
                height: 200,

                // fit: BoxFit.contain,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextField(
                  controller: emailController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'login',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    login = value;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextField(
                  controller: passwordNameController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  loginProvider(emailController.text.toString(),
                      passwordNameController.text.toString());
                  Navigator.pushNamed(context, DashboardRed.id);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 50.0,
                  ),
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

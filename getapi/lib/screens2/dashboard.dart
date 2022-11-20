// ignore_for_file: avoid_print, unused_element

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/Model/deliverymodel.dart';
import 'package:getapi/Model/profile_model.dart';
import 'package:getapi/screens2/login.dart';
import 'package:http/http.dart' as http;

class DashboardRed extends StatefulWidget {
  static const id = "dashboardred";
  const DashboardRed({super.key});

  @override
  State<DashboardRed> createState() => _DashboardRedState();
}

class _DashboardRedState extends State<DashboardRed> {
// DeliveryList Api

  Future<DeliverlistModel> getDeliverListApi() async {
    final resonse = await http.get(
      Uri.parse("https://marktestapp.pythonanywhere.com/api/my/delivery/"),
      headers: {
        'authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY5MDE1NTQ3LCJpYXQiOjE2Njg5MjkxNDcsImp0aSI6ImU5MDIyNGI5YzFiNTQxODQ4YTg0YzU0MDVmNWIzNjUyIiwidXNlcl9pZCI6Ijc1ZGY1NDFlLTQ4NDMtNDZiYS1iMjg0LTAxNDAzNzI1NDZmZCJ9.r7AH7ZzqW2gbwuqFX01gHr96c85Ilx7rmu7kQWlN6ig',
      },
    );
    var data = jsonDecode(resonse.body.toString());

    // print(resonse.statusCode);
    print(resonse.body);

    if (resonse.statusCode == 200) {
      DeliverlistModel deliverlistModel = DeliverlistModel.fromJson(data);
      // print(resonse.statusCode);
      // print("sheraz you failed for dashboard profile");
      return deliverlistModel;
      print(deliverlistModel.count);
    } else {
      return DeliverlistModel.fromJson(data);
    }
  }

  // profile API
  Future<ProfileListModel> getProfileApi() async {
    final resonse = await http.get(
      Uri.parse("https://marktestapp.pythonanywhere.com/api/my/profile/"),
      headers: {
        'authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY5MDE1NTQ3LCJpYXQiOjE2Njg5MjkxNDcsImp0aSI6ImU5MDIyNGI5YzFiNTQxODQ4YTg0YzU0MDVmNWIzNjUyIiwidXNlcl9pZCI6Ijc1ZGY1NDFlLTQ4NDMtNDZiYS1iMjg0LTAxNDAzNzI1NDZmZCJ9.r7AH7ZzqW2gbwuqFX01gHr96c85Ilx7rmu7kQWlN6ig',
      },
    );
    var data = jsonDecode(resonse.body.toString());

    // print(resonse.statusCode);
    print(resonse.body);

    if (resonse.statusCode == 200) {
      ProfileListModel profileListModel = ProfileListModel.fromJson(data);
      // print(resonse.statusCode);
      // print("sheraz you failed for dashboard profile");
      return profileListModel;
    } else {
      return ProfileListModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Dashboard Screen",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.logout_outlined,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              tooltip: 'Show Snackbar',
              onPressed: () {
                Navigator.pushNamed(context, MartverseLoginScreen.id);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('You successfully Logout')));
              },
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 141, 5, 5),
        ),
        body: Column(children: [
          const SizedBox(
            height: 15,
          ),
          const Text("MartVerse Dashboard ",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 141, 5, 5),
              )),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: FutureBuilder<ProfileListModel>(
              future: getProfileApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: Colors.grey,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Color.fromARGB(
                                  255, 157, 154, 154), //<-- SEE HERE
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: const Color(0xffffffff),
                          child: ListTile(
                            leading: Text(snapshot.data!.username.toString(),
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 1, 1, 1))),
                            title: Text(
                              snapshot.data!.email.toString(),
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            trailing: InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.person_outline_sharp,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                )),
                            subtitle: Text(
                              snapshot.data!.phoneNumber.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            selected: true,
                            onTap: () {
                              setState(() {
                                getProfileApi();
                              });
                            },
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  print("error in profile ");
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
          Image.asset(
            "images/warehouse.gif",
            height: 425.0,
            width: 625.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              //<-- SEE HERE
            ),
//Deliverlist Api
          ),
          Center(
            child: FutureBuilder<DeliverlistModel>(
              future: getDeliverListApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: Colors.grey,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Color.fromARGB(
                                  255, 157, 154, 154), //<-- SEE HERE
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: const Color(0xffffffff),
                          child: ListTile(
                            leading: Text("Delivery${snapshot.data!.count}",
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 1, 1, 1))),
                            title: Text(
                              snapshot.data!.results![0]["order"]["id"]
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            trailing: const Text(
                              "100 Dollor",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                            ),
                            selected: true,
                            onTap: () {
                              setState(() {
                                getProfileApi();
                              });
                            },
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  print("error in profile ");
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              print("Doing everything");
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              disabledForegroundColor: Colors.blue.withOpacity(0.38),
              disabledBackgroundColor: Colors.blue.withOpacity(0.12),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              minimumSize: const Size(400, 80), // surface color
              shadowColor: Colors.grey,
              elevation: 3,
              side: const BorderSide(
                  color: Color.fromARGB(255, 157, 154, 154),
                  width: 2,
                  style: BorderStyle.solid),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),

              tapTargetSize: MaterialTapTargetSize.padded,
            ),
            child: const Text(
              "Delivery Done",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ]));
    //     ],
    //   ),
    // )
  }
}

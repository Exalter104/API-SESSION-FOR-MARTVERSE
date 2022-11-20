// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/Model/profile_model.dart';
import 'package:getapi/Screen/profile_update.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  static const id = "profile";
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<ProfileListModel> deliverlistmodel2;

  @override
  void initState() {
    super.initState();

    deliverlistmodel2 = getApi();
    print(deliverlistmodel2);
  }

  //put update profile

//get profile
  Future<ProfileListModel> getApi() async {
    final resonse = await http.get(
      Uri.parse("https://marktestapp.pythonanywhere.com/api/my/profile/"),
      headers: {
        'authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY4NjYyMDQ2LCJpYXQiOjE2Njg1NzU2NDYsImp0aSI6IjZhNWIyOWIyNjY3MzRkM2U5NzY2NTYwN2YxYzc1NmMwIiwidXNlcl9pZCI6Ijc1ZGY1NDFlLTQ4NDMtNDZiYS1iMjg0LTAxNDAzNzI1NDZmZCJ9.HctsoeRCpGXV9oHcpwcTt039rbhg-_0EiXsQZU1lhCY',
      },
    );
    var data = jsonDecode(resonse.body.toString());

    // print(resonse.statusCode);
    // print(resonse.body);

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
      backgroundColor: const Color.fromARGB(255, 128, 106, 106),
      appBar: AppBar(
        title: const Text("Login Screen"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 200, 0, 0),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FutureBuilder<ProfileListModel>(
              future: getApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.white, //<-- SEE HERE
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: const Color.fromARGB(255, 255, 0, 0),
                          child: ListTile(
                            leading: Text(snapshot.data!.firstName.toString(),
                                style: const TextStyle(color: Colors.white)),
                            title: Text(
                              snapshot.data!.email.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            trailing: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ProfileUpdate.id);
                                  print("button for update profile");
                                },
                                child: const Icon(
                                  Icons.person_outline_sharp,
                                  color: Colors.white,
                                )),
                            subtitle: Text(
                              snapshot.data!.phoneNumber.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            selected: true,
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
          Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              //<-- SEE HERE
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "images/warehouse3.gif",
                  width: 900,
                  height: 400,

                  // fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

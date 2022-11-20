// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:getapi/Screen/dashboard_screen.dart';
import 'package:http/http.dart';

class ProfileUpdate extends StatefulWidget {
  static const id = "profileUpate";
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

void updateProfile(String username, String firstName, String lastName,
    String phoneNumber, String email, String nic) async {
  try {
    Response response = await put(
      Uri.parse("https://marktestapp.pythonanywhere.com/api/my/profile/"),
      headers: {
        'authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY4NjYyMDQ2LCJpYXQiOjE2Njg1NzU2NDYsImp0aSI6IjZhNWIyOWIyNjY3MzRkM2U5NzY2NTYwN2YxYzc1NmMwIiwidXNlcl9pZCI6Ijc1ZGY1NDFlLTQ4NDMtNDZiYS1iMjg0LTAxNDAzNzI1NDZmZCJ9.HctsoeRCpGXV9oHcpwcTt039rbhg-_0EiXsQZU1lhCY',
      },
      body: {
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "email": email,
        "nic": nic,
      },
    );
    // print(response.statusCode);
    // print(response.body);
    // print(response.body);
    if (response.statusCode == 200) {
      print("update profile Successfully");
    } else {
      print("upadte profile faileds");
    }
  } catch (e) {
    print(e.toString());
  }
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 169, 169),
      appBar: AppBar(
        title: const Text("Profile Update"),
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
        backgroundColor: const Color.fromARGB(255, 47, 48, 47),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: "username",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                hintText: "firstname",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(hintText: "lastname"),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: phoneNumberController,
              decoration: const InputDecoration(
                hintText: "phone",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "email",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: nicController,
              decoration: const InputDecoration(
                hintText: "nic",
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                updateProfile(
                    usernameController.text.toString(),
                    firstNameController.text.toString(),
                    lastNameController.text.toString(),
                    phoneNumberController.text.toString(),
                    emailController.text.toString(),
                    nicController.text.toString());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreen()));
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(child: Text("upadte ")),
              ),
            )
          ],
        ),
      ),
    );
  }
}

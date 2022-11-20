// import 'package:flutter/material.dart';
// import 'package:getapi/Model/profile_model.dart';
// import 'dart:convert';

// import 'package:getapi/Model/delivery_model.dart';
// import 'package:http/http.dart' as http;

// class MyProfileList extends StatefulWidget {
//   const MyProfileList({super.key});

//   @override
//   State<MyProfileList> createState() => _MyProfileListState();
// }

// class _MyProfileListState extends State<MyProfileList> {
//   Future<ProfileListModel> getApi() async {
//     final resonse = await http.get(
//       Uri.parse("https://marktestapp.pythonanywhere.com/api/my/profile/"),
//       headers: {
//         'authorization':
//             'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY4Mzc2MzAwLCJpYXQiOjE2NjgyODk5MDAsImp0aSI6IjRiYTMyNjgyOGU3NDQ3NDU5YzNiZTM0ZTBkMDEwZmQ3IiwidXNlcl9pZCI6Ijc1ZGY1NDFlLTQ4NDMtNDZiYS1iMjg0LTAxNDAzNzI1NDZmZCJ9.uS3Dx0IrmxYYRQogHlKP3LeypiO0i98DwgK6wox3epQ',
//       },
//     );
//     var data = jsonDecode(resonse.body.toString());

//     print(resonse.statusCode);
//     print(resonse.body);

//     if (resonse.statusCode == 200) {
//       DeliverListModel deliverListModel = DeliverListModel.fromJson(data);
//       print(deliverListModel.results);
//       print(deliverListModel.count);
//       return deliverListModel;
//     } else {
//       return DeliverListModel.fromJson(data);
//     }
//   }

//   late Future<DeliverListModel> deliverlistmodel2;

//   @override
//   void initState() {
//     super.initState();

//     deliverlistmodel2 = getApi();
//     print(deliverlistmodel2);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("GET API")),
//       body: Center(
//         child: FutureBuilder<DeliverListModel>(
//           future: deliverlistmodel2,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(itemBuilder: (context, index) {
//                 return Text(snapshot.data!.count.toString());
//               });
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }

//             // By default, show a loading spinner.
//             return const CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import '../models/postmodel/usermodel.dart';

class HomePageTwo extends StatefulWidget {
  const HomePageTwo({Key? key}) : super(key: key);

  @override
  State<HomePageTwo> createState() => _HomePageTwoState();
}

class _HomePageTwoState extends State<HomePageTwo> {
  List<UserModel> UserList = [];
  Future<List<UserModel>> getUserList() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        UserList.add(UserModel.fromJson(i));
      }
    }
    return UserList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Integration'),
      ),
      body: Column(children: [
        Expanded(
            child: FutureBuilder(
                future: getUserList(),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        itemCount: UserList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  ReusableRow(
                                      title: 'Name : ',
                                      value: snapshot.data![index].name
                                          .toString()),
                                  ReusableRow(
                                      title: 'Username : ',
                                      value: snapshot.data![index].username
                                          .toString()),
                                  ReusableRow(
                                      title: 'Email : ',
                                      value: snapshot.data![index].email
                                          .toString()),
                                  ReusableRow(
                                      title: 'Address : ',
                                      value: snapshot.data![index].address!.city
                                              .toString() +
                                          ', ' +
                                          snapshot.data![index].address!.geo
                                              .toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }))
      ]),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title),
        Text(value),
      ]),
    );
  }
}

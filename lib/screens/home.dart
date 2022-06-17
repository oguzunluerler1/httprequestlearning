import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jason/models/User.dart';
import 'package:jason/models/User2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  Uri url = Uri.parse("https://togla-e9630-default-rtdb.europe-west1.firebasedatabase.app/Kullanici.json");
  List<User2> UserList = [];
  bool isLoading = false;
  void getUser () async {
    isLoading = true;
    var response = await http.get(url);
    print(response.body);
    List<User2> responseBody = (jsonDecode(response.body) as List).map((e) => User2.fromJson(e)).toList();
    print(responseBody[0].isim);
    UserList = responseBody;
    isLoading = false;
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  // List<User> UserList = [];
  // void getUser() async {
  //   Uri url = Uri.parse("https://togal-14a52-default-rtdb.europe-west1.firebasedatabase.app/Users.json");
  //   var response = await http.get(url);
  //   List<User> responseBody = (jsonDecode(response.body) as List).map((e) => User.fromJson(e)).toList();
  //   UserList = responseBody;
  //   print(response.body);
  //   print(jsonDecode(response.body));
  //   // print(responseBody);
  //   // print(responseBody[1]["soyisim"]);
  //   print(UserList[0].isim);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getUser();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: bodyMethod(),
    );
  }

  Widget bodyMethod() {
    return Container(
      color: Colors.blue.shade100,
      child: (isLoading==false)?
      Column(
        children: UserList.map((e) => Card(
            child: ListTile(
              title: Text("${e.isim}"),
              subtitle: Text("${e.soyisim}"),
              trailing: Text("${e.isim}", style: TextStyle(backgroundColor: Colors.amber),),
            ),
          )).toList(),
      )
      : Center(child: CircularProgressIndicator()),
    );
  }
}
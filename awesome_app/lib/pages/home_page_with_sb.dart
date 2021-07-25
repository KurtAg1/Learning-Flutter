import 'package:awesome_app/widgets/drawer.dart';
import 'package:awesome_app/pages/login_page.dart';
import 'package:awesome_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageSB extends StatelessWidget {
  Future<List<dynamic>> fetchData() async {
    final url = "https://jsonplaceholder.typicode.com/photos";
    var res = await http.get(Uri.parse(url));
    var data = jsonDecode(res.body);
    return data;
  }

  Stream<List<String>> getStream() {
    var data = Stream<List<String>>.fromIterable(
        [List<String>.generate(20, (index) => ("Item $index"))]);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome App"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Constants.prefs!.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: StreamBuilder<List<dynamic>>(
        stream: getStream(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text("Fetch something"),
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Some error occured"),
                );
              }
              List<dynamic>? data = snapshot.data;
              return data != null
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(data[index]),
                        );
                      },
                      itemCount: data.length,
                    )
                  : Text("Error!");
          }
        },
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // myText = _nameController.text;
          // setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

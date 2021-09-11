import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main(List<String> args) {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List usersData = [];
  String uri = 'https://rickandmortyapi.com/api/character?page=1';

  getUsersRickAndMortyAPI() async {
    Map data;

    http.Response res = await http.get(Uri.parse(uri));
    //debugPrint(res.body);

    data = json.decode(res.body);

    setState(() {
      usersData = data['results'];
    });
  }

  @override
  void initState() {
    super.initState();
    getUsersRickAndMortyAPI();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "...To Live Is To Risk It All...",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                      backgroundColor: Colors.green[100],
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: usersData.length,
              itemBuilder: (BuildContext context, int index) {
                return Wrap(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "${usersData[index]["id"]}",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(usersData[index]["image"]),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "${usersData[index]["name"]} ${usersData[index]["species"]}",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black87),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

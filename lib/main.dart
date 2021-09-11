import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

int _pageNum = 1;
int _totalItems = 0;
List usersData = [];

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
  getUsersRickAndMortyAPI() async {
    String uri = 'https://rickandmortyapi.com/api/character?page=$_pageNum';
    http.Response res = await http.get(Uri.parse(uri));
    //debugPrint(res.body);
    Map data;

    data = json.decode(res.body);
    //
    usersData == []
        ? usersData = data["results"]
        : usersData.addAll(data["results"]);

    setState(() {
      //usersData = data['results'];
      _totalItems = usersData.length;
    });
  }

  @override
  void initState() {
    super.initState();
    getUsersRickAndMortyAPI();
  }

  /*Widget createListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _totalItems,
      itemBuilder: (BuildContext context, int index) {
        if (index >= data["results"].length - 1) {
          _pageNum++;
          getUsersRickAndMortyAPI();
        }
      },
    );
  }*/

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
                  "($_pageNum)...To Live Is To Risk It All...",
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
              shrinkWrap: true,
              //scrollDirection: Axis.horizontal,
              itemCount: _totalItems, //usersData.length,
              itemBuilder: (BuildContext context, int index) {
                if (index >= usersData.length - 1) {
                  _pageNum++;
                  getUsersRickAndMortyAPI();
                }
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

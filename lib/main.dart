import 'dart:convert';

import 'package:flutter/material.dart';
import './movie_player_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '11',
        home: Scaffold(
          appBar: AppBar(
            title: Text('da'),
          ),
          body: Center(
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString("assets/movies.json"),
                builder: (context, data) {
                  List list = json.decode(data.data.toString());

                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return MoviePlayer(url: list[index]['url'],);
                              }));
                              print(index);
                            },
                            title: Text("${list[index]['title']}"));
                      });
                }),
          ),
        ),
      ),
    );
  }
}

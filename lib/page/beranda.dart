import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'detail.dart';

class Beranda extends StatelessWidget {
  Future<List> getData() async {
    final response = await http.get("http://10.0.2.2/resep/api/all_recipes");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (snapshot.hasData) {
            return Container(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.red,
                    floating: true,
                    pinned: false,
                    flexibleSpace: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "CHICKEN RECIPES",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int i) {
                        return _listItem(context, snapshot.data, i);
                      },
                      childCount: snapshot.data.length,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return new Center(
              child: new CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}

Widget _listItem(context, list, i) {
  return GestureDetector(
    child: Padding(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context) => new Detail(
              list: list,
              i: i,
            ),
          ),
        ),
        child: Card(
          elevation: 5.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 50,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0)),
                      child: Hero(
                        tag: i,
                        child: FadeInImage(
                          image: NetworkImage(list[i]['img']),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 130,
                          placeholder: AssetImage('assets/images/loading.gif'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: 170,
                        color: Colors.black54,
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        child: Text(
                          list[i]['title'],
                          style: TextStyle(fontSize: 17, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.schedule,
                            color: Colors.deepPurple,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            list[i]['time'],
                            style: TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.pink,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

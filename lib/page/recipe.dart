import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'detail.dart';

class RecipeHome extends StatelessWidget {
  Future<List> getData() async {
    final response = await http.get("http://10.0.2.2/resep/api/all_recipes");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Chicken Recipes"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              leading: Text(
                "New Recipes",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(child: _slide(context)),
            ListTile(
              leading: Text(
                "All Recipes",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _grid(context),
          ],
        ),
      ),
    );
  }

  Widget _slide(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
      height: MediaQuery.of(context).size.width * 0.34,
      child: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (snapshot.hasData) {
            return Container(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int i) {
                  var list = snapshot.data[i];
                  return GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context) => new Detail(
                              list: snapshot.data,
                              i: i,
                            ),
                          ),
                        ),
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                          bottomLeft: Radius.circular(8.0),
                                          bottomRight: Radius.circular(8.0)),
                                      child: Hero(
                                        tag: list['id_recipe'],
                                        child: FadeInImage(
                                          image: NetworkImage(list['img']),
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 119,
                                          placeholder: AssetImage(
                                              'assets/images/loading.gif'),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      left: 1,
                                      child: Container(
                                        width: 100,
                                        color: Colors.black54,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5,
                                          horizontal: 5,
                                        ),
                                        child: Text(
                                          list['title'],
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white),
                                          softWrap: true,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(child: new CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _grid(context) {
    return Expanded(
      child: Container(
        child: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            if (snapshot.hasData) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, int i) {
                  var list = snapshot.data[i];
                  return GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context) => new Detail(
                              list: snapshot.data,
                              i: i,
                            ),
                          ),
                        ),
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
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
                                          image: NetworkImage(list['img']),
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 130,
                                          placeholder: AssetImage(
                                              'assets/images/loading.gif'),
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
                                          list['title'],
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                            list['time'],
                                            style: TextStyle(
                                                color: Colors.black87),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          IconButton(
                                            onPressed: () {
                                              print(list['id_recipe']);
                                            },
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
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

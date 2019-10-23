import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Detail extends StatefulWidget {
  final List list;
  final int i;
  Detail({this.i, this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScroll) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              title: Text(widget.list[widget.i]['title']),
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.i,
                  child: FadeInImage(
                    image: NetworkImage(widget.list[widget.i]['img']),
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/images/loading.gif'),
                  ),
                ),
              ),
            )
          ];
        },
        body: Container(
          padding: EdgeInsets.only(top: 1.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Text(
                    'Steps',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Steps(widget.list[widget.i]['id_recipe']),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Steps extends StatelessWidget {
  final String id;
  Steps(this.id);

  Future<List> getSteps() async {
    final response = await http.get("http://10.0.2.2/resep/api/steps?id=" + id);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getSteps(),
      builder: (context, snapsteps) {
        if (snapsteps.hasError) print(snapsteps.error);
        if (snapsteps.hasData) {
          return ListView.builder(
            itemCount: snapsteps.data.length,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              var steps = snapsteps.data[i];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text(
                        '${i + 1}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          steps['steps'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

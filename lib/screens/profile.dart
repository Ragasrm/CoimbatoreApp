// import 'package:flutter/material.dart';

// class Profile extends StatelessWidget {
//   final String title;
//   Profile({this.title});


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Text('Namste!')
//     );
//   }
// }


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Profile extends StatelessWidget {
  // final String title;
  final Map<String, dynamic> data;
  Profile({this.data});
  @override
  Widget build(BuildContext context) {
    print(this.data);
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    // final String imgUrl = 'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg';
    final String imgUrl = data['image'];

    return new Stack(children: <Widget>[
      new Container(color: Colors.blue,),
      // new Image.asset(imgUrl, fit: BoxFit.fill,),
      // new BackdropFilter(
      //   filter: new ui.ImageFilter.blur(
      //     sigmaX: 6.0,
      //     sigmaY: 6.0,
      //   ),
      //   child: new Container(
      //     decoration: BoxDecoration(
      //       color:  Colors.blue.withOpacity(0.9),
      //       borderRadius: BorderRadius.all(Radius.circular(50.0)),
      //     ),
      //   )
      // ),
      new Scaffold(
          appBar: new AppBar(
            title: new Text(data['name']),
            centerTitle: false,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
          // drawer: new Drawer(child: new Container(),),
          backgroundColor: Colors.transparent,
          body: new Center(
            child: SingleChildScrollView(
                child: new Column(
                  children: <Widget>[
                    new SizedBox(height: _height/12,),
                    new CircleAvatar(
                      radius:_width<_height? _width/4:_height/4,
                      backgroundImage: AssetImage(imgUrl),
                    ),
                    new SizedBox(height: _height/25.0,),
                    new Text(
                      data['name'],
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width/15,
                        color: Colors.white
                      ),
                    ),
                    new SizedBox(height: _height/75.0,),
                    new Text(
                      data['party'],
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width/30,
                        color: Colors.white
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
                      child: new Text(
                        data['note'],
                        style: new TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: _width/25,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Divider(height: _height/30,color: Colors.white,),
                    new Row(
                      children: <Widget>[
                        rowCell(data['ward'], 'WARD'),
                        rowCell(data['cases'], 'CASES'),
                        rowCell(data['activities'].length, 'ACTIVITIES'),
                      ],),
                    new Divider(height: _height/30,color: Colors.white),
                    Container(
                      constraints: BoxConstraints(minHeight:  80),
                      margin: EdgeInsets.all(5),
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Text('Address'),
                                SizedBox(width: 20,),
                                Expanded(
                                  child: Text(
                                    data['address'],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      constraints: BoxConstraints(minHeight:  80),
                      child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Text('Mobile'),
                                SizedBox(width: 20,),
                                Expanded(
                                  child: Text(
                                    data['phone'],
                                  ),
                                )
                              ],
                            ),
                          ),
                      ),
                    ),
                    
                    CarouselSlider(
                      options: CarouselOptions(height: 100.0),
                      items: data['activities'].map<Widget>((String i) {
                        print("I: $i");
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              constraints: BoxConstraints(minHeight:  80),
                              child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            i,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )
                  ],
              ),
            ),
          )
      )
    ],);
  }

  Widget rowCell(dynamic content, String type) => new Expanded(child: new Column(children: <Widget>[
    new Text('$content',style: new TextStyle(color: Colors.white),),
    new Text(type,style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal))
  ],));
}
import 'package:flutter/material.dart';
class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("Name of the Person"),
          backgroundColor: Color(0xFF5CA0D3),
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
            "https://images.unsplash.com/photo-1517404215738-15263e9f9178?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
            fit: BoxFit.fill,
          )),
        ),
        SliverFixedExtentList(
          itemExtent: 80,
          delegate: SliverChildListDelegate([
           makecardItem('Name', 'Ragav'),
           makecardItem('Party', 'ADMK'),
           makecardItem('Area Name', 'Coimbatore'),
           HorizList(),
            ///add more as you wish
          ]),
        )
      ],
    );
  }
}



class HorizList extends StatelessWidget{
 @override
 Widget build(BuildContext context) {
 return new Container(
  height: 100.0,

  child: new ListView.builder(
    itemCount: 5,
    itemBuilder: (context, index){
    return new Card(child: new Container(width: 100.0,
    child: new Text('Activity Name'),alignment: Alignment.center,));
  }, scrollDirection: Axis.horizontal,),
);
}
}


makecardItem(String title, String subtitle){

           return Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(title),
                subtitle: Text(subtitle),
              ),
            );
    
  }





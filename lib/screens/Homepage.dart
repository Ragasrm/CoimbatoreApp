import 'package:flutter/material.dart';
import 'package:politicians_app/screens/profile.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
        
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = '52';

  List<Map<String, dynamic>> data = [
    {
    "id":"2",
    "zone":"Coimbatore-west",
    "name":"Thiru. R. Kalyanasundaram",
    "ward":"59",
    "party":"CPI",
    "address":"53, Mummu Naicker Street, P.N.Pudur,Coimbatore - 641 041",
    "phone":"9443506614",
    "note":"He is the chairman of educatuion committee of the coimbatore municipal. He himself indulged in many activites with Govt schools.",
    "image": "assets/kalyanasundaram.jpg",
    "cases": 0,
    "activities": [
     "Acitvity 1",
     "Acitvity 2",
     "Acitvity 3",
     "Acitvity 4",
     "Acitvity 5",
   ]
  },

  {
    "id":"3",
    "zone":"Coimbatore-west",
    "name":"Thiru. R. Venkatachalam",
    "ward":"63",
    "party":"Indian National Congress",
    "address":"West Venkitasamy Road, R.S.Puram,Coimbatore - 641 002.",
    "phone":"9442266111",
    "note":"He is former mayor of Coimbatore, He is the only person who seated in the mayor post by indirect election.He serverd as a mayor for the period of 2006-2011.",
    "image": "assets/venkatachalam.jpg",
    "cases": 0,
    "activities": [
     "Acitvity 1",
     "Acitvity 2",
     "Acitvity 3",
     "Acitvity 4",
     "Acitvity 5",
   ]
  },
  {
   "id":"1",
   "zone":"Coimbatore-west",
   "name":"Tmt. R. Gayathri",
   "ward":"62",
   "party":"Indian National Congress",
   "address":"29, Maniam Velappan Street,K.K.Pudur,Saibaba Colony, Coimbatore - 641 038",
   "phone":"94425-01862,98949-51133,98949-51133",
   "note":"Nil",
   "image": "assets/gayathri.jpg",
   "cases": 0,
   "activities": [
     "Acitvity 1",
     "Acitvity 2",
     "Acitvity 3",
     "Acitvity 4",
     "Acitvity 5",
   ]
  },
  ];

  Widget actionMenuDropdownButton() {
    return Row(
      children: <Widget>[
        Text('Ward: '),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
          child: DropdownButtonHideUnderline(
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.blue
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  iconSize: 24,
                  elevation: 24,
                  style: TextStyle(color: Colors.white),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue.toString();
                    });
                  },
                  items: <String>['52', '50', '40', '20']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
          ),
        ),
      ],
    );
  }

  Widget listItem(context, position) {
    Map<String, dynamic> datum = data[position];
    // print(datum);
    return Card(
      // elevation: 15.0,
      // margin:EdgeInsets.all(10.0) ,
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profile(data: datum)
            ),
          );
        },
        child: Container(          
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    // image: NetworkImage('https://picsum.photos/300')
                    image: AssetImage(datum['image'])
                  )
                ),
              ),
              SizedBox(width: 20),
              Text(datum['name'])
            ]
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          actionMenuDropdownButton(),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: listItem,
              itemCount: data.length
            ),
          ),
        ]
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:politicalApp/Screens/detail.dart';

class PublicPage1 extends StatefulWidget {
  @override
  _PublicPage1State createState() => _PublicPage1State();
}

class _PublicPage1State extends State<PublicPage1> {
  String _myActivity;
  String _myActivityResult;

  final formKey = new GlobalKey<FormState>();
  @override
   void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
        print("*************get the selected value*********************");
        print(_myActivityResult);
        print("**********************************");
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: Text('welcome'),
        centerTitle: true,
      ),

      body: Center(
        child: Form(
          key: formKey,
            child: Column(
            children: [
              Center(
                child: Container(
                  child: DropDownFormField(
                    titleText: 'Select Ward Name',
                    hintText: 'Choose one ward',
                    value: _myActivity,
                    // when save
                    onSaved: (value) {
                          setState(() {
                            _myActivity = value;
                          });
                        },
                      // when value changed
                   onChanged: (value) {
                     setState(() {
                            _myActivity = value;
                          });
                   },
                    // data
                    dataSource: [
                          {
                            "display": "Running",
                            "value": "Running",
                          },
                          {
                            "display": "Climbing",
                            "value": "Climbing",
                          },
                          {
                            "display": "Walking",
                            "value": "Walking",
                          },
                          {
                            "display": "Swimming",
                            "value": "Swimming",
                          },
                          {
                            "display": "Soccer Practice",
                            "value": "Soccer Practice",
                          },
                          {
                            "display": "Baseball Practice",
                            "value": "Baseball Practice",
                          },
                          {
                            "display": "Football Practice",
                            "value": "Football Practice",
                          },
                        ],

                         textField: 'display',
                        valueField: 'value',

                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: Text('Get councillor List'),
                  onPressed: _saveForm,
                ),
              ),
              Container(
                height:450.0,
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int i) {
                      return Container(
                    child: Card(
                      child:ListTile(
                      title: Text('councillor Name'),
                      subtitle: Text('Area Name',
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green),),
                      leading: Image(
                        image: AssetImage('assets/img/PF.png'),
                      ),//left side  logo
                      onTap: (){

                         Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DetailPage(),
                      ));

                      },
        
                    )
                      )
                  );
                  },
                ),
                

               
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}


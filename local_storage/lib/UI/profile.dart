import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Database/moor_database.dart';
import 'update_identity.dart';
import 'update_other.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Container(
      child: Column(
        children: [
          SizedBox(height: 15),
          BuildRow(
            a: 0,
            attribute: "Name",
          ),
          SizedBox(height: 15),
          BuildRow(
            a: 9,
            attribute: "Age",
          ),
          SizedBox(height: 15),
          BuildRow(
            a: 1,
            attribute: "Gender",
          ),
          SizedBox(height: 15),
          BuildRow(
            a: 3,
            attribute: "Email",
          ),
          SizedBox(height: 15),
          BuildRow(
            a: 4,
            attribute: "Phone",
          ),
          SizedBox(height: 15),
          SizedBox(height: 15),
          BuildButton(f: (context) => UpdatePageIdentity()),
          SizedBox(height: 15),
        ],
      ),
    ),
    Container(
      child: Column(
        children: [
          SizedBox(height: 15),
          BuildRow(
            a: 2,
            attribute: "Profession",
          ),
          SizedBox(height: 15),
          BuildRow(
            a: 5,
            attribute: "Location",
          ),
          SizedBox(height: 15),
          BuildRow(
            a: 6,
            attribute: "About Me",
          ),
          SizedBox(height: 15),
          BuildRow(
            a: 7,
            attribute: "Personality Type",
          ),
          SizedBox(height: 15),
          BuildRow(
            a: 8,
            attribute: "Tags",
          ),
          SizedBox(height: 15),
          BuildButton(f: (context) => UpdatePageOther()),
          SizedBox(height: 15),
        ],
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => exit(0),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          backgroundColor: Color(0xff034345),
          title: Text('My Flutter App'),
        ),
        backgroundColor: Color(0xff034345),
        body: Container(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff034345),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Identity Details',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Other Details',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.yellow[500],
          unselectedItemColor: Colors.white38,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class BuildButton extends StatefulWidget {
  BuildButton({
    this.f,
    Key key,
  }) : super(key: key);

  Widget Function(BuildContext) f;

  @override
  _BuildButtonState createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Icon(
        Icons.mode_outlined,
        color: Colors.white,
      ),
      onPressed: () {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: widget.f));
        });
      },
      color: Color(0xff034345),
    );
  }
}

class BuildRow extends StatelessWidget {
  BuildRow({
    this.a,
    this.attribute,
    Key key,
  }) : super(key: key);

  final String attribute;
  final int a;
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);

    return Row(
      children: [
        SizedBox(
          width: 25,
        ),
        Expanded(
            child: Text(
          attribute,
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
        Expanded(
            child: FutureBuilder(
                future: database.getAllProfiles(),
                builder: (context, snapshot) {
                  if (snapshot.data == null || snapshot.data.isEmpty) {
                    return Container(
                      child: Text('Retreiving.........'),
                    );
                  } else {
                    return Center(
                        child: BuildText(
                      a: a,
                      snapshot: snapshot,
                    ));
                  }
                })),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}

class BuildText extends StatelessWidget {
  BuildText({
    this.a,
    this.snapshot,
    Key key,
  }) : super(key: key);

  AsyncSnapshot snapshot;
  int a;

  @override
  Widget build(BuildContext context) {
    List snap = [
      snapshot.data[0].name,
      snapshot.data[0].gender,
      snapshot.data[0].profession,
      snapshot.data[0].email,
      snapshot.data[0].phone.toString(),
      snapshot.data[0].location,
      snapshot.data[0].aboutMe,
      snapshot.data[0].personalityType,
      snapshot.data[0].tags,
      snapshot.data[0].age.toString(),
      snapshot.data[0].dob.toString()
    ];
    return Text(
      snap[a],
      style: TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}

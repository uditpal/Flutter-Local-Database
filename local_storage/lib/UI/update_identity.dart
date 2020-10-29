import 'package:flutter/material.dart';
import '../Database/moor_database.dart';
import 'package:provider/provider.dart';
import 'profile.dart';
import '../Service/location.dart';

class UpdatePageIdentity extends StatefulWidget {
  @override
  _UpdatePageIdentityState createState() => _UpdatePageIdentityState();
}

enum gend { Male, Female, Other }

class _UpdatePageIdentityState extends State<UpdatePageIdentity> {
  TextEditingController name = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phone = new TextEditingController();

  String val = "";
  String gen = 'Male';
  DateTime dob;
  Duration age;

  Future<dynamic> locate() async {
    Location locate = Location();
    val = await locate.getCurrentLocation();
  }

  @override
  void initState() {
    super.initState();
    locate();
  }

  gend _character = gend.Male;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);

    return StreamBuilder(
        stream: database.watchAllProfiles(),
        builder: (context, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff034345),
            ),
            backgroundColor: Color(0xff034345),
            body: ListView(
              children: [
                SizedBox(height: 15),
                buildRow(name, "Name"),
                SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        'Gender',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),                      SizedBox(width: 30,),

                    Radio(
                      value: gend.Male,
                      groupValue: _character,
                      onChanged: (gend value) {
                        setState(() {
                          _character = value;
                          gen = "Male";
                        });
                      },
                    ),
                    Text(
                      'Male',
                      style: new TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    Radio(
                      value: gend.Female,
                      groupValue: _character,
                      onChanged: (gend value) {
                        setState(() {
                          _character = value;
                          gen = "Female";
                        });
                      },
                    ),
                    Text(
                      'Female',
                      style: new TextStyle(
                        fontSize: 16.0, color: Colors.white
                      ),
                    ),
                    Radio(
                      value: gend.Other,
                      groupValue: _character,
                      onChanged: (gend value) {
                        setState(() {
                          _character = value;
                          gen = "Other";
                        });
                      },
                    ),
                    Text(
                      'Other',
                      style: new TextStyle(fontSize: 16.0, color: Colors.white),
                    ),SizedBox(
                        width: 15,
                      )
                  ],
                ),
                SizedBox(height: 15),
                buildRow(email, "Email"),
                SizedBox(height: 15),
                buildRow(phone, "Phone"),
                SizedBox(height: 15),
                _buildDateButton(context),
                SizedBox(height: 15),
                Center(
                  child: RaisedButton(child: Text("Update"),color: Color(0xa0ffffff),onPressed: () {
                    setState(() {
                      gender.text = gen;
                      age = DateTime.now().difference(dob);
                      String differenceInYears =
                          (age.inDays / 365).floor().toString();
                      final profiles = snapshot.data ?? List();

                      print(age);
                      database.updateProfile(profiles[0].copyWith(
                          email: email.text,
                          gender: gender.text,
                          name: name.text,
                          age: int.parse(differenceInYears),
                          phone: int.parse(phone.text),
                          dob: dob));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details()));
                    });
                  }),
                ),
                SizedBox(height: 15),
              ],
            ),
          );
        });
  }

  Row buildRow(TextEditingController passit, String heading) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: Text(
          heading,
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
        Expanded(
            child: TextFormField(
          controller: passit,
          decoration: InputDecoration(fillColor: Color(0xa0ffffff), filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        )),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Row _buildDateButton(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: Text(
          "Date of Birth",
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
        Expanded(
          child: Center(
            child: IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: Color(0xa0ffffff),
              ),
              onPressed: () async {
                dob = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

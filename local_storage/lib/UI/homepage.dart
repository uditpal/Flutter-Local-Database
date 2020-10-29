import 'package:flutter/material.dart';
import '../Database/moor_database.dart';
import 'package:provider/provider.dart';
import 'profile.dart';
import '../Service/location.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

enum gend { Male, Female, Other }

class _HomepageState extends State<Homepage> {
  TextEditingController name = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController profession = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController location = new TextEditingController();
  TextEditingController aboutMe = new TextEditingController();
  TextEditingController personalityType = new TextEditingController();
  TextEditingController tags = new TextEditingController();

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
    location.text = val;
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
              automaticallyImplyLeading: false,
              backgroundColor: Color(0xff034345),
            ),
            backgroundColor: Color(0xff034345),
            body: Container(
              decoration: BoxDecoration(),
              child: ListView(
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
                      ),
                      SizedBox(
                        width: 30,
                      ),
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
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.white),
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
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.white),
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
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  buildRow(profession, "Profession"),
                  SizedBox(height: 15),
                  buildRow(email, "Email"),
                  SizedBox(height: 15),
                  buildRow(phone, "Phone"),
                  SizedBox(height: 15),
                  buildRow(location, "Location"),
                  SizedBox(height: 15),
                  buildRow(aboutMe, "About Me"),
                  SizedBox(height: 15),
                  buildRow(personalityType, "Personality Type"),
                  SizedBox(height: 15),
                  buildRow(tags, "Tags"),
                  SizedBox(height: 15),
                  _buildDateButton(context),
                  SizedBox(height: 15),
                  Center(
                    child: RaisedButton(
                        child: Text("Submit"),
                        color: Color(0xa0ffffff),
                        onPressed: () {
                          setState(() {
                            gender.text = gen;
                            age = DateTime.now().difference(dob);
                            String differenceInYears =
                                (age.inDays / 365).floor().toString();

                            print(age);
                            database.insertProfile(Profile(
                                aboutMe: aboutMe.text,
                                email: email.text,
                                gender: gender.text,
                                location: location.text,
                                name: name.text,
                                personalityType: personalityType.text,
                                age: int.parse(differenceInYears),
                                phone: int.parse(phone.text),
                                profession: profession.text,
                                tags: tags.text,
                                dob: dob));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details()));
                          });
                        }),
                  ),
                  SizedBox(height: 15),
                ],
              ),
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
          decoration: InputDecoration(
            fillColor: Color(0xa0ffffff),
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}

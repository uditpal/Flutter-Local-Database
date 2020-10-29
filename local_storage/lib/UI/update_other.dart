import 'package:flutter/material.dart';
import '../Database/moor_database.dart';
import 'package:provider/provider.dart';
import 'profile.dart';
import '../Service/location.dart';
class UpdatePageOther extends StatefulWidget {
  @override
  _UpdatePageOtherState createState() => _UpdatePageOtherState();
}

enum gend { Male, Female, Other }

class _UpdatePageOtherState extends State<UpdatePageOther> {
  TextEditingController profession = new TextEditingController();
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
  }

  gend _character = gend.Male;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    location.text = val;

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
                buildRow(profession, "Profession"),
                SizedBox(height: 15),
                buildRow(location, "Location"),
                SizedBox(height: 15),
                buildRow(aboutMe, "About Me"),
                SizedBox(height: 15),
                buildRow(personalityType, "Personality Type"),
                SizedBox(height: 15),
                buildRow(tags, "Tags"),
                SizedBox(height: 15),
                Center(
                  child: RaisedButton(
                      child: Text("Update"),
                      color: Color(0xa0ffffff),
                      onPressed: () {
                        setState(() {
                          final profiles = snapshot.data ?? List();

                          print(age);
                          database.updateProfile(profiles[0].copyWith(
                              aboutMe: aboutMe.text,
                              location: location.text,
                              personalityType: personalityType.text,
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
          decoration: InputDecoration(
            fillColor: Color(0xa0ffffff), filled: true,
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
}

import 'package:flutter/material.dart';
import 'package:lets_play_atl/model/User.dart';
import 'package:lets_play_atl/providers/singleton.dart';

class RegistrationScreen extends StatefulWidget {
  Singleton singleton;
  RegistrationScreen(this.singleton);
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController fullNameController = new TextEditingController();
  bool citizenVal = false;
  bool organizerVal = false;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[50],
        resizeToAvoidBottomPadding: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      decoration:
                          new BoxDecoration(color: Colors.lightGreen[100]),
                      child: Text(
                        "Sign Up For Let's Play ATL",
                        style: TextStyle(
                            fontSize: 48.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                    )
                  ],
                ),
              ),
              Expanded(
//              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: ListView(
                children: <Widget>[
                  TextField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                        labelText: 'FULL NAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'EMAIL ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                  ),
                  SizedBox(height: 60.0),
                  Container(
                      height: 60.0,
                      child: GestureDetector(
                        onTap: () {
//                              if (emailController.text == "jd@gmail.com" &&
//                                  passwordController.text == "1234")
                          User u = User(fullNameController.text,
                              emailController.text, passwordController.text);
                          u.isAdmin = organizerVal;
                          widget.singleton.citizenProvider
                              .registerUser(u)
                              .then((res) {
                            if (res) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Signup Complete"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();

                                          },
                                        ),
                                      ],
                                    );
                                  });
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Signup Failed"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            }
//                            }
                          });
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: Center(
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  CheckboxListTile(
                    title: Text("REGISTER AS AN EVENT ORGANIZER",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat')),
                    value: organizerVal,
                    onChanged: (bool value) {
                      setState(() {
                        organizerVal = value;
                      });
                    },
                  ),
                  SizedBox(height: 25.0),
                  Container(
                      height: 60.0,
                      child: GestureDetector(onTap: () {
//                              if (emailController.text == "jd@gmail.com" &&
//                                  passwordController.text == "1234")
                        if (organizerVal) {
                          Navigator.of(context).pushNamed('/loginOrganizer');
                        }

                        if (citizenVal) {
                          Navigator.of(context).pushNamed('/login');
                        }
                      })),
                  Container(
                    height: 40.0,
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 40.0,
                                spreadRadius: .5)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Text('Go Back',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ]));
  }
}

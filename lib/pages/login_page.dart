import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/myRoutes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _keyForm = GlobalKey<FormState>();

  String userName = "", surName = "", eMail = "", password = "";
  bool clickBool = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                Image.asset(
                  "images/login_img.png",
                  fit: BoxFit.contain,
                ),

                SizedBox(
                  height: 15,
                ),
                Text(
                  "Welcome $userName to Demo App",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Username", labelText: "username"),
                        validator: (value) {
                          if (value == null || value.length < 3) {
                            return "this username can't be accepted";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          userName = value;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Surname", labelText: "surname"),
                        validator: (value) {
                          if (value == null || value.length < 3) {
                            return "this surname can't be accepted";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          surName = value;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter E-mail", labelText: "email"),
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return "this email can't be accepted";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          eMail = value;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "password",
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "this password can't be accepted";
                          } else if (value.length < 6) {
                            return "password must be of 6 characters";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 50,
                ),

                // ElevatedButton(
                //   onPressed: () {
                //     nextActivity(context);
                //   },
                //
                //   child: Text("SUBMIT",),
                //   style: ElevatedButton.styleFrom(
                //     minimumSize: Size(200, 40),
                //     onPrimary: Colors.white,
                //     primary: Colors.deepPurple,
                //   ),
                //
                //
                // )
                Material(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(clickBool ? 50 : 15),
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () async {
                      // nextActivity(context);
                      setState(() {
                        clickBool = true;
                      });
                      await Future.delayed(Duration(milliseconds: 550));
                      nextActivity(context);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      alignment: Alignment.center,
                      child: clickBool
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                      width: clickBool ? 50 : 250,
                      height: 50,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void nextActivity(BuildContext context) async {
    Navigator.pushNamed(context, myRoutes.homeRoute);
    if (_keyForm.currentState!.validate()) {
      if (userName == "" || surName == "" || eMail == "" || password == "") {
        //do nothing
        clickBool = false;
        setState(() {});
      } else {
        await Navigator.pushNamed(context, myRoutes.homeRoute);
        setState(() {
          clickBool = false;
        });
      }
    } else {
      setState(() {
        clickBool = false;
      });
    }
  }
}

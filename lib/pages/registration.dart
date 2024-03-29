import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:app/pages/home.dart';
import 'package:app/pages/login.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  bool loading = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });



    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (Context) => new HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {

    setState(() {
      loading = true;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Center(
          //   child: Image.asset('images/logo.png', fit: BoxFit.cover, width: 140.0,),
          // ),
          Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Image.asset(
                "images/logo.png",
                width: 150.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Center(
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.black.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "ফোণ নম্বর",
                                icon: Icon(Icons.phone),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.black.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "নিজের নাম",
                                icon: Icon(Icons.supervised_user_circle_outlined),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.black.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "ডিসট্রিক্ট",
                                icon: Icon(Icons.location_on_outlined),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.black87,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (Context) => new Login()));
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text("সাবমিট করুন",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            color: Colors.black87,
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (Context) => new Login()));
            },
            child: Text(
              "লগইন করুন",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

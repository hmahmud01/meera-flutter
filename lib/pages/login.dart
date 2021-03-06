import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:app/pages/home.dart';
import 'package:app/pages/registration.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final GoogleSignIn googleSignIn = new GoogleSignIn();
  // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // SharedPreferences preferences;
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

    // preferences = await SharedPreferences.getInstance();
    // isLoggedIn = await googleSignIn.isSignedIn();

    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (Context) => new HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    // preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    // GoogleSignInAccount googleUser = await googleSignIn.signIn();
    // GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleSignInAuthentication.accessToken,
    //   idToken: googleSignInAuthentication.idToken,
    // );
    // User user = await firebaseAuth.signInWithCredential(credential);
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
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Image.asset(
                "images/logo.png",
                width: 150.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 500.0),
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
                            hintText: "????????? ?????????????????????",
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
                            hintText: "????????? ?????????????????????",
                            icon: Icon(Icons.lock_outline),
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
                                    builder: (Context) => new HomePage()));
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text("????????????-?????? ????????????",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              )),
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
                  MaterialPageRoute(builder: (Context) => new Registration()));
            },
            child: Text(
              "??????????????????????????? ????????????",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

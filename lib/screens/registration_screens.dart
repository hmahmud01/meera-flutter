import 'package:app/screens/home_screens.dart';
import 'package:app/screens/login_screens.dart';
import 'package:app/state/user_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _form = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String _name = '';
  String _phone = '';
  String _jela = '';
  String _upojela = '';
  String _confpass = '';

  _registerNow() async {
    var isvalid = _form.currentState.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState.save();
    bool isregis = await Provider.of<UserState>(
      context,
      listen: false,
    ).registerNow(_username, _password, _name, _phone, _jela, _upojela);
    print(isregis);
    if (isregis) {
      Navigator.of(context).pushReplacementNamed(LoginScreens.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Something is wrong.Try Again"),
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Register Now"),
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
              child: Text("রেজিস্ট্রেশান করুন",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  )),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
            //   child: Text("সবজী বীজ কেনার সহজ উপায়",
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //           color: Colors.black54,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 18.0
            //       )),
            // ),
            // Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Image.asset(
            //     "images/logo.png",
            //     width: 100.0,
            //   ),
            // ),
            Padding(
                padding: EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (v){
                            if(v.isEmpty){
                              return 'নাম';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "নাম",
                            icon: Icon(Icons.person),
                          ),
                          onSaved: (v){
                            _name = v;
                          },
                        ),
                        TextFormField(
                          validator: (v){
                            if(v.isEmpty){
                              return 'ফোন নাম্বার';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "ফোন নাম্বার",
                            icon: Icon(Icons.phone),
                          ),
                          onSaved: (v){
                            _username = v;
                            _phone = v;
                          },
                        ),
                        TextFormField(
                          validator: (v){
                            if(v.isEmpty){
                              return 'জেলা';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "জেলা",
                            icon: Icon(Icons.location_on_outlined),
                          ),
                          onSaved: (v){
                            _jela = v;
                          },
                        ),
                        TextFormField(
                          validator: (v){
                            if(v.isEmpty){
                              return 'উপজেলা';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "উপজেলা",
                            icon: Icon(Icons.location_on),
                          ),
                          onSaved: (v){
                            _upojela = v;
                          },
                        ),
                        TextFormField(
                          validator: (v){
                            if(v.isEmpty){
                              return 'পিন নাম্বার';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "পিন নাম্বার",
                            icon: Icon(Icons.lock_outline),
                          ),
                          onChanged: (v){
                            setState(() {
                              _confpass = v;
                            });
                          },
                          onSaved: (v){
                            _password = v;
                          },
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
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
                                  _registerNow();
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text("রেজিস্টার করুন",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    )),
                              ),
                            ),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     RaisedButton(
                        //       onPressed: (){
                        //         _registerNow();
                        //       },
                        //       child: Text("Register"),
                        //     ),
                        //     FlatButton(
                        //         onPressed: (){
                        //           Navigator.of(context).pushReplacementNamed(LoginScreens.routeName);
                        //         },
                        //         child: Text("Login")
                        //     )
                        //   ],
                        // )
                      ],
                    ),
                  ),
                )
            ),
          ],
        ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            color: Colors.black87,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(LoginScreens.routeName);
            },
            child: Text(
              "লগইন",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

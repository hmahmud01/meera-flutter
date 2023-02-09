import 'package:app/screens/home_screens.dart';
import 'package:app/screens/registration_screens.dart';
import 'package:app/state/user_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreens extends StatefulWidget {
  static const routeName = '/login';
  // const LoginScreens({Key? key}) : super(key: key);

  @override
  _LoginScreensState createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  String _username = '';
  String _password = '';

  final _form = GlobalKey<FormState>();

  void _loginNow() async{
    var isValid = _form.currentState.validate();
    if(!isValid){
      return;
    }
    _form.currentState.save();
    bool istoken = await Provider.of<UserState>(context, listen: false).loginNow(_username, _password);
    print(_username);
    print(_password);
    if (istoken){
      Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
    }else{
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Something is wrong Try Again'),
          actions: [
            RaisedButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("OK"),)
          ],
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login"),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            child: Text("সবজী বীজ কেনার সহজ উপায়",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                )),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Image.asset(
              "images/logo_app_main.png",
              width: 140.0,
            ),
          ),
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
                            return "ফোন নাম্বার";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "ফোন নাম্বার",
                          icon: Icon(Icons.phone),
                        ),
                        onSaved: (v){
                          _username = v;
                        },
                      ),
                      TextFormField(
                        validator: (v){
                          if(v.isEmpty){
                            return "পিন নাম্বার";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "পিন নাম্বার",
                          icon: Icon(Icons.lock_outline),
                        ),
                        onSaved: (v){
                          _password = v;
                        },
                        obscureText: true,
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
                                _loginNow();
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text("সাইন-ইন করুন",
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
                      //         _loginNow();
                      //       },
                      //       child: Text("Login"),
                      //     ),
                      //     FlatButton(
                      //       onPressed: (){
                      //         Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
                      //       },
                      //       child: Text("Registration")
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
              Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
            },
            child: Text(
              "রেজিস্টার করুন",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}



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
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  validator: (v){
                    if(v.isEmpty){
                      return 'Enter Your Username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Username"
                  ),
                  onSaved: (v){
                    _username = v;
                  },
                ),
                TextFormField(
                  validator: (v){
                    if(v.isEmpty){
                      return 'Enter Your Password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Password"
                  ),
                  onSaved: (v){
                    _password = v;
                  },
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: (){
                        _loginNow();
                      },
                      child: Text("Login"),
                    ),
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
                      },
                      child: Text("Registration")
                    )
                  ],
                )
              ],
            ),
          ),
        )
      )
    );
  }
}



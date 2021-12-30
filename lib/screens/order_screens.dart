import 'package:app/screens/cart_screens.dart';
import 'package:app/screens/order_history_screens.dart';
import 'package:app/state/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Order extends StatefulWidget {
  static const routeName = '/order-screen';

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final _form = GlobalKey<FormState>();
  String _email = "";
  String _phone = "";
  String _address = "";
  void _orderNow()async{
    var isValid = _form.currentState.validate();
    if(!isValid){
      return;
    }
    _form.currentState.save();
    final cart = Provider.of<CartState>(context, listen: false).cartModel;
    print(cart);
    print(cart.id);
    bool order = await Provider.of<CartState>(context, listen: false).orderCart(cart.id, _address, _email, _phone);
    print(order);
    if(order){
      Navigator.of(context).pushNamed(OrderScreens.routeName);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('MAI SEED'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email"
                  ),
                  validator: (v){
                    if (v.isEmpty){
                      return "Enter Email";
                    }
                    return null;
                  },
                  onSaved: (v){
                    _email = v;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Phone"
                  ),
                  validator: (v){
                    if (v.isEmpty){
                      return "Enter Phone";
                    }
                    return null;
                  },
                  onSaved: (v){
                    _phone = v;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Address"
                  ),
                  validator: (v){
                    if (v.isEmpty){
                      return "Enter Address";
                    }
                    return null;
                  },
                  onSaved: (v){
                    _address = v;
                  },
                ),
                Row(
                  children: [
                    RaisedButton(onPressed: (){
                      _orderNow();
                    }, child: Text("Order"),),
                    RaisedButton(onPressed: (){
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    }, child: Text("Edit Cart"),)
                  ],
                )
              ],
            ),
          )
        )
      ),
    );
  }
}

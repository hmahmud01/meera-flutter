import 'package:app/screens/cart_screens.dart';
import 'package:app/screens/order_history_screens.dart';
import 'package:app/state/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sslcommerz/model/SSLCAdditionalInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCCustomerInfoInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCEMITransactionInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCShipmentInfoInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/model/sslproductinitilizer/General.dart';
import 'package:flutter_sslcommerz/model/sslproductinitilizer/SSLCProductInitializer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';

import 'package:localstorage/localstorage.dart';
import 'package:uuid/uuid.dart';
import 'bkash_payment.dart';
import 'ssl_payment.dart';

import 'package:app/screens/terms_screens.dart';
import 'package:app/screens/return_screens.dart';

enum Intent {sale, authorization}

class Order extends StatefulWidget {
  static const routeName = '/order-screen';

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  LocalStorage storage = new LocalStorage('usertoken');
  final _form = GlobalKey<FormState>();
  String _name = "";
  String _phone = "";
  String _address = "";
  String _email = "";
  bool isChecked = false;

  var uuid = Uuid();

  void _orderNow()async{
    var isValid = _form.currentState.validate();
    if(!isValid){
      return;
    }
    _form.currentState.save();
    final cart = Provider.of<CartState>(context, listen: false).cartModel;


    Future<void> sslCommerzGeneralCall() async {
      Sslcommerz sslcommerz = Sslcommerz(
          initializer: SSLCommerzInitialization(
            //Use the ipn if you have valid one, or it will fail the transaction.
            //ipn_url: "www.ipnurl.com",
              multi_card_name: "visa,master,bkash",
              currency: SSLCurrencyType.BDT,
              product_category: "Food",
              sdkType: SSLCSdkType.TESTBOX,
              store_id: "maise62454005c5646",
              store_passwd: "maise62454005c5646@ssl",
              total_amount: cart.total,
              tran_id: uuid.v1()));
      // sslcommerz.payNow();
      var result = await sslcommerz.payNow();
      if (result is PlatformException) {
        print("the response is: " +
            result.message.toString() +
            " code: " +
            result.code);
      } else {
        SSLCTransactionInfoModel model = result;
        print(model.tranId);
        print(model.tranDate);
        // Fluttertoast.showToast(
        //     msg: "Transaction successful: Amount ${model.amount} TK",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.black,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
        // final snackBar = SnackBar(
        //   content: const Text('Transaction successful'),
        //   action: SnackBarAction(
        //     label: 'OK',
        //     onPressed: () {
        //       // Some code to undo the change.
        //     },
        //   ),
        // );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        bool order = await Provider.of<CartState>(context, listen: false).orderCart(cart.id, _address, _email, _phone, _name);
        print(order);
        if(order){
          Navigator.of(context).pushNamed(OrderScreens.routeName);
        }
      }
    }

    Future<void> sslCommerzCustomizedCall() async {
      Sslcommerz sslcommerz = Sslcommerz(
          initializer: SSLCommerzInitialization(
            //Use the ipn if you have valid one, or it will fail the transaction.
            //   ipn_url: "www.ipnurl.com",
              multi_card_name: "visa,master,bkash",
              currency: SSLCurrencyType.BDT,
              product_category: "Food",
              sdkType: SSLCSdkType.TESTBOX,
              store_id: "maise62454005c5646",
              store_passwd: "maise62454005c5646@ssl",
              total_amount: cart.total,
              tran_id: "1231321321321312"));

      sslcommerz
      // .addEMITransactionInitializer(
      // sslcemiTransactionInitializer: SSLCEMITransactionInitializer(
      //     emi_options: 1, emi_max_list_options: 9, emi_selected_inst: 0))
          .addShipmentInfoInitializer(
          sslcShipmentInfoInitializer: SSLCShipmentInfoInitializer(
              shipmentMethod: "yes",
              numOfItems: 5,
              shipmentDetails: ShipmentDetails(
                  shipAddress1: "Ship address 1",
                  shipCity: "Faridpur",
                  shipCountry: "Bangladesh",
                  shipName: "Ship name 1",
                  shipPostCode: "7860")))
          .addCustomerInfoInitializer(
          customerInfoInitializer: SSLCCustomerInfoInitializer(
              customerState: "Chattogram",
              customerName: "Abu Sayed Chowdhury",
              customerEmail: "sayem227@gmail.com",
              customerAddress1: "Anderkilla",
              customerCity: "Chattogram",
              customerPostCode: "200",
              customerCountry: "Bangladesh",
              customerPhone: _phone))
          .addProductInitializer(
          sslcProductInitializer:
          // ***** ssl product initializer for general product STARTS*****
          SSLCProductInitializer(
              productName: "Water Filter",
              productCategory: "Widgets",
              general: General(
                  general: "General Purpose",
                  productProfile: "Product Profile"))
        // ***** ssl product initializer for general product ENDS*****

        // ***** ssl product initializer for non physical goods STARTS *****
        // SSLCProductInitializer.WithNonPhysicalGoodsProfile(
        //     productName:
        //   "productName",
        //   productCategory:
        //   "productCategory",
        //   nonPhysicalGoods:
        //   NonPhysicalGoods(
        //      productProfile:
        //       "Product profile",
        //     nonPhysicalGoods:
        //     "non physical good"
        //       ))
        // ***** ssl product initializer for non physical goods ENDS *****

        // ***** ssl product initialization for travel vertices STARTS *****
        //       SSLCProductInitializer.WithTravelVerticalProfile(
        //          productName:
        //         "productName",
        //         productCategory:
        //         "productCategory",
        //         travelVertical:
        //         TravelVertical(
        //               productProfile: "productProfile",
        //               hotelName: "hotelName",
        //               lengthOfStay: "lengthOfStay",
        //               checkInTime: "checkInTime",
        //               hotelCity: "hotelCity"
        //             )
        //       )
        // ***** ssl product initialization for travel vertices ENDS *****

        // ***** ssl product initialization for physical goods STARTS *****

        // SSLCProductInitializer.WithPhysicalGoodsProfile(
        //     productName: "productName",
        //     productCategory: "productCategory",
        //     physicalGoods: PhysicalGoods(
        //         productProfile: "Product profile",
        //         physicalGoods: "non physical good"))

        // ***** ssl product initialization for physical goods ENDS *****

        // ***** ssl product initialization for telecom vertice STARTS *****
        // SSLCProductInitializer.WithTelecomVerticalProfile(
        //     productName: "productName",
        //     productCategory: "productCategory",
        //     telecomVertical: TelecomVertical(
        //         productProfile: "productProfile",
        //         productType: "productType",
        //         topUpNumber: "topUpNumber",
        //         countryTopUp: "countryTopUp"))
        // ***** ssl product initialization for telecom vertice ENDS *****
      )
          .addAdditionalInitializer(
          sslcAdditionalInitializer: SSLCAdditionalInitializer(
              valueA: "value a ",
              valueB: "value b",
              valueC: "value c",
              valueD: "value d"));
      var result = await sslcommerz.payNow();
      if (result is PlatformException) {
        print("the response is: " +
            result.message.toString() +
            " code: " +
            result.code);
      } else {
        SSLCTransactionInfoModel model = result;
        print(model.tranId);
        print(model.tranDate);
        // Fluttertoast.showToast(
        //     msg: "Transaction successful: Amount ${model.amount} TK",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.TOP,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.black,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
        final snackBar = SnackBar(
          content: const Text('Transaction successful'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // bool order = await Provider.of<CartState>(context, listen: false).orderCart(cart.id, _address, _email, _phone);
        // print(order);
        // if(order){
        //   Navigator.of(context).pushNamed(OrderScreens.routeName);
        // }
      }
    }
    // SSLCOMMERZE NOT WORKING
    // sslCommerzGeneralCall();
  }

  Intent _intent = Intent.sale;
  FocusNode focusNode;

  void orderbKash() {
    final cart = Provider.of<CartState>(context, listen: false).cartModel;
    String amount = cart.total.toString();
    String intent = "sale";

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BkashPayment(amount: amount, intent: intent)));
  }

  void orderssl(){
    final cart = Provider.of<CartState>(context, listen: false).cartModel;
    String amount = cart.total.toString();
    String intent = "sale";

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SSLPayment()));
  }


  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartState>(context).cartModel;
    var name = storage.getItem('name');

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('MAI SEED'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: new Text(
                  "অর্ডার নিশ্চিত করুন",
                  style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w800, fontSize: 32.0),
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 2.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: new Text(
                  "তারিখ: ${cart.date}",
                  style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w400, fontSize: 14.0),
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 2.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: new Text(
                  "সর্বমোট: ${cart.total}  টাকা",
                  style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w400, fontSize: 14.0),
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 2.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: new Text(
                  "আপনার তথ্য দিয়ে পেমেন্ট সম্পূর্ণ করুন",
                  style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w400, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "নামঃ"
                          ),
                          validator: (v){
                            if (v.isEmpty){
                              return "নাম লেখুন";
                            }
                            return null;
                          },
                          onSaved: (v){
                            _name = v;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "ঠিকানাঃ"
                          ),
                          validator: (v){
                            if (v.isEmpty){
                              return "ঠিকানা লেখুন";
                            }
                            return null;
                          },
                          onSaved: (v){
                            _address = v;
                          },
                        ),
                        TextFormField(
                          controller: TextEditingController()..text = name,
                          decoration: InputDecoration(
                              hintText: name
                          ),
                          validator: (v){
                            if (v.isEmpty){
                              return "মোবাইল নাম্বারঃ";
                            }
                            return null;
                          },
                          onSaved: (v){
                            _phone = v;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "ইমেইলঃ"
                          ),
                          onSaved: (v){
                            _email = v;
                          },
                        ),
                        Row(
                          children: [
                            // AcceptTerms(),
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  isChecked = value ?? false;
                                });
                              },
                            ),
                            Text("I Accept the following Policy And Terms"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              child: Text(
                                "Terms And Conditions",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: Colors.black87
                                ),
                              ),
                              onTap: () {Navigator.of(context).pushReplacementNamed(TermScreens.routeName);},
                            ),
                            InkWell(
                              child: Text(
                                "Return Policy",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: Colors.black87
                                ),
                              ),
                              onTap: () {Navigator.of(context).pushReplacementNamed(ReturnScreens.routeName);},
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            RaisedButton(
                              color: Colors.black45,
                              onPressed: isChecked ? (){
                              _orderNow();
                              // orderbKash();
                              // orderssl();
                            }: null, child: Text("পেমেন্ট করুন", style: TextStyle(color: Colors.white))),
                            RaisedButton(
                              color: Colors.red,
                              onPressed: (){
                              Navigator.of(context).pushNamed(CartScreen.routeName);
                            }, child: Text("কার্টে ফেরত চলুন", style: TextStyle(color: Colors.white)))
                          ],
                        )
                      ],
                    ),
                  )
              ),
            ),

          ],
        )

      ),
    );
  }
}

class AcceptTerms extends StatefulWidget {
  // const MyStatefulWidget({super.key});

  @override
  State<AcceptTerms> createState() => _AcceptTermsState();
}

class _AcceptTermsState extends State<AcceptTerms> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool value) {
        setState(() {
          isChecked = value ?? false;
        });
      },
      // onChanged: (value) {
      //   setState(() {
      //     agree = value ?? false;
      //   });
      // },
    );
  }
}



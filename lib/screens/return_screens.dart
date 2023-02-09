import 'package:app/screens/terms_screens.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/home_button.dart';

class ReturnScreens extends StatelessWidget {
  static const routeName = '/return-screens';
  // const ReturnScreens({Key? key}) : super(key: key);

  List<String> terms = [
    "After pay advance if you want to cancel the order, we will refund your advanced money. But you have to make sure about this matter within 2 working days through contact with us by call or message. Otherwise no refund and return policy. We do not return of sold product. If once it sold, you cannot return it.  But you will get 1 year service warranty after sell on electronic device of mirror. If you have any other questions or concerns about the product contact with us.",
    "If you ordered product and pay the advance but want to cancel it, you make to sure about this matter within 2 working days. After cancelation the order, we will refund your advance balance within 5 working days. And refund will be provided using the same channel method (online transaction) through which you had received the payment.",
    "When customer confirm make order, they must pay 100% advance by online transaction, bkash(make payment) or other banking way.",
    "After Purchase of product we will delivery and install your product at your home. And we will make charge for this. In case of damage of product on the way, we take full of responsibility.",
    "But, if customer want that they get responsible for delivery, they can do it. Weather after purchase on the way product make damage or scratch, that is not our responsibility."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('MAI SEED'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 8.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text(
                    "Return Policy",
                    style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w800, fontSize: 32.0),
                  )
              )
          ),
          Expanded(child: Padding(
            padding: EdgeInsets.all(12),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: terms.length,
              // prototypeItem: ListTile(
              //   title: Text(terms.first),
              // ),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${index + 1}  ${terms[index]}'),
                );
              },
            ),
          ))
        ],
      ),
      floatingActionButton: HomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

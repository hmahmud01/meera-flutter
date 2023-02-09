import 'package:flutter/material.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/home_button.dart';

class TermScreens extends StatelessWidget {
  static const routeName = '/term-screens';
  // const TermScreens({Key? key}) : super(key: key);

  List<String> terms = [
    "Certain parts of this website offer the opportunity for user information, material and data (Comments) in areas of the website. Comments reflect to the viewer.",
    "MAI Seed reserves the right to monitor all Comments and to remove any Comments which is consider in absolute discretion to be inappropriate, offensive, in breach of these Terms of Service.",
    "You are entitled Comments to post on our website and have all necessary licenses and consents to do,",
    "The Comments do not infringe any intellectual property right, including without limitation copyright, patent or trademark, or other proprietary right of any third party,",
    "The Comments do not contain any defamatory, offensive, indecent and unlawful material or material which is an invasion of privacy,",
    "The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.",
    "The above quoted rate will include the VAT, AIT & other applicable charges per Govt. rule and regulations.",
    "All the above price is based on factory corporate price, but not including the shipping/ delivery / installation cost. Production time: 14-20 days for bulk quantity.",
    "Ordering goods shipment / delivery with 100% payment must be done within the given production and shipment/ delivery time, if delayed more than 3 days from shipment/ delivery date then WH costing will be added in the total ordering cost.",
    "Delivery service warranty will be given as per company policy and warranty will be counted after shipment or delivery.",
    "For order confirmation user will have to pay 100% in advance.",
    "Fragile product will not be returned once sold, service will be given only for the device"
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
                "Terms And Conditions",
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

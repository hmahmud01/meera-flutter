import 'package:flutter/material.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/home_button.dart';

class AboutScreens extends StatelessWidget {
  static const routeName = '/about-screens';
  // const TermScreens({Key? key}) : super(key: key);

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
                    "About MAI",
                    style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w800, fontSize: 32.0),
                  )
              )
          ),
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                "As a business founded by family, we understand the importance of an unconditional customer service. We believe in long term relationships with our clients. The people of MAI do what they say and say what they do. Being nationally active for long, we know our way around the country. We literally feel at home at every corner of this land.",
                // style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w200, fontSize: 16.0),
              ),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                "Commencing in 2006, we have been involved in Agricultural Commodity trade largely with Rice &amp; Maize. In 2008 Natural Compost, Jute sacks have been added to the portfolio. In the year 2010 we engaged ourselves in sourcing and sales of Horticultural &amp; Agricultural seeds. In 2014 we started to source &amp; sales of mulching materials &amp; yellow straps. We are one of the pioneers to introduce mulching &amp; packed coco-substrate in Bangladesh. ",
                // style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w200, fontSize: 16.0),
              ),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                "Trade Licence Number : TRAD/DSCC/255625/2019",
                // style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w200, fontSize: 16.0),
              ),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                "TIN: 116809416709",
                // style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16.0),
              ),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                "Payment Gatway",
                // style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16.0),
              ),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child:Image.network(
              "https://securepay.sslcommerz.com/public/image/SSLCommerz-Pay-With-logo-All-Size-01.png",
              fit: BoxFit.cover,
            )
          )

        ],
      ),
      floatingActionButton: HomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

import 'package:app/state/cart_state.dart';
import 'package:app/widgets/home_button.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class OrderScreens extends StatelessWidget {
  static const routeName = '/order-screens';

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CartState>(context).oldorder;
    print(data[0].cart.total);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('MAI SEED'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (ctx, i){
            return Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data[i].email),
                    Text(data[i].phone),
                    Text(data[i].address),
                    Text("Total: ${data[i].cart.total}"),
                  ],
                ),
              ),
            );
          }
        ),
      ),
      floatingActionButton: HomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

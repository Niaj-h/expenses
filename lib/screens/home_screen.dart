import 'package:expenses/models/transactions.dart';
import '../screens/spends_screen.dart';
import 'package:expenses/widgets/chart.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<TransactionsModel>(context);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text('Expense Manager'),
            centerTitle: true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Chart(data.recentTransactions),
            Transactionscard(
              imgasset: 'images/illustratedgirl.png',
              color: Colors.red,
              text: 'Transactions on your hand!',
              ontap: () {
                Navigator.of(context).pushNamed(Spends.routeName);
              },
            ),
            Transactionscard(
              imgasset: 'images/illustratedgirl2.png',
              color: Colors.teal,
              text: 'Data analysis never been so easy!',
              ontap: () {
                Navigator.of(context).pushNamed(Spends.routeName);
              },
            ),
          ],
        ));
  }
}

class Transactionscard extends StatelessWidget {
  String imgasset;
  Color color;
  String text;
  Function ontap;
  Transactionscard({this.imgasset, this.color, this.text, this.ontap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      child: Card(
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            color: color,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Stack(children: [
              Positioned(
                left: 150,
                top: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(imgasset))),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 200,
                    height: 70,
                    child: Text(
                      text,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  GestureDetector(
                    onTap: ontap,
                    child: Container(
                        width: 130,
                        height: 50,
                        child: Center(
                          child: Text(
                            'View',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        )),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

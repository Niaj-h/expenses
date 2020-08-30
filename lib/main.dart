import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import './screens/spends_screen.dart';
import './screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => TransactionsModel(),
      child: MaterialApp(
        title: 'Expenses Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(accentColor: Colors.grey, fontFamily: 'Noto_Sans'),
        home: HomeScreen(),
        routes: {Spends.routeName: (context) => Spends()},
      ),
    );
  }
}

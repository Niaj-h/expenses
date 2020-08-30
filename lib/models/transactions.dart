import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transactions with ChangeNotifier {
  final String id;
  final String title;
  final DateTime date;
  final DateTime time;
  final int price;
  final Color color;
  Transactions(
      {this.title, this.color, this.date, this.price, this.time, this.id});
}

class TransactionsModel with ChangeNotifier {
  List<Transactions> _dummymodel = [
    // Transactions(
    //   title: 'McDonald\'s',
    //   date: DateTime.now(),
    //   time: DateTime.now(),
    //   price: 150,
    //   color: Colors.redAccent,
    //   id: 'a1',
    // ),
    // Transactions(
    //   title: 'Pizza',
    //   date: DateTime.now(),
    //   time: DateTime.now(),
    //   price: 100,
    //   color: Colors.green,
    //   id: 'a2',
    // )
  ];
  List<Transactions> get dummydata {
    return [..._dummymodel];
  }

  void addTranasactions(String title, int amount, Color usercolor) {
    final _newtx = Transactions(
      color: usercolor,
      id: DateTime.now().toString(),
      title: title,
      price: amount,
      date: DateTime.now(),
      time: DateTime.now(),
    );

    _dummymodel.add(_newtx);
    notifyListeners();
  }

  void deleteTransactions(String tid) {
    _dummymodel.removeWhere((tx) => tx.id == tid);
    notifyListeners();
  }

  int get totalsum {
    var total = 0;
    _dummymodel.forEach((element) {
      total += element.price;
    });
    return total;
  }

  List<Transactions> get recentTransactions {
    return _dummymodel.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }
}

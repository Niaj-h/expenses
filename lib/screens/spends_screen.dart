import 'package:expenses/widgets/spendslist.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../models/transactions.dart';
import '../widgets/inputbyuser.dart';

class Spends extends StatelessWidget {
  static const routeName = '/spends';

  Widget build(BuildContext context) {
    final data = Provider.of<TransactionsModel>(context);
    void showmodalbottomsheets() {
      showModalBottomSheet(
          context: context,
          builder: (_) {
            return InputByUser(data.addTranasactions);
          });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Spends'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Transactions',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 1.5)),
              ),
              ////we can also add filter button where filters can be set and transactions can be view based on filters.
            ],
          ),
          Expanded(
            child: data.dummydata.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        child: AspectRatio(
                          aspectRatio: 2 / 2,
                          child: Image.asset(
                            'images/thinkinggirl.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        'Empty Transactions',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            letterSpacing: 2),
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: data.dummydata.length,
                    itemBuilder: (ctx, i) {
                      var model = data.dummydata[i];
                      return SpendsList(model, model.time.toString());
                    }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black87,
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            showmodalbottomsheets();
          }),
    );
  }
}

import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SpendsList extends StatelessWidget {
  Transactions model;
  String dismisid;

  SpendsList(this.model, this.dismisid);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dismissible(
          direction: DismissDirection.endToStart,
          key: ValueKey(dismisid),
          background: Container(
            color: Colors.red,
            child: Icon(Icons.delete),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 12),
          ),
          onDismissed: (direction) {
            Provider.of<TransactionsModel>(context, listen: false)
                .deleteTransactions(model.id);
          },
          child: ListTile(
            title: Text(
              model.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(backgroundColor: model.color),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(DateFormat('dd MMM').format(model.date)),
                SizedBox(width: 10),
                Text(DateFormat.jm().format(model.time)),
              ],
            ),
            trailing: Text(
              '\$${model.price}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
            width: 250,
            child: Divider(
              color: Colors.black54,
            ))
      ],
    );
  }
}

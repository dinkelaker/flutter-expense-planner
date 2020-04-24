import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                  '\$${NumberFormat("##0.00", "en_US").format(transaction.amount)}',
                  style: Theme.of(context).textTheme.title.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorDark,
                      )),
            ),
          ),
        ),
        title: Text(transaction.title,
            style: Theme.of(context).textTheme.title),
        subtitle: Text(DateFormat('yyyy-MM-dd')
            .format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                icon: Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
                ),
                label: const Text('Delete'),
                textColor:  Theme.of(context).errorColor,
                onPressed: () {
                  deleteTransaction(transaction.id);
                },
              )
            : IconButton(
                icon: Icon(Icons.delete,
                    color: Theme.of(context).errorColor),
                onPressed: () {
                  deleteTransaction(transaction.id);
                },
              ),
      ),
    );
  }
}
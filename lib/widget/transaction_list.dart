import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  child: Card(
                    child: Text(
                        '\$${NumberFormat("##0.00", "en_US").format(transactions[index].amount)}',
                        style: Theme.of(context).textTheme.title.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark,
                            )),
                  ),
                ),
                Column(children: <Widget>[
                  Text(
                    transactions[index].title,
                    style:
                          Theme.of(context).textTheme.title.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                  ),
                  Text(DateFormat('yyyy-MM-dd')
                      .format(transactions[index].date)),
                ]),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isNotEmpty
        ? Container(
          child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                              '\$${NumberFormat("##0.00", "en_US").format(transactions[index].amount)}',
                              style: Theme.of(context).textTheme.title.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColorDark,
                                  )),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.title),
                    subtitle: Text(DateFormat('yyyy-MM-dd')
                        .format(transactions[index].date)),
                    trailing: MediaQuery.of(context).size.width > 360
                        ? FlatButton.icon(
                            icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                            ),
                            label: Text('Delete'),
                            textColor: Theme.of(context).errorColor,
                            onPressed: () {
                              deleteTransaction(transactions[index].id);
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.delete,
                                color: Theme.of(context).errorColor),
                            onPressed: () {
                              deleteTransaction(transactions[index].id);
                            },
                          ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
        )
        : Column(
            children: <Widget>[
              Text('No transaction added yet!'),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child:
                    Image.asset('assets/images/waiting.png', fit: BoxFit.cover),
              )
            ],
          );
  }
}

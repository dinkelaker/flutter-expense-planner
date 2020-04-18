import 'package:expense_planner/model/transaction.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
                children: transactions.map((tx) {
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
                              color: Colors.purple[50],
                              width: 2,
                            ),
                          ),
                          child: Card(
                            child: Text(
                              '\$${NumberFormat("##0.00", "en_US").format(tx.amount)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                        Column(children: <Widget>[
                          Text(tx.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(DateFormat('yyyy-MM-dd').format(tx.date)),
                        ]),
                      ],
                    ),
                  );
                }).toList(),
      ),
    );
  }
}
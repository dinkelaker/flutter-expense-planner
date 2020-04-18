import 'package:expense_planner/widget/new_transaction.dart';
import 'package:expense_planner/widget/transaction_list.dart';
import 'package:flutter/material.dart';

import '../model/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserTransactionsState();
  }
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now()),
  ];

  var _nextId = 3;

  void _addTransaction(String title, double amount) {
    var nextId = _nextId;
    var transaction = Transaction(
        id: 't${nextId++}',
        title : title,
        amount : amount,
        date: DateTime.now());
    print('New Transacion: ${transaction.title}');

    setState(() {
    _transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }

}

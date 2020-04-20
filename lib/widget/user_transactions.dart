import 'package:flutter/material.dart';

import './transaction_list.dart';
import '../model/transaction.dart';

class UserTransactions extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  UserTransactions(this.transactions, this.deleteTransaction);

  @override
  State<StatefulWidget> createState() {
    return _UserTransactionsState(transactions, deleteTransaction);
  }
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  _UserTransactionsState(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(transactions, deleteTransaction),
      ],
    );
  }
}

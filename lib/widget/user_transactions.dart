import 'package:flutter/material.dart';

import './transaction_list.dart';
import '../model/transaction.dart';

class UserTransactions extends StatefulWidget {
  final List<Transaction> transactions;

  UserTransactions(this.transactions);

  @override
  State<StatefulWidget> createState() {
    return _UserTransactionsState(transactions);
  }
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions;

  _UserTransactionsState(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(transactions),
      ],
    );
  }
}

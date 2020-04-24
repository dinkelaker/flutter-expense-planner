import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

import './transaction_list_item.dart';
import './empty_transaction_list_placeholder.dart';

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
                return TransactionListItem(transaction: transactions[index], deleteTransaction: deleteTransaction);
              },
              itemCount: transactions.length,
            ),
        )
        : EmptyTransactionListPlaceholder();
  }
}

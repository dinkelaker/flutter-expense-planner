import 'package:flutter/material.dart';

class EmptyTransactionListPlaceholder extends StatelessWidget {
  const EmptyTransactionListPlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          const Text('No transaction added yet!'),
          const SizedBox(
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
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _submitData() {
    var text = titleController.text;
    var parse = double.parse(amountController.text);

    if (text.isEmpty || parse <= 0) return;

    addTransaction(text, parse);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    onSubmitted: (_) => _submitData(),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(),
                  ),
                  FlatButton(
                    child: Text('Add Transaction'),
                    textColor: Colors.blue,
                    onPressed: _submitData,
                  )
                ])));
  }
}

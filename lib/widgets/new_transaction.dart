import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double) newTransactionCB;
  NewTransaction(this.newTransactionCB);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountController = TextEditingController();
  final titleController = TextEditingController();

  void submitTransaction() {
    final inputTxTitle = titleController.text;
    final inputTxAmount = amountController.text;

    if(inputTxTitle.isEmpty || inputTxAmount.isEmpty)
      return;

    widget.newTransactionCB(
      inputTxTitle,
      double.parse(inputTxAmount),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTransaction(),
            ),
            TextButton(
              onPressed: submitTransaction,
              child: Text(
                "Add Transaction",
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}

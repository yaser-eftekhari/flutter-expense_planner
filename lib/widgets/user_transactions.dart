import 'package:flutter/material.dart';

import 'new_transaction.dart';
import 'transaction_list.dart';

import '../model/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "id1",
      title: "new shoes",
      amount: 69.75,
      date: DateTime.now(),
    ),
    Transaction(
      id: "id2",
      title: "groceries",
      amount: 112.64,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String newTitle, double newAmount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        amount: newAmount,
        date: DateTime.now(),
        title: newTitle);

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}

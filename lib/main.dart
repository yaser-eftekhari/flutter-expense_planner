import 'package:flutter/material.dart';

import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';

import 'model/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _showNewTransactionModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(onPressed: () {
            _showNewTransactionModal(context);
          }, icon: Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Text("Chart goes here!"),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNewTransactionModal(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

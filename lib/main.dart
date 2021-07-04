import 'package:flutter/material.dart';

import './transaction.dart';

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

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: [
          Card(
            child: Text("Chart goes here!"),
          ),
          Column(
            children: [
              ...transaction.map(
                (tx) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          child: Text(tx.amount.toString()),
                        ),
                        Column(
                          children: [
                            Text(tx.title),
                            Text(
                              tx.date.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

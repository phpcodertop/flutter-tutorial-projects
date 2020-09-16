import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand'
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    // Transaction(id: '1', title: 'Buy a phone', amount: 20, date: DateTime.now()),
    // Transaction(id: '2', title: 'Buy a pc', amount: 200, date: DateTime.now()),
    // Transaction(id: '2', title: 'Weekly Grocery', amount: 200, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(
        days: 7
      )));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        amount: txAmount,
        title: txTitle,
        date: selectedDate
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (bCtx) {
      return GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.opaque,
        child: NewTransaction(_addNewTransaction),
      );
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Personal Expenses'),
      actions: [
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: Icon(Icons.add),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height * 0.32) - appBar.preferredSize.height - MediaQuery.of(context).padding.top,
              child: Chart(_recentTransactions)
            ),
            Container(height: (MediaQuery.of(context).size.height * 0.7) - appBar.preferredSize.height - MediaQuery.of(context).padding.top, child: TransactionList(_userTransactions, _deleteTransaction)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

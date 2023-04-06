import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_budget_app/widget/chart.dart';
import './models/tranaction.dart';
import './widget/new_transaction.dart';
import './widget/transaction_list.dart';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal expensive',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              button: const TextStyle(
                color: Colors.white,
              ),
            ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recetTransactions {
    var items = _userTransactions.where((element) =>
        element.date.isAfter(DateTime.now().subtract(const Duration(days: 7))));
    return items.toList();
  }

  bool showChart = false;

  void _addNewTransaction(String title, double amount, DateTime date_time) {
    final newTrans = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date_time,
    );

    setState(() {
      _userTransactions.add(newTrans);
    });
  }

  void _startModalNewItem(BuildContext ctxt) {
    showModalBottomSheet(
      context: ctxt,
      builder: (_) => NewTransaction(_addNewTransaction),
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: const Text("Personal Expensive "),
      actions: [
        IconButton(
            onPressed: () => _startModalNewItem(context),
            icon: const Icon(Icons.add))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Show Bar",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Switch(
                    value: showChart,
                    onChanged: (val) {
                      setState(() {
                        showChart = val;
                      });
                    }),
              ],
            ),
            showChart
                ? 
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                        0.7,
              child: Chart(_recetTransactions),
                  )
                :
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.7,
              child: TransactionList(_userTransactions, _deleteTransaction),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startModalNewItem(context),
      ),
    );
    ;
  }
}

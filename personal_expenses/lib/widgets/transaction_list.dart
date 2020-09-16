import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;
  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty ? Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          'No Transactions added yet.',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          height: 200,
          child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,)
        ),
      ],
    ) : ListView.builder(
      itemBuilder: (ctx, index) {
        final tx = transactions[index];
        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: FittedBox(
                  child: Text(
                    '\$${tx.amount.toStringAsFixed(2)}',
                  ),
                ),
              ),
            ),
            title: Text(
                tx.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(tx.date),
              style: TextStyle(
                  color: Colors.grey,
              ),
            ),
            trailing: IconButton(
              color: Theme.of(context).errorColor,
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteTransaction(transactions[index].id);
              },
            ),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }
}

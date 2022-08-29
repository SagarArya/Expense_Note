import 'dart:math';

import 'package:expense_note/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgcolor;
  void initState(){
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.purple,
      Colors.teal,
    ];
    _bgcolor = availableColors[Random().nextInt(availableColors.length)];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgcolor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
                child: Text('\$${widget.transaction.amount}')),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle:
        Text(DateFormat.yMMMd().format(widget.transaction.date)),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
          icon: const Icon(Icons.delete),
          textColor: Colors.red,
          label: const Text("Delete"),
          onPressed: () => widget.deleteTx(widget.transaction.id),
        )
            : IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.red,
          onPressed: () => widget.deleteTx(widget.transaction.id),
        ),
      ),
    );
  }
}
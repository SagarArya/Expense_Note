import 'package:expense_note/models/transaction.dart';
import 'package:expense_note/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
        // : ListView.builder(
        //     itemBuilder: (ctx, index) {
        //       // return Card(
        //       //   child: Row(
        //       //     children: [
        //       //       Container(
        //       //         child: Text(
        //       //           '\$${transactions[index].amount.toStringAsFixed(2)}',
        //       //           style: TextStyle(
        //       //               fontWeight: FontWeight.bold,
        //       //               fontSize: 20,
        //       //               color: Theme.of(context).primaryColor),
        //       //         ),
        //       //         margin: EdgeInsets.symmetric(
        //       //           vertical: 10,
        //       //           horizontal: 15,
        //       //         ),
        //       //         decoration: BoxDecoration(
        //       //             border: Border.all(
        //       //           color: Theme.of(context).primaryColor,
        //       //           width: 2,
        //       //         )),
        //       //         padding: EdgeInsets.all(10),
        //       //       ),
        //       //       Column(
        //       //         crossAxisAlignment: CrossAxisAlignment.start,
        //       //         children: [
        //       //           Text(transactions[index].title,
        //       //               style: Theme.of(context).textTheme.headline6),
        //       //           Text(
        //       //             DateFormat('yyyy/MM/dd')
        //       //                 .format(transactions[index].date),
        //       //             style: TextStyle(color: Colors.grey),
        //       //           ),
        //       //         ],
        //       //       )
        //       //     ],
        //       //   ),
        //       // );
        //       return TransactionItem(
        //         key: ValueKey(transactions[index].id),
        //         transaction: transactions[index],
        //         deleteTx: deleteTx,
        //       );
        //     },
        //     itemCount: transactions.length,
        //   );
    : ListView(
      children: transactions.map((tx) => TransactionItem(
              key: ValueKey(tx.id),
              transaction: tx,
              deleteTx: deleteTx,
            )).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 790,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'Nenhuma Transação cadastradas',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20), //Apenas para dar espaçamento
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            child: Text(
                              'R\$${tr.value}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(
                        DateFormat('d MMM y').format(tr.date),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).colorScheme.error,
                        onPressed: () => onRemove(tr.id),
                      )),
                );
              },
            ),
    );
  }
}

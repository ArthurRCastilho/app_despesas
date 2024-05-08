import 'package:app_despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tênis de Corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        // mainAxisAlignmente e crossAxisAlignment, são usados para alinhar os widgets
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: const Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Gráfico'),
            ),
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tr.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM y').format(tr.date),
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  TextField(
                    controller: valueController,
                    decoration: const InputDecoration(
                      labelText: 'Digite o valor (R\$)',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          print(titleController);
                          print(valueController.text);
                        },
                        style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll<Color>(Colors.purple),
                        ),
                        child: const Text('Nova Transação'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:app_despesas/components/adaptative_button.dart';
import 'package:app_despesas/components/adaptive_textfield.dart';
import 'package:flutter/material.dart';
import './adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Card(
        elevation: 5 + (mediaQuery.viewInsets.bottom),
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + (mediaQuery.viewInsets.bottom),
          ),
          child: Column(
            children: <Widget>[
              AdaptiveTextFiel(
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                label: 'Titulo',
                keyboardType: TextInputType.multiline,
              ),
              AdaptiveTextFiel(
                  controller: _valueController,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                  onSubmitted: (_) => _submitForm(),
                  label: 'Digite o valor (R\$)'),
              AdaptiveDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    label: 'Nova Transação',
                    onPressed: _submitForm,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

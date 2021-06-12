import 'package:flutter/material.dart';
import 'package:financier/pages/HomePages/EntryModel/entry.dart';

class EnterDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EnterDetailsState();
  }
}

class _EnterDetailsState extends State<EnterDetails> {
  Entry en = new Entry();
  TextEditingController controller;
  String date;
  String perticular;
  double amount;
  String furtherDescription;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildDate() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Date'),
      validator: (String value) {
        if (value.isEmpty) return 'Name is required';
      },
      onSaved: (String value) {
        date = value;
      },
    );
  }

  Widget _buildPerticular() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Perticular'),
      validator: (String value) {
        if (value.isEmpty) return 'Perticular is required';
      },
      onSaved: (String value) {
        perticular = value;
      },
    );
  }

  Widget _buildAmount() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Amount'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        double amount = double.tryParse(value);
        if (value.isEmpty) return 'Amount is required';
        if (amount <= 0) {
          return 'Amount cannot be negative';
        }
      },
      onSaved: (String value) {
        amount = double.tryParse(value);
      },
    );
  }

  Widget _buildFurtherDescription() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      validator: (String value) {
        if (value.isEmpty) return 'Description is required';
      },
      onSaved: (String value) {
        furtherDescription = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Details Page'),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDate(),
              _buildPerticular(),
              _buildAmount(),
              _buildFurtherDescription(),
              RaisedButton(
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  _formKey.currentState.save();
                  en.date = date;
                  en.perticular = perticular;
                  en.amount = amount;
                  en.furtherDescription = furtherDescription;

                  Navigator.pop(context, en);
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

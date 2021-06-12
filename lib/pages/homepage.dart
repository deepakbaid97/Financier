import 'package:flutter/material.dart';

import 'HomePages/Income.dart';
import 'HomePages/Expense.dart';
import 'HomePages/Savings.dart';
import 'HomePages/Debtors.dart';
import 'HomePages/Creditors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'TOTAL INCOME:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.green),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'TOTAL EXPENSE:',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 40, color: Colors.red),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CreateButton('Income', Colors.grey[300],
                          Income()), // Income Page Button
                      SizedBox(height: 100.0),
                      SizedBox(width: 40),
                      CreateButton('Expense', Colors.yellow[300],
                          Expense()), // Income Page Button
                      SizedBox(height: 20.0),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CreateButton('Debtors', Colors.red[200],
                          Debtors()), // Income Page Button
                      SizedBox(height: 20.0),
                      SizedBox(width: 40),
                      CreateButton('Creditors', Colors.green[200],
                          Creditors()), // Income Page Button
                      SizedBox(height: 20.0),
                    ],
                  ),
                ],
              ),
            ),

            // CreateButton(
            //     'Savings', Colors.blue[200], Savings()), // Income Page Button
            // SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class CreateButton extends StatelessWidget {
  final String name;
  final pageName;
  final Color color;

  CreateButton(this.name, this.color, this.pageName);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => pageName,
          )),
      child: Text(
        '$name',
        style: TextStyle(fontSize: 15),
      ),
      color: color,
    );
  }
}

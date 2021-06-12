import 'package:flutter/material.dart';

import '../../widgets/database_helper.dart';
import '../enterdetails.dart';
import 'package:financier/pages/HomePages/EntryModel/entry.dart';

class Creditors extends StatefulWidget {
  _CreditorsState createState() => _CreditorsState();
}

class _CreditorsState extends State<Creditors> {
  final dbHelper = DatabaseHelper.instance;
  Entry en;
  int ll;
  void insertData(Entry en) async {
    this.en = en;
    await dbHelper.insert(en, 'credit');
  }

  List<Entry> entries;

  queryAll() async {
    entries = await dbHelper.queryAll('credit');
    setState(() {});
  }

  Widget listOfEntries() {
    //insertData(en);
    if (entries == null) {
      queryAll();
      return Center(
        child: Text(
          'No data has been entered yet',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            child: ListTile(
              onTap: () {},
              leading: Text(
                entries[index].amount.toString(),
              ),
              title: Text(entries[index].perticular),
              subtitle: Text(entries[index].date),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creditors'),
      ),
      body: listOfEntries(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push<Entry>(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => EnterDetails(),
              )).then(
            (Entry en) {
              setState(() {
                insertData(en);
                queryAll();
              });
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

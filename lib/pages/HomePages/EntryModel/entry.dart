class Entry {
  int id;
  //@required
  String date;
  //@required
  String perticular;
  //@required
  double amount;
  //@required
  String furtherDescription;

  Entry(
      {this.id,
      this.date,
      this.amount,
      this.perticular,
      this.furtherDescription});

  // Entry.random: this.id = null, this.amount = null
  Entry.fromDb(Map<String, dynamic> map)
      : id = map['id'],
        date = map['date'],
        perticular = map['perticular'],
        amount = map['amount'],
        furtherDescription = map['furtherDescription'];

  Map<String, dynamic> toMapforDb() {
    var map = Map<String, dynamic>();
    //map['id'] = id;
    map['date'] = date;
    map['perticular'] = perticular;
    map['amount'] = amount;
    map['furtherDescription'] = furtherDescription;
    return map;
  }
}

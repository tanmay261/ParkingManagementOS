import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BookParking extends StatefulWidget {
  @override
  _BookParkingState createState() => _BookParkingState();
}

class _BookParkingState extends State<BookParking> {
  final DBfirebaseData = FirebaseDatabase.instance.reference();
  int slot1;

  void readData() {
    DBfirebaseData.once().then((DataSnapshot datasnapshot) {
      slot1 = (datasnapshot.value['slot1']);
      print('I am inside $slot1');
    });
  }

  void updateData() {
    slot1 = slot1 - 1;
    DBfirebaseData.update({'slot1': slot1});
  }

  void addParking() {
    slot1 = slot1 + 1;
    DBfirebaseData.update({'slot1': slot1});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Registration Number', labelText: 'Reg No'),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Vehicle Number', labelText: 'Vehicle No'),
            ),
            SizedBox(height: 15.0),
            Text('Category :- Four Wheeler',),
            ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {
                  readData();
                  updateData();
                },
                child: Container(
                  child: Text('BOOK NOW'),
                )),
            ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {
                  addParking();
                },
                child: Container(
                  child: Text('Clear 1 slot'),
                )),
          ],
        ),
      ),
    ));
  }
}

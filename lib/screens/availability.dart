import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Availability extends StatefulWidget {
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  final DBfirebaseData = FirebaseDatabase.instance.reference();
  int slot1, slot2;

  void readData() {
    DBfirebaseData.once().then((DataSnapshot datasnapshot) {
      setState(() {
        slot1 = (datasnapshot.value['slot1']);
        slot2 = (datasnapshot.value['slot2']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: [
          SizedBox(
            height: 250.0,
          ),
          Text('Slot 1 -- $slot1 ',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400)),
          SizedBox(
            height: 50.0,
          ),
          Text('Slot 2 -- $slot2 ',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400)),
          SizedBox(
            height: 50.0,
          ),
          ElevatedButton(
            style: ButtonStyle(),
            onPressed: () {
              readData();
            },
            child: Container(
              width: 120.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
              ),
              child: Center(
                  child: Text(
                'Check Availability',
                style: TextStyle(fontWeight: FontWeight.w900),
              )),
            ),
          ),
        ],
      ),
    )));
  }
}

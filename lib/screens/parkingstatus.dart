import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ParkingStatus extends StatefulWidget {
  @override
  _ParkingStatusState createState() => _ParkingStatusState();
}

class _ParkingStatusState extends State<ParkingStatus> {
  void initState() {
    super.initState();
    var m = FirebaseFirestore.instance
        .collection('users')
        .doc('z9UFrgauYXnrIwaFSPnM')
        .get();
    print(m);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Image.asset('assets/availability.png', width: 200, height: 200),
            Text(
              'Parking Details',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Text(
                'Email ID : sharad@gmail.com',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Text(
                'Slot : slot1 ',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Text(
                'Category : Four Wheeler',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Text(
                'Status : Parked',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

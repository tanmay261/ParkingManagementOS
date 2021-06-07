import 'package:flutter/material.dart';

class ParkingPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            '''All students wishing to use parking facilities operated by the University Parking Office on the University Park campus, or any property owned or leased by The Lovely Professional University, must register their vehicle with the Parking Office and, while parked, properly display an authorized parking permit.
Parking permits must be properly displayed while parked:
MOTORCYCLES: Permit (sticker) must be clearly visible from the front or rear of the motorcycle. AUTOMOBILES: Hang permit from rearview mirror, facing forward. Permit must be clearly visible. If windshield tint strip prevents clear display, permit hangers are available from the Parking Office.
Exceptions must be approved by the Parking Office in advance.''',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}

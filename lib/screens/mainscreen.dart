import 'package:flutter/material.dart';
import 'package:parkingmanagement/screens/loginscreen.dart';
import 'package:parkingmanagement/screens/newuserpage.dart';

import 'availability.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/newuser.png', width: 200, height: 200),
          GestureDetector(
            child: Text('New User'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewUserPage()),
              );
            },
          ),
          Image.asset('assets/loginuser.png', width: 200, height: 200),
          GestureDetector(
              child: Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }),
          Image.asset('assets/availability.png', width: 200, height: 200),
          GestureDetector(
              child: Text('Availability'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Availability()),
                );
              }),
        ],
      ),
    ));
  }
}

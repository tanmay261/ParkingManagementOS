import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:parkingmanagement/screens/bookparking.dart';
import 'package:parkingmanagement/screens/parkingpolicy.dart';
import 'package:parkingmanagement/screens/parkingstatus.dart';

class LoginUserMenu extends StatefulWidget {
  @override
  _LoginUserMenuState createState() => _LoginUserMenuState();
}

class _LoginUserMenuState extends State<LoginUserMenu> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
          child: Column(
            children: [
              ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookParking()),
                    );
                  },
                  child: Container(
                    child: Text('BOOK NOW'),
                  )),
              Divider(height: 10.0, thickness: 2.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Parking Details'),
                      Image.asset(
                        'assets/parking.png',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 250.0,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Vehicle Number',
                              labelText: 'Vehicle No',
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ParkingStatus()),
                            );
                          },
                          child: Container(
                            child: Text('Get Details'),
                          ),
                        ),
                      ]),
                ],
              ),
              Divider(height: 30.0, thickness: 2.0),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/loginuser.png',
                          height: 100,
                          width: 100,
                        ),
                        Text('Log Out'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ParkingPolicy()),
                      );
                    },
                    child: Column(children: [
                      Image.asset(
                        'assets/policy.png',
                        height: 100,
                        width: 100,
                      ),
                      Text('Parking Policy'),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

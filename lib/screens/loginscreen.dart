import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parkingmanagement/authentication_service.dart';
import 'package:parkingmanagement/screens/loginusermenu.dart';
import 'package:parkingmanagement/screens/newuserpage.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = new TextEditingController();

    final TextEditingController passwordcontroller =
        new TextEditingController();
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Text('Login Page', style: TextStyle(fontSize: 20.0)),
          TextFormField(
            controller: emailcontroller,
            decoration: InputDecoration(
              hintText: 'Enter Your Email ID',
              labelText: 'Email ID',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: passwordcontroller,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter Your Password',
              labelText: 'Password',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signIn(
                        email: emailcontroller.text.trim(),
                        password: passwordcontroller.text.trim(),
                      );
                  var doc =
                      FirebaseFirestore.instance.collection('users').doc();
                  doc.set({'email': emailcontroller.text.trim()});
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginUserMenu()),
                  );
                },
                child: Container(
                  child: Text('Submit'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewUserPage()),
                  );
                },
                child: Container(
                  child: Text('New User'),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

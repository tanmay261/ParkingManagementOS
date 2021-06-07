import 'package:flutter/material.dart';
import 'package:parkingmanagement/screens/bookparking.dart';
import 'package:provider/provider.dart';
import '../authentication_service.dart';

class NewUserPage extends StatelessWidget {
  final TextEditingController emailcontroller = new TextEditingController();

  final TextEditingController passwordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = new TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('New User Registration Page',
                  style: TextStyle(fontSize: 20.0)),
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: 'Enter Your Email ID',
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  labelText: 'Password',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signUp(
                        email: emailcontroller.text.trim(),
                        password: passwordcontroller.text.trim(),
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookParking()),
                  );
                },
                child: Container(
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

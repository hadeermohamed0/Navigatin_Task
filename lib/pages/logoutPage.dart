import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("You have been logged out of the app.",style: TextStyle(
          fontSize: MediaQuery.of(context).size.width*.05,
          color: Colors.red,
        ),),
      ),
    );
  }
}

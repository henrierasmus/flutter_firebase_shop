import 'package:flutter/material.dart';
import 'package:flutter_assessmet/models/user.dart';
import 'package:flutter_assessmet/screens/authenticate/authenticate.dart';
import 'package:flutter_assessmet/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // Return home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

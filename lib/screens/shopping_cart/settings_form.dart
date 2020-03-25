import 'package:flutter/material.dart';
import 'package:flutter_assessmet/models/userDataModel.dart';
import 'package:flutter_assessmet/services/userData.dart';
import 'package:flutter_assessmet/shared/constants.dart';
import 'package:flutter_assessmet/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_assessmet/models/user.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  // form values
  String _currentName;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user.uid);

    return StreamBuilder<UserData>(
        stream: DataBaseService(uid: user.uid).getUserData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            print('test');
            print(userData.name);

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your username',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a username' : userData.name,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text('Update'),
                    onPressed: () async {
                      print(_currentName);
                    },
                  )
                ],
              ),
            );
          } else {
            print('error');

            return Loading();
          }
        });
  }
}

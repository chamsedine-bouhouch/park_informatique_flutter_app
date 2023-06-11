import 'package:flutter/material.dart';
import 'package:flutter_app/components/data_table.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        // alignment: Alignment.topLeft,
        child: UserDataTable(),
        /* child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
           Text('Users page')
          ],
        ),*/
      ),
    );
  }
}

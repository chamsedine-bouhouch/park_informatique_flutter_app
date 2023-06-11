import 'package:flutter/material.dart';

class ListCards extends StatelessWidget {
  const ListCards({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        InkWell(
          // onTap: (){
          //   Navigator.pushNamed(context, 'home')
          // },          child: Card(elevation: 2, child: Text("data")),
        )
      ],
    );
    throw UnimplementedError();
  }
}

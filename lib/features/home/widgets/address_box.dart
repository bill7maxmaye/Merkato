import 'package:flutter/material.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 114, 226, 221),
            const Color.fromARGB(255, 162, 236, 233),
          ],
          stops: [0.5, 0.1],
        ),
      ),
      padding: EdgeInsets.only(left: 10),
      child: Row(children: [
        const Icon(Icons.location_on_outlined, size: 20),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:merkato/constants/global_variables.dart';
import 'package:merkato/features/account/widgets/below_app_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: GlobalVariables.appBarGradient)),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        'assets/images/amazon_in.png',
                        fit: BoxFit.contain,
                        width: 120,
                        height: 45,
                        color: Colors.black,
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.notifications_outlined),
                      ),
                      Icon(Icons.search),
                    ]),
                  ),
                ]),
          )),
      body: Column(
        children: const [BelowAppBar()],
      ),
    );
  }
}

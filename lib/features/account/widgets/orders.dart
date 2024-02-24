import 'package:flutter/material.dart';
import 'package:merkato/constants/global_variables.dart';
import 'package:merkato/features/account/widgets/single_product.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
//temporary list

  List list = [
    'https://plus.unsplash.com/premium_photo-1670274606895-f2dc713f8a90?q=80&w=1073&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1670274606895-f2dc713f8a90?q=80&w=1073&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1670274606895-f2dc713f8a90?q=80&w=1073&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1670274606895-f2dc713f8a90?q=80&w=1073&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 18,
                  color: GlobalVariables.selectedNavBarColor,
                ),
              ),
            )
          ],
        ),

        //display orders

        Container(
          height: 170,
          padding: EdgeInsets.only(left: 10, right: 0, top: 20),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SingleProduct(image: list[index]);
              }),
        ),

        //duplicated the orders to display the recent orders

        SizedBox(
          height: 10,
        ),

        Container(
          height: 170,
          padding: EdgeInsets.only(left: 10, right: 0, top: 20),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SingleProduct(image: list[index]);
              }),
        )
      ],
    );
  }
}

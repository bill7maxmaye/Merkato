import 'package:flutter/material.dart';
import 'package:merkato/features/admin/screens/add_product_screen.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "this is the post page where the admin adds the products to be posted",
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToAddProduct();
        },
        child: Icon(Icons.add),
        tooltip: 'Add a new product',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

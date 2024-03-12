import 'package:flutter/material.dart';
import 'package:merkato/common/widgets/loader.dart';
import 'package:merkato/features/admin/screens/add_product_screen.dart';
import 'package:merkato/features/admin/services/admin_services.dart';
import 'package:merkato/models/product.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}

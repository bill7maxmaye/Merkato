import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:merkato/common/widgets/custom_button.dart';
import 'package:merkato/common/widgets/custom_textField.dart';
import 'package:merkato/constants/global_variables.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  String category = 'Mobiles';

  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials'
        'Appliances'
        'Books'
        'Fashion'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            centerTitle: true,
            flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: GlobalVariables.appBarGradient)),
            title: Text(
              'Add Product',
              style: TextStyle(color: Colors.black),
            ),
          )),
      body: SingleChildScrollView(
          child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 20),
              DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 4],
                  strokeCap: StrokeCap.round,
                  child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.folder_open,
                            size: 40,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Select Product Image',
                            style: TextStyle(
                                color: Colors.grey.shade400, fontSize: 15),
                          )
                        ],
                      ))),
              SizedBox(height: 30),
              CustomTextField(
                  controller: productNameController, hintText: 'Product Name'),
              SizedBox(height: 10),
              CustomTextField(
                  maxLines: 7,
                  controller: descriptionController,
                  hintText: 'Description'),
              SizedBox(height: 10),
              CustomTextField(controller: priceController, hintText: 'Price'),
              SizedBox(height: 10),
              CustomTextField(
                  controller: quantityController, hintText: 'Quantity'),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: DropdownButton(
                    value: category,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    }),
              ),
              SizedBox(height: 10),
              CustomButton(text: 'Sell Product', onTap: () {})
            ],
          ),
        ),
      )),
    );
  }
}

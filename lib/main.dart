import 'package:flutter/material.dart';

import 'constants/global_variables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black))
          // ,colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text("Merkato"),
            ),
            // backgroundColor: Colors.cyan,
          ),
          body: Column(children: [
            const Center(child: Text('Merkato')),
            ElevatedButton(onPressed: () {}, child: Text("bill"))
          ])),
    );
  }
}

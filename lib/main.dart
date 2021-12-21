import 'package:flutter/material.dart';
import 'package:flutter_app/views/firstScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}

//
// import 'package:flutter/material.dart';
//
// main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   MyAppState createState() {
//     return new MyAppState();
//   }
// }
//
// class MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: RadioListBuilder(
//           num: 20,
//         ),
//       ),
//     );
//   }
// }
//
// class RadioListBuilder extends StatefulWidget {
//   final int num;
//
//   const RadioListBuilder({Key? key, required this.num}) : super(key: key);
//
//   @override
//   RadioListBuilderState createState() {
//     return RadioListBuilderState();
//   }
// }
//
// class RadioListBuilderState extends State<RadioListBuilder> {
//   int? value;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         return RadioListTile(
//           value: index,
//           groupValue: value,
//           onChanged: (ind) => setState(() => value = int.parse(ind.toString())),
//           title: Text("Number $index"),
//         );
//       },
//       itemCount: widget.num,
//     );
//   }
// }
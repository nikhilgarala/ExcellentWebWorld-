import 'package:flutter/cupertino.dart'; // ignore:file_names
import 'package:flutter/material.dart';
import 'package:flutter_app/views/secondScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore:file_names
class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secoundController = TextEditingController();
  late double screenHeight, screenWidth;
  final _formKey = GlobalKey<FormState>();

  void checkValidValue() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (int.parse(_firstController.text.trim().toString()) <
          int.parse(_secoundController.text.trim().toString())) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondScreen(
              lastListMenu:
                  int.parse(_secoundController.text.trim().toString()),
              firstListMenu: int.parse(_firstController.text.trim().toString()),
            ),
          ),
        );
      } else {
        Fluttertoast.showToast(
          msg: 'Please enter valid numbers',
          textColor: Colors.white,
          gravity: ToastGravity.CENTER,
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.black,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _firstController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.toString().isEmpty) {
                        return 'Please Enter Main list length';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'First List Length',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    controller: _secoundController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Second list length';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Second List Length',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  ButtonTheme(
                    height: 50.0,
                    minWidth: screenWidth,
                    child: RaisedButton(
                      onPressed: () => checkValidValue(),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

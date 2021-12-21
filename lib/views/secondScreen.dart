import 'package:flutter/cupertino.dart'; // ignore: file_names
import 'package:flutter/material.dart';

// ignore: file_names
class SecondScreen extends StatefulWidget {
  int firstListMenu;
  int lastListMenu;

  SecondScreen({
    required this.firstListMenu,
    required this.lastListMenu,
  });

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late double screenHeight, screenWidth;
  int value = 00;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.firstListMenu,
                  itemBuilder: (context, indexs) {
                    return ExpansionTile(
                      title: Text('Main Item ${indexs.toString()}'),
                      children: <Widget>[
                        ListView.builder(
                          itemBuilder: (context, index) {
                            int radioGroup = 00;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                RadioListTile(
                                    value: radioGroup,
                                    groupValue: value,
                                    key: Key(radioGroup.toString()),
                                    onChanged: (ind) {
                                      setState(() => value = int.parse(
                                            ind.toString(),
                                          ));
                                      debugPrint(
                                          '1-1-1-1 Check ${ind.toString()}');
                                    }),
                                Text('Sub Item ${index.toString()}')
                              ],
                            );
                          },
                          itemCount: widget.lastListMenu,
                          shrinkWrap: true,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//
// int _radioSelected = 1;**
// String _radioVal;
//
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text('Male'),
// Radio(
// value: 1,
// groupValue: _radioSelected,
// activeColor: Colors.blue,
// onChanged: (value) {
// setState(() {
// _radioSelected = value;
// _radioVal = 'male';
// });
// },
// ),
// Text('Female'),
// Radio(
// value: 2,
// groupValue: _radioSelected,
// activeColor: Colors.pink,
// onChanged: (value) {
// setState(() {
// _radioSelected = value;
// _radioVal = 'female';
// });
// },
// )
// ],
// ),


// class CustomRadio extends StatefulWidget {
//   @override
//   createState() {
//     return new CustomRadioState();
//   }
// }
//
// class CustomRadioState extends State<CustomRadio> {
//   List<RadioModel> sampleData = new List<RadioModel>();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     sampleData.add(new RadioModel(false, 'A', 'April 18'));
//     sampleData.add(new RadioModel(false, 'B', 'April 17'));
//     sampleData.add(new RadioModel(false, 'C', 'April 16'));
//     sampleData.add(new RadioModel(false, 'D', 'April 15'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text("ListItem"),
//       ),
//       body: new ListView.builder(
//         itemCount: sampleData.length,
//         itemBuilder: (BuildContext context, int index) {
//           return new InkWell(
//             //highlightColor: Colors.red,
//             splashColor: Colors.blueAccent,
//             onTap: () {
//               setState(() {
//                 sampleData.forEach((element) => element.isSelected = false);
//                 sampleData[index].isSelected = true;
//               });
//             },
//             child: new RadioItem(sampleData[index]),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class RadioItem extends StatelessWidget {
//   final RadioModel _item;
//   RadioItem(this._item);
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       margin: new EdgeInsets.all(15.0),
//       child: new Row(
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           new Container(
//             height: 50.0,
//             width: 50.0,
//             child: new Center(
//               child: new Text(_item.buttonText,
//                   style: new TextStyle(
//                       color:
//                       _item.isSelected ? Colors.white : Colors.black,
//                       //fontWeight: FontWeight.bold,
//                       fontSize: 18.0)),
//             ),
//             decoration: new BoxDecoration(
//               color: _item.isSelected
//                   ? Colors.blueAccent
//                   : Colors.transparent,
//               border: new Border.all(
//                   width: 1.0,
//                   color: _item.isSelected
//                       ? Colors.blueAccent
//                       : Colors.grey),
//               borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
//             ),
//           ),
//           new Container(
//             margin: new EdgeInsets.only(left: 10.0),
//             child: new Text(_item.text),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class RadioModel {
//   bool isSelected;
//   final String buttonText;
//   final String text;
//
//   RadioModel(this.isSelected, this.buttonText, this.text);
// }
//
//
// lass MyRadioListTile<T> extends StatelessWidget {
// final T value;
// final T groupValue;
// final String leading;
// final Widget? title;
// final ValueChanged<T?> onChanged;
//
// const MyRadioListTile({
// required this.value,
// required this.groupValue,
// required this.onChanged,
// required this.leading,
// this.title,
// });
//
// @override
// Widget build(BuildContext context) {
//   final title = this.title;
//   return InkWell(
//     onTap: () => onChanged(value),
//     child: Container(
//       height: 56,
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: Row(
//         children: [
//           _customRadioButton,
//           SizedBox(width: 12),
//           if (title != null) title,
//         ],
//       ),
//     ),
//   );
// }
//
// Widget get _customRadioButton {
//   final isSelected = value == groupValue;
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//     decoration: BoxDecoration(
//       color: isSelected ? Colors.blue : null,
//       borderRadius: BorderRadius.circular(4),
//       border: Border.all(
//         color: isSelected ? Colors.blue : Colors.grey[300]!,
//         width: 2,
//       ),
//     ),
//     child: Text(
//       leading,
//       style: TextStyle(
//         color: isSelected ? Colors.white : Colors.grey[600]!,
//         fontWeight: FontWeight.bold,
//         fontSize: 18,
//       ),
//     ),
//   );
// }
// }

//
// class _MyPageState extends State<MyPage> {
//   int _value = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           MyRadioListTile<int>(
//             value: 1,
//             groupValue: _value,
//             leading: 'A',
//             title: Text('One'),
//             onChanged: (value) => setState(() => _value = value!),
//           ),
//           MyRadioListTile<int>(
//             value: 2,
//             groupValue: _value,
//             leading: 'B',
//             title: Text('Two'),
//             onChanged: (value) => setState(() => _value = value!),
//           ),
//           MyRadioListTile<int>(
//             value: 3,
//             groupValue: _value,
//             leading: 'C',
//             title: Text('Three'),
//             onChanged: (value) => setState(() => _value = value!),
//           ),
//         ],
//       ),
//     );
//   }
// }

//
//
// import 'package:flutter/material.dart';
//
// class Parent extends StatefulWidget {
//   Parent({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   _ParentState createState() => _ParentState();
// }
//
// class _ParentState extends State<Parent> {
//   int _selectedItem = 0;
//
//   selectItem(index) {
//     setState(() {
//       _selectedItem = index;
//       print(selectItem.toString());
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //...YOUR WIDGET TREE HERE
//
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: 5,
//       itemBuilder: (context, index) {
//         return CustomItem(
//           selectItem, // callback function, setstate for parent
//           index: index,
//           isSelected: _selectedItem == index,
//           title: index.toString(),
//         );
//       },
//     );
//   }
// }
//
// class CustomItem extends StatefulWidget {
//   final String title;
//   final int index;
//   final bool isSelected;
//   Function(int) selectItem;
//
//   CustomItem(
//       this.selectItem, {
//         Key key,
//         this.title,
//         this.index,
//         this.isSelected,
//       }) : super(key: key);
//
//   _CustomItemState createState() => _CustomItemState();
// }
//
// class _CustomItemState extends State<CustomItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Text("${widget.isSelected ? "true" : "false"}"),
//         RaisedButton(
//           onPressed: () {
//             widget.selectItem(widget.index);
//           },
//           child: Text("${widget.title}"),
//         )
//       ],
//     );
//   }
// }

//
//
// @override
// Widget build(BuildContext context) {
//   return new MaterialApp(
//       home: new Scaffold(
//       appBar: AppBar(
//       title: new Text('Kids Quiz App'),
//   centerTitle: true,
//   backgroundColor: Colors.blue,
//   ),
//   body: new Container(
//   padding: EdgeInsets.all(8.0),
//   child: new Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//   new Text(
//   'Select correct answers from below:',
//   style: new TextStyle(
//   fontSize: 20.0, fontWeight: FontWeight.bold),
//   ),
//   new Padding(
//   padding: new EdgeInsets.all(8.0),
//   ),
//   new Divider(height: 5.0, color: Colors.black),
//   new Padding(
//   padding: new EdgeInsets.all(8.0),
//   ),
//   new Text(
//   'Lion is :',
//   style: new TextStyle(
//   fontWeight: FontWeight.bold,
//   fontSize: 18.0,
//   ),
//   ),
//   new Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//   new Radio(
//   value: 0,
//   groupValue: _radioValue1,
//   onChanged: _handleRadioValueChange1,
//   ),
//   new Text(
//   'Carnivore',
//   style: new TextStyle(fontSize: 16.0),
//   ),
//   new Radio(
//   value: 1,
//   groupValue: _radioValue1,
//   onChanged: _handleRadioValueChange1,
//   ),
//   new Text(
//   'Herbivore',
//   style: new TextStyle(
//   fontSize: 16.0,
//   ),
//   ),
//   new Radio(
//   value: 2,
//   groupValue: _radioValue1,
//   onChanged: _handleRadioValueChange1,
//   ),
//   new Text(
//   'Omnivore',
//   style: new TextStyle(fontSize: 16.0),
//   ),
//   ],
//   ),
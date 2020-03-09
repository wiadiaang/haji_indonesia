// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:async';
// import 'dart:io';
import 'dart:typed_data';

import 'dart:math' as math;
import 'package:simple_flutter_compass/simple_flutter_compass.dart';
import 'package:flutter_compass/flutter_compass.dart';
// import 'package:simple_permissions/simple_permissions.dart';
// import 'package:animated_qr_code_scanner/animated_qr_code_scanner.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jamaah Haji Indonesia',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// var greenColor = Color(0xba313f);
var greenColor = Color(0xFFF44336);
var darkGreenColor = Color(0xFFD50000);
// var productImage = Image.asset('assets/images/mecca.png');

class MyHomePage extends StatelessWidget {
  Uint8List bytes = Uint8List(0);
  // TextEditingController _inputController;
  // TextEditingController _outputController;

  String data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greenColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(108.0)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 8.0),
                          // Icon(Icons.arrow_back),
                          SizedBox(height: 8.0),
                          Container(
                            width: 300.0,
                            child: Text(
                              'Selamat Datang',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 32.0),
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            'Jamaah Haji Indonesia',
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 15.0),
                          // Row(children: <Widget>[Padding(padding:const EdgeInsets.only(bottom: 10.0) ,child: Icon(Icons.code),)],)
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.end,
                          //   children: <Widget>[
                          //     Padding(
                          //       padding: const EdgeInsets.only(bottom: 10.0),
                          //       child: Text('\$',
                          //           style: TextStyle(
                          //               color: greenColor,
                          //               fontSize: 24.0,
                          //               fontWeight: FontWeight.bold)),
                          //     ),
                          //     SizedBox(width: 4.0),
                          //     Text('85',
                          //         style: TextStyle(
                          //             color: greenColor,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 52.0)),
                          //   ],
                          // ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Spacer(
                            flex: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             DetailsScreen()));
                                },
                                backgroundColor: greenColor,
                                //  child: Icon(Icons.photo_camera),
                                child: InkWell(
                                  onTap: _scan,
                                  child: Icon(Icons.photo_camera),
                                  // child: Card(
                                  //   child: Column(
                                  //     children: <Widget>[
                                  //       Expanded(
                                  //         flex: 2,
                                  //         child: Icon(Icons.photo_camera),
                                  //       ),

                                  //     ],
                                  //   ),
                                  // ),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.width / 1.7,
                                child: Image.asset(
                                  'assets/images/mecca.png',
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width / 2 - 50,
                          decoration: BoxDecoration(
                              color: darkGreenColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.0),
                                  topRight: Radius.circular(32.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FloatingActionButton(
                                      onPressed: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             KiblatCompass()));
                                      },
                                      backgroundColor: greenColor,
                                      child: Image.asset('assets/icon/icons8-compass-96.png',
                                  fit: BoxFit.cover
                                )),
                                  SizedBox(width: 8.0),
                                  
                                ],
                              ),
                        
                            ],
                          ),
                        ),
                        Container(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width / 2 - 50,
                          decoration: BoxDecoration(
                              color: darkGreenColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.0),
                                  topRight: Radius.circular(32.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '18',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 42.0),
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    'c',
                                    style: TextStyle(color: Colors.white54),
                                  )
                                ],
                              ),
                              Text(
                                'Sunshine',
                                style: TextStyle(color: Colors.white54),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Future navigateToSubPage(context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen(person: new Data())));
  }

  checkingValue(String url, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen(person: new Data())));
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      var data = new Data();
      data.barcode = barcode;
      checkingValue(barcode, null);
      // navigateToSubPage();
    }
  }

// showAlertDialog(BuildContext context) {

//   // set up the buttons
//   Widget cancelButton = FlatButton(
//     child: Text("Cancel"),
//     onPressed:  () {},
//   );
//   Widget continueButton = FlatButton(
//     child: Text("Continue"),
//     onPressed:  () {},
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("Haji Indonesia"),
//     content: Text("Lihat Data Jamaah?"),
//     actions: [
//       cancelButton,
//       continueButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

}

class DetailsScreen extends StatelessWidget {
  final Data person;

  DetailsScreen({Key key, @required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Text('Informasi Detail',
                //     style: TextStyle(
                //         color: Colors.white,
                //         letterSpacing: 1.1,
                //         fontSize: 22.0)),
                SizedBox(height: 32.0),
                Container(
                  width: 200.0,
                  child: Text(
                    'Informasi Detail',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 38.0),
                  ),
                ),
                SizedBox(height: 42.0),
                itemRow(Icons.star, 'water', 'every 7 days'),
                SizedBox(height: 22.0),
                itemRow(Icons.ac_unit, 'Humidity', 'up to 82%'),
                SizedBox(height: 22.0),
                itemRow(Icons.straighten, 'Size', '38" - 48"tdll'),
              ],
            ),
          ),
          SizedBox(height: 32.0),
          // Padding(
          //   padding: const EdgeInsets.only(left: 48.0),
          //   child: Container(
          //     height: 60.0,
          //     decoration: BoxDecoration(
          //         color: darkGreenColor,
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(32.0),
          //             bottomLeft: Radius.circular(32.0))),
          //     child: Row(
          //       children: <Widget>[
          //         SizedBox(width: 20.0),
          //         Icon(Icons.add, color: Colors.white, size: 24.0),
          //         SizedBox(width: 40.0),
          //         Text(
          //           'Delivery Information',
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 22.0,
          //               fontWeight: FontWeight.w500),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(height: 32.0),
          // Padding(
          //   padding: const EdgeInsets.only(left: 48.0),
          //   child: Container(
          //     height: 60.0,
          //     decoration: BoxDecoration(
          //         color: darkGreenColor,
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(32.0),
          //             bottomLeft: Radius.circular(32.0))),
          //     child: Row(
          //       children: <Widget>[
          //         SizedBox(width: 20.0),
          //         Icon(Icons.add, color: Colors.white, size: 24.0),
          //         SizedBox(width: 40.0),
          //         Text(
          //           'Return Policy',
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 22.0,
          //               fontWeight: FontWeight.w500),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Spacer(),
          Container(
            height: 80.0,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    },
                    backgroundColor: darkGreenColor,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                Container(
                    height: 80.0,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: darkGreenColor,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(48.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          'Chat',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  itemRow(icon, name, title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: 6.0),
            Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            )
          ],
        ),
        Text(title, style: TextStyle(color: Colors.white54, fontSize: 20.0))
      ],
    );
  }
}

class Data {
  String barcode;
  // int counter;
  // String dateTime;
  // Data({this.text, this.counter, this.dateTime});
}

class KiblatCompass extends StatefulWidget {
  @override
  _KiblatCompassState createState() => _KiblatCompassState();
}

class _KiblatCompassState extends State<KiblatCompass> {
  double _compas = 0;
  SimpleFlutterCompass _simpleFlutterCompass = SimpleFlutterCompass();
  final _toRadians = 3.1416 / 180;
  double _direction;

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    super.initState();
    FlutterCompass.events.listen((double direction) {
      setState(() {
        _direction = direction;
      });
    });
  }

  Future<void> initPlatformState() async {
    _simpleFlutterCompass.check().then((result) {
      if (result) {
        //set a function to handle the compass data
        _simpleFlutterCompass.setListener(_streamListener);
      } else {
        print("Hardware not available");
      }
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  void _streamListener(double currentHeading) {
    setState(() {
      //we set the new heading value to our _compas variable to display on screen
      _compas = currentHeading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 185, 92, 1),
        title: Center(child: Text("Arah Kiblat")),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: ((_direction ?? 0) * (math.pi / 180) * -1),
              child: Image.asset(
                'assets/images/compass.png',
                height: 350.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
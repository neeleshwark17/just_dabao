import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_dabao/screens/OrderPage.dart';

class ConfirmationPage extends StatefulWidget {
  final String valueTime;
  final String valueDays;

  ConfirmationPage(this.valueTime, this.valueDays);

  @override
  State<StatefulWidget> createState() {
    return ConfirmationPageState(this.valueTime, this.valueDays);
  }
}

class ConfirmationPageState extends State<ConfirmationPage> {
  String valueTime;
  String valueDays;

  ConfirmationPageState(this.valueTime, this.valueDays);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          moveToHome(context);
          return Future.value(false);
        },
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: AppBar(
                backgroundColor: Colors.white,
                title: Align(
                  alignment: Alignment.bottomLeft,
                  child: new Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Image(
                      image: new AssetImage(
                        'assets/images/just_dabao.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: OrientationBuilder(
              builder: (context, orientation) {
                if (orientation == Orientation.portrait) {
                  return potrait();
                } else {
                  return landScape();
                }
              },
            )),
      ),
    );
  }

  Widget potrait() {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: 30, bottom: 30),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
                child: Text(
              'Enjoy your Shiok meal ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: valueDays == ''
                ? Text(
                    'You can pickup the order at $valueTime today ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                : Text(
                    'You can pickup the order at $valueTime on $valueDays,',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                  child: Column(
                    children: <Widget>[
                      Image(
                        width: MediaQuery.of(context).size.width * .25,
                        image: AssetImage('assets/images/eg1.png'),
                      ),
                      Text('You See')
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                  child: Column(
                    children: <Widget>[
                      Image(
                        width: MediaQuery.of(context).size.width * .25,
                        image: AssetImage('assets/images/eg2.png'),
                      ),
                      Text('You Order')
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                  child: Column(
                    children: <Widget>[
                      Image(
                        width: MediaQuery.of(context).size.width * .25,
                        image: AssetImage('assets/images/eg3.png'),
                      ),
                      Text('You Save')
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: RaisedButton(
                  color: Colors.cyan,
                  child: Text('Order Again!'),
                  onPressed: () => {moveToHome(context)},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget landScape() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        // margin: EdgeInsets.only(top: 30, bottom: 30),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                  child: Text(
                'Enjoy your Shiok meal ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
            ),
            Container(
              // margin: EdgeInsets.only(top: 20, bottom: 20),
              child: valueDays == ''
                  ? Text(
                      'You can pickup the order at $valueTime today ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )
                  : Text(
                      'You can pickup the order at $valueTime on $valueDays,',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
            ),
            Container(
              // margin: EdgeInsets.only(top: 30, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Column(
                      children: <Widget>[
                        Image(
                          width: MediaQuery.of(context).size.width * .25,
                          image: AssetImage('assets/images/eg1.png'),
                        ),
                        Text(
                          'You See',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Image(
                          width: MediaQuery.of(context).size.width * .25,
                          image: AssetImage('assets/images/eg2.png'),
                        ),
                        Text(
                          'You Order',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Column(
                      children: <Widget>[
                        Image(
                          width: MediaQuery.of(context).size.width * .23,
                          image: AssetImage('assets/images/eg3.png'),
                        ),
                        Text(
                          'You Save',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text('Order Again!'),
                    onPressed: () => {moveToHome(context)},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> moveToHome(BuildContext context) async {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => OrderPage()

          ///clears route stack
          ),
      (Route<dynamic> route) => false);
  return Future.value(false);
}

// Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ButtonBar(
//                   children: <Widget>[
//                     MaterialButton(
//                       onPressed: _changeScreen,
//                       child: Text('REGISTER'),
//                     ),
//                     MaterialButton(
//                       onPressed: _changeScreen,
//                       child: Text('LOGIN'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               children: <Widget>[
//                 TextField(
//                   decoration: InputDecoration(
//                       border: InputBorder.none, hintText: 'E-MAIL'),
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                       border: InputBorder.none, hintText: 'USERNAME'),
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                       border: InputBorder.none, hintText: 'PASSWORD'),
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: MaterialButton(
//                 onPressed: () => {},
//                 child: Text(_register ? 'REGISTER' : 'LOGIN'),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

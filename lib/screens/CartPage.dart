import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_dabao/models/FoodItemsClass.dart';
import 'package:just_dabao/screens/ConfirmationPage.dart';
import 'package:smart_select/smart_select.dart';

class CartPage extends StatefulWidget {
  final FoodItemClass fIC;

  CartPage(this.fIC);

  @override
  State<StatefulWidget> createState() {
    return CartPageState(this.fIC);
  }
}

class CartPageState extends State<CartPage> {
  FoodItemClass fIC;
  CartPageState(this.fIC);

  String valueDays = 'Days';
  List days = [
    {'value': 'Sunday', 'label': 'Sunday'},
    {'value': 'Monday', 'label': 'Monday'},
    {'value': 'Tuesday', 'label': 'Tuesday'},
    {'value': 'Wednesday', 'label': 'Wednesday'},
    {'value': 'Thursday', 'label': 'Thursday'},
    {'value': 'Friday', 'label': 'Friday'},
    {'value': 'Saturday', 'label': 'Saturday'},
  ];

  String valueTime = 'Time';
  List time = [
    {'value': '04:00', 'label': '04:00'},
    {'value': '04:30', 'label': '04:30'},
    {'value': '05:00', 'label': '05:00'},
    {'value': '05:30', 'label': '05:30'},
    {'value': '06:00', 'label': '06:00'},
    {'value': '06:30', 'label': '06:30'},
    {'value': '07:00', 'label': '07:00'},
  ];

  bool daysSelected = false, timeSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }

  Widget potrait() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 5,
                semanticContainer: true,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 20),
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          fIC.mImageName,
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        '${fIC.mPrice}',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        fIC.mName,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        fIC.mDescription,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        fIC.mSameDayOrder == false
                            ? 'Custom Day delivery available'
                            : 'Same Day Delivery',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: fIC.mSameDayOrder == false
                  ? Container(
                      decoration: BoxDecoration(color: Colors.grey[50]),
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 80,
                      child: SmartSelect.popup(
                        title: 'Pickup Day',
                        value: valueDays,
                        option: SmartSelectOption(days),
                        onChange: (val) => setState(() => {
                              valueDays = val,
                              daysSelected = true,
                              debugPrint(valueDays)
                            }),
                      ),
                    )
                  : Container()),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.infinity,
              height: 80,
              child: SmartSelect.popup(
                title: 'Pickup Time',
                value: valueTime,
                option: SmartSelectOption(time),
                onChange: (val) => setState(() => {
                      valueTime = val,
                      timeSelected = true,
                      debugPrint(valueTime)
                    }),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: RaisedButton(
              color: Colors.cyanAccent,
              child: Text('Place Order'),
              onPressed: () => {
                if (fIC.mSameDayOrder == false)
                  {
                    if (daysSelected == true && timeSelected == true)
                      {
                        showMyDialogWithTimeAndDay(
                            context, valueTime, valueDays),
                      }
                    else
                      {
                        printToast(context, 'Select Delivery details first!'),
                        debugPrint('Select Delivery details first!'),
                      }
                  }
                else if (fIC.mSameDayOrder == true)
                  {
                    if (timeSelected == true)
                      {
                        showMyDialogWithTimeAndDay(context, valueTime, ''),
                      }
                    else
                      {
                        printToast(context, 'Select Delivery details first!'),
                        debugPrint('Select Delivery details first!'),
                      }
                  }

                //  printToast(context, 'Select Delivery details first!'),
                //   debugPrint('Select Delivery details first!'),
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget landScape() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 5,
                semanticContainer: true,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 20),
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          fIC.mImageName,
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        '${fIC.mPrice}',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        fIC.mName,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        fIC.mDescription,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        fIC.mSameDayOrder == false
                            ? 'Custom Day delivery available'
                            : 'Same Day Delivery',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: fIC.mSameDayOrder == false
                  ? Container(
                      decoration: BoxDecoration(color: Colors.grey[50]),
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 80,
                      child: SmartSelect.popup(
                        title: 'Pickup Day',
                        value: valueDays,
                        option: SmartSelectOption(days),
                        onChange: (val) => setState(() => {
                              valueDays = val,
                              daysSelected = true,
                              debugPrint(valueDays)
                            }),
                      ),
                    )
                  : Container()),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.infinity,
              height: 80,
              child: SmartSelect.popup(
                title: 'Pickup Time',
                value: valueTime,
                option: SmartSelectOption(time),
                onChange: (val) => setState(() => {
                      valueTime = val,
                      timeSelected = true,
                      debugPrint(valueTime)
                    }),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: RaisedButton(
              color: Colors.cyanAccent,
              child: Text('Place Order'),
              onPressed: () => {
                if (fIC.mSameDayOrder == false)
                  {
                    if (daysSelected == true && timeSelected == true)
                      {
                        showMyDialogWithTimeAndDay(
                            context, valueTime, valueDays),
                      }
                    else
                      {
                        printToast(context, 'Select Delivery details first!'),
                        debugPrint('Select Delivery details first!'),
                      }
                  }
                else if (fIC.mSameDayOrder == true)
                  {
                    if (timeSelected == true)
                      {
                        showMyDialogWithTimeAndDay(context, valueTime, ''),
                      }
                    else
                      {
                        printToast(context, 'Select Delivery details first!'),
                        debugPrint('Select Delivery details first!'),
                      }
                  }

                //  printToast(context, 'Select Delivery details first!'),
                //   debugPrint('Select Delivery details first!'),
              },
            ),
          ),
        ],
      ),
    );
  }
}

void printToast(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
    ),
  );
}

// foodItemClassData: foodItemClass[index]

Future<void> showMyDialogWithTimeAndDay(
    BuildContext context, String valueTime, String valueDays) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Place Order?'),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfirmationPage(valueTime, valueDays),
                ),
              ),
            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () => {Navigator.of(context).pop(true)},
          )
        ],
      );
    },
  );
}

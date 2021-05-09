import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_dabao/models/FoodItemsClass.dart';
import 'package:just_dabao/screens/CartPage.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderPageState();
  }
}

class OrderPageState extends State<OrderPage> {
  var foodItemClass = [
    new FoodItemClass(
        mPrice: 493,
        mName: 'Korma',
        mDescription: 'Yummy',
        mImageName: 'assets/images/one.png',
        mSameDayOrder: true),
    new FoodItemClass(
        mPrice: 493,
        mName: 'Patisa',
        mDescription: 'Indian Sweets ',
        mImageName: 'assets/images/two.png',
        mSameDayOrder: true),
    new FoodItemClass(
        mPrice: 493,
        mName: 'Dumplings',
        mDescription: 'Want Some?',
        mImageName: 'assets/images/three.png',
        mSameDayOrder: false),
    new FoodItemClass(
        mPrice: 493,
        mName: 'Protein',
        mDescription: 'Get Pumped',
        mImageName: 'assets/images/four.png',
        mSameDayOrder: false),
    new FoodItemClass(
        mPrice: 493,
        mName: 'Patiz',
        mDescription: 'Eat some hot patiz',
        mImageName: 'assets/images/five.png',
        mSameDayOrder: false),
    new FoodItemClass(
        mPrice: 493,
        mName: 'Ice Cream',
        mDescription: 'Icy cold desert',
        mImageName: 'assets/images/six.png',
        mSameDayOrder: false),
  ];

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
          Wrap(
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage('assets/images/just_dabao_background.png'),
                ),
              ),
            ],
          ),

          ////List of grids

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: foodItemClass.length,
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (1 / 1.16),
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(
                        foodItemClass[index],
                      ),
                    ),
                  ),
                },
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            width: 135,
                            image: AssetImage(foodItemClass[index].mImageName),
                          ),
                        ),
                        Container(
                          width: 140,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child:
                                    Text('Rs. ${foodItemClass[index].mPrice}'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(foodItemClass[index].mName),
                            ],
                          ),
                        ),
                        Text(foodItemClass[index].mDescription)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget landScape() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Wrap(
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage('assets/images/just_dabao_background.png'),
                ),
              ),
            ],
          ),

          ////List of grids

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: foodItemClass.length,
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (1.5 / 1),
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(
                        foodItemClass[index],
                      ),
                    ),
                  ),
                },
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            width: 140,
                            image: AssetImage(foodItemClass[index].mImageName),
                          ),
                        ),
                        Container(
                          width: 140,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child:
                                    Text('Rs. ${foodItemClass[index].mPrice}'),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(foodItemClass[index].mName),
                            ],
                          ),
                        ),
                        Text(foodItemClass[index].mDescription)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

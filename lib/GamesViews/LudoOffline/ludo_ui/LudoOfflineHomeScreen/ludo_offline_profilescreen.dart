import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/Helper/BuildText/BuildText.dart';
import '../../../../Controller/Utils/Colors/custom_color.dart';

class LudoOfflineProfileScreen extends StatelessWidget {
  const LudoOfflineProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 50),
        child: Container(
          decoration: BoxDecoration(color: Colors.pink),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    buildSizeBox(0.0, 20.0),
                    BuildText.buildText(
                        text: "Mama Ludo", size: 28, weight: FontWeight.w900),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notification_add,
                          color: AppColors.whiteColor,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
              top: 50.0,
              left: 0,
              bottom: 600,
              right: 0,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                padding: EdgeInsets.only(top: 50, left: 50, bottom: 100),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink,
                          border: Border.all(color: Colors.white)),
                      padding: EdgeInsets.all(12),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pink,
                            border: Border.all(color: Colors.white)),
                        padding: EdgeInsets.all(6),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Ludo',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '+91 99999999',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Center(
                child: Container(
                  height: 180,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Balance',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          '0.00',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                      endIndent: 5,
                      indent: 5,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          padding: EdgeInsets.all(15),
                          child: Center(
                            child: Icon(
                              Icons.wallet,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                          padding: EdgeInsets.all(15),
                          child: Center(
                            child: Icon(
                              Icons.home,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue),
                          padding: EdgeInsets.all(15),
                          child: Center(
                            child: Icon(
                              Icons.badge,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: 8,
                          ),
                          child: Center(child: Text('0.00')),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 8,
                          ),
                          child: Center(child: Text('0.00')),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 8,
                          ),
                          child: Center(child: Text('0.00')),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: 8,
                          ),
                          child: Center(
                              child: Text(
                            'Deposit Cash',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 8,
                          ),
                          child: Center(
                              child: Text(
                            'Withdraw Cash',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 8,
                          ),
                          child: Center(
                              child: Text(
                            'Bonus Cash',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 700,
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: Icon(
                        Icons.badge,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: Icon(
                        Icons.badge,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: Icon(
                        Icons.badge,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

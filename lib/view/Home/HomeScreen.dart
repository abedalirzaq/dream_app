import 'package:dream_app/Controller/HomeController/HomeController.dart';
import 'package:dream_app/Widget/AppBarHomePage.dart';
import 'package:dream_app/Widget/inputTextFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (c) {
          return SafeArea(
            bottom: true,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  AppBarHomePage(),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: SingleChildScrollView(
                          reverse: true,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: 20,),
                              for(int i = 0 ; i < c.messages.length;i++)
                                MessageWidget(
                                  message: c.messages[i].message,
                                  isSystem: c.messages[i].isSystem,
                                ),
                              SizedBox(height: 15,)
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      InputTextField(),
                      SizedBox(height: 15,)
                    ],
                  ),

                ],
              ),
            ),
          );
        }
      ),
    );
  }
}


class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.message, required this.isSystem});
  final String message;
  final bool isSystem;

  @override
  Widget build(BuildContext context) {
    return isSystem ? Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Container(
                width:40,
                height: 40,
                child: Image.asset("assets/images/robot.gif"),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            width: Get.width * 0.75,
            child: Text(message),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // لون الظل
                  spreadRadius: 2,  // مدى انتشار الظل
                  blurRadius: 8,    // مدى نعومة الظل
                  offset: Offset(0, 0), // موقع الظل (يمين/يسار, أعلى/أسفل)
                ),
              ],
            ),),
        ],
      ),
    ) : Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Get.width * 0.7, // أقصى عرض 70% من الشاشة
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    )
    ;
  }
}


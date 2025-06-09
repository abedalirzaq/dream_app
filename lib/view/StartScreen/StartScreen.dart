import 'package:dream_app/Controller/HomeController/HomeController.dart';
import 'package:dream_app/view/Home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  width: Get.width * 0.6,
                  child: Image.asset("assets/images/robot.gif")),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Get.to(HomeScreen());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(40)
                ),
                child: Row(
                  children: [
                    Icon(Icons.rocket_launch_outlined,size: 40,color: Colors.grey,),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("تفسير الأحلام",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),),
                          Text("هل تريد تفسير حلمك الخاص الآن حسب تفسير ابن سيرين ؟",style: TextStyle(
                              fontSize: 14,
                            color: Colors.grey
                          ),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(40)
              ),
              child: Row(
                children: [
                  Icon(Icons.history,size: 40,color: Colors.grey,),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("سجل الأحلام",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                        Text("يمكنك الرجوع الى الأحلام التي قمت بتفسيرها سابقا ومراجعتها او حذفها",style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey
                        ),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

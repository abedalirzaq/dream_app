import 'package:flutter/material.dart';

class AppBarHomePage extends StatelessWidget {
  const AppBarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 3,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Row(
            children: [
              SizedBox(width: 10,),
              InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new)),
              Image.asset("assets/images/robot.gif",width: 60,),
              Text("تفسير إبن سيرين",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17
              ),),
            ],
          ),
            Container(
              padding: EdgeInsets.all(7),
              margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(1000),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Icon(Icons.delete,color: Colors.redAccent,),
            )
        ],),
        SizedBox(height: 3,)
      ],
    );
  }
}

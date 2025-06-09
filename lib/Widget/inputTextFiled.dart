import 'package:dream_app/Controller/HomeController/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    super.key,
  });



  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding:EdgeInsets.only(left: 6,right: 6,top: 10,bottom: 5),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigo.withOpacity(_isFocused ? 0.7 : 0.3), // لون الظل
                          blurRadius: 5, // قوة التمويه
                          offset: const Offset(0, 0), // اتجاه الظل للأسفل
                        ),
                      ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: Column(
                    children: [
                      TextField(

                        focusNode: _focusNode,
                        controller: controller.messageController,
                        maxLength: 400,
                        decoration: const InputDecoration(
                          labelText: 'اكتب الحلم',
                          border: InputBorder.none, // إزالة الإطار
                          counterText: '',
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        ),
                        maxLines: 4,
                        minLines: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: 5,),
                          Container(
                            decoration: BoxDecoration(
                              color: _isFocused ? Colors.blueAccent : Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: controller.isLoading
                                  ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                                  :  Icon(Icons.rocket_launch_outlined, color: _isFocused ? Colors.white : Colors.grey),
                              onPressed: controller.isLoading
                                  ? null
                                  : controller.sendMessage,
                            ),
                          ),
                          SizedBox(width: 8,)
                        ],
                      ),
                      SizedBox(height: 6,)
                    ],
                  ),
                ),
              ),

            ],
          ),
        );
      }
    );
  }
}

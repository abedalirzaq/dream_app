import 'dart:async';
import 'dart:convert';
import 'package:dream_app/Model/MessageModel/MessageModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final messageController = TextEditingController();

  final response = ''.obs;
  bool isLoading = false;
  List<ChatMessageModel> messages = [
    ChatMessageModel(message: """🌙 مرحبًا بك!
أنا مفسّر الأحلام الذكي، مدعوم بالذكاء الاصطناعي، أمتلك القدرة على مساعدتك في تفسير أحلامك بناءً على مصادر موثوقة مثل تفسير ابن سيرين.
📝 فقط شاركني حلمك بالتفصيل وسأقوم بتحليله لك بدقة ووضوح.

هل ترغب ببدء التفسير الآن؟ 💭✨""", isSystem: true),

  ];
  StreamSubscription? _streamSub;

  final String apiKey = 'sk-af7fe5ea06634f5da4386f0db819a53f'; // ضع مفتاح DeepSeek هنا

  void sendMessage() async {
    final text = messageController.text.trim();
    messages.add(ChatMessageModel(message: text, isSystem: false));
    messageController.text = "";
    update();

    if (text.isEmpty || text.length > 400) {
      Get.snackbar('خطأ', 'الرسالة فارغة أو تجاوزت 400 حرف');
      return;
    }

    isLoading = true;
    messages.add(ChatMessageModel(message: "", isSystem: true));
    _streamSub?.cancel();

    final url = Uri.parse('https://api.deepseek.com/v1/chat/completions');

    final request = http.Request('POST', url)
      ..headers.addAll({
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      })
      ..body = jsonEncode({
        "model": "deepseek-chat",
        "messages": [
          {
            "role": "user",
            "content": text},
          {
            "role": "system",
            "content": "فسر الأحلام فقط وفق ابن سيرين باختصار لا يتجاوز 350 حرفًا بنص متكامل دون تعداد نقطي، واعتذر عن أي سؤال خارج تفسير الأحلام."
          }


        ],
        "stream": true
      });

    final streamedResponse = await request.send();

    if (streamedResponse.statusCode == 200) {
      _streamSub = streamedResponse.stream
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .listen((line) {
        if (line.startsWith('data:')) {
          final data = line.substring(5).trim();
          if (data == '[DONE]') {
            isLoading = false;
            return;
          }
          try {
            final jsonData = jsonDecode(data);
            final content = jsonData['choices'][0]['delta']['content'];
            if (content != null) {
              messages.last.message += content;
              update();
            }
          } catch (e) {
            print("خطأ في فك JSON: $e");
          }
        }
      }, onDone: () {
        isLoading = false;
      }, onError: (err) {
            print("error 2");
        isLoading = false;
        Get.snackbar('خطأ', 'فشل في الاتصال');
      });
    } else {
      print("error1");
      print(streamedResponse.statusCode);
      isLoading = false;
      Get.snackbar('خطأ', 'فشل الاتصال: ${streamedResponse.statusCode}');
    }
  }


  @override
  void onClose() {
    _streamSub?.cancel();
    messageController.dispose();
    super.onClose();
  }
}

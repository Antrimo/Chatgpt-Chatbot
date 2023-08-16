import 'package:chatbot/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:chatbot/widgets/widgets_chat.dart';


void main() {
  runApp(Chatgpt());
}

class Chatgpt extends StatelessWidget {
  const Chatgpt({super.key});
  final istyping = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Image.asset('images/gpt.png'),
          ),
          titleSpacing: 0.0,
          title: Text(
            "C h a t G P T",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey.shade700,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert_rounded),
              color: Colors.white,
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ChatWidget(
                      msg: chatMessages[index]["msg"].toString(),
                      chatIndex: int.parse(chatMessages[index]["chatIndex"].toString()),
                    );
                  },
                ),
              ),
              if (istyping) ...[
                SpinKitThreeBounce(
                  color: Colors.white,
                  size: 20.0,
                ),
                SizedBox(height: 3.0),
                Material(
                  color: Colors.grey.shade700,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            onSubmitted: (value) {
                              //send message
                            },
                            decoration: InputDecoration(
                              hintText: " How can I help you?",
                              hintStyle: TextStyle(
                                  color: Colors.white, fontSize: 17.0),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        backgroundColor: Colors.grey.shade900,
      ),
    );
  }
}

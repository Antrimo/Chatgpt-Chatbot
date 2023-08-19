import 'package:chatbot/services/rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:chatbot/widgets/widgets_chat.dart';
import 'package:chatbot/services/api.dart'; // Corrected import
import 'package:chatbot/constant/constant.dart'; // Corrected import

void main() {
  runApp(Chatgpt());
}

class Chatgpt extends StatefulWidget { // Changed to StatefulWidget
  @override
  _ChatgptState createState() => _ChatgptState();
}

class _ChatgptState extends State<Chatgpt> {
  bool istyping = true; // Moved from being final
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

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
            "ChatGPT",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.grey.shade700,
          actions: [
            IconButton(
              onPressed: () async {
              await Services.showModalSheet(context: context);
            },
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
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    return ChatWidget(
                      msg: chatMessages[index]["msg"].toString(),
                      chatIndex: int.parse(
                          chatMessages[index]["chatIndex"].toString()),
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
                            controller: textEditingController,
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
                          onPressed: () async {
                            try {
                              await ApiService.getModels();
                            } catch (error) {
                              print('Error');
                            }
                          },
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

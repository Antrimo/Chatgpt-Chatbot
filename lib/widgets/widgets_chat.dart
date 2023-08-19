import 'package:chatbot/assetmanger.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ?Colors.grey.shade900 : Colors.grey.shade800,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [             
                Image.asset(
                  chatIndex == 0 ? AssetsManager.userImage : AssetsManager.botImage,                  
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    msg,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                chatIndex == 0 ? SizedBox.shrink() : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.thumb_up_alt_outlined,
                    color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.thumb_down_alt_outlined,
                    color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

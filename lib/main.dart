import 'package:flutter/material.dart';

void main() {
  runApp(const Chatgpt());
}

class Chatgpt extends StatelessWidget {
  const Chatgpt({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset('images/gpt.png',scale: 7.0,),
              Center(
                child: Text(
                  '   C H A T G P T',
                  style: TextStyle(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.grey.shade700,
        ),
        backgroundColor: Colors.grey.shade500,    
      ),
    );
  }
}

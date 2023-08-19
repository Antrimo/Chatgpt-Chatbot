import 'package:flutter/material.dart';
import 'package:chatbot/widgets/drop.dart';


class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.grey.shade700,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: Text(
                    "Chosen Model:",
        
                  ),
                ),
                Flexible(flex: 2, child: ModelsDrowDownWidget()),
              ],
            ),
          );
        });
  }
}
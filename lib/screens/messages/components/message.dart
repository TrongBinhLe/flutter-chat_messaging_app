import 'package:chat/models/ChatMessage.dart';

import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'audio_message.dart';
import 'text_messager_dart.dart';

class Message extends StatelessWidget {
  const Message({Key key, @required this.message}) : super(key: key);
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage chatMess) {
      switch (chatMess.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
          break;
        case ChatMessageType.audio:
          return AudioMessage(
            message: message,
          );
          break;
        default:
          return SizedBox(
            width: kDefaultPadding / 2,
          );
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (message.isSender) ...[
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage("assets/images/user_2.png"),
            ),
            SizedBox(
              width: kDefaultPadding / 2,
            )
          ],
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 0.75,
                vertical: kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(message.isSender ? 1 : 0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: messageContaint(message),
          )
        ],
      ),
    );
  }
}

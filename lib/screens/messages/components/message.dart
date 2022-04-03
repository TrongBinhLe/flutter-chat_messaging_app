import 'package:chat/models/ChatMessage.dart';
import 'package:chat/screens/messages/components/video_message.dart';

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
        case ChatMessageType.video:
          return VideoMessage(
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
          ),
          if (message.isSender)
            StatusMessageDot(
              status: message.messageStatus,
            )
        ],
      ),
    );
  }
}

class StatusMessageDot extends StatelessWidget {
  final MessageStatus status;

  const StatusMessageDot({Key key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return kErrorColor;
          break;
        case MessageStatus.viewed:
          return kPrimaryColor;
          break;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1.color.withOpacity(0.01);
          break;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      height: 12,
      width: 12,
      decoration:
          BoxDecoration(color: dotColor(status), shape: BoxShape.circle),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}

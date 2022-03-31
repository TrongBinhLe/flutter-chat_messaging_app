import 'package:chat/constants.dart';
import 'package:chat/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import 'chat_input_field.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) => Message(
                message: demeChatMessages[index],
              ),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}

class Message extends StatelessWidget {
  const Message({Key key, @required this.message}) : super(key: key);
  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 0.75,
                vertical: kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(message.isSender ? 1 : 0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextMessage(message: message),
          )
        ]);
  }
}

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key key,
    @required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message.text,
      style: TextStyle(
        color: message.isSender
            ? Colors.white
            : Theme.of(context).textTheme.bodyText1.color,
      ),
    );
  }
}

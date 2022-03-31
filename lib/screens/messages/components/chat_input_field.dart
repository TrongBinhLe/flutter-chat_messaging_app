import 'package:flutter/material.dart';

import '../../../constants.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 0.2), blurRadius: 25)
        ],
      ),
      child: SafeArea(
          child: Row(
        children: [
          Icon(
            Icons.mic,
            color: kPrimaryColor,
          ),
          SizedBox(
            width: kDefaultPadding,
          ),
          Expanded(
              child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.sentiment_satisfied_outlined,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(0.64),
                ),
                SizedBox(
                  width: kDefaultPadding / 4,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Type message", border: InputBorder.none),
                  ),
                ),
                Icon(
                  Icons.attach_file,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(0.64),
                ),
                SizedBox(
                  width: kDefaultPadding / 1,
                ),
                Icon(
                  Icons.mic_none_outlined,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(0.64),
                ),
                SizedBox(
                  width: kDefaultPadding / 2,
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}

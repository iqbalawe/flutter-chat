import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String userName;
  final bool isUser;

  const MessageBubble(
    this.message,
    this.userName,
    this.isUser, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isUser ? Theme.of(context).primaryColor : Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
              bottomLeft: !isUser ? Radius.circular(0) : Radius.circular(12.0),
              bottomRight: isUser ? Radius.circular(0) : Radius.circular(12.0),
            ),
          ),
          width: MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 8.0,
          ),
          child: Column(
            crossAxisAlignment:
                isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isUser ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                message,
                style: TextStyle(
                  color: isUser
                      ? Theme.of(context).primaryTextTheme.headline1!.color
                      : Colors.black,
                ),
                textAlign: isUser ? TextAlign.end : TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

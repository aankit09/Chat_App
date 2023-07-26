import 'package:chat_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: mq.width * .03, vertical: mq.width * .01),
      elevation: .5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          // Image
          leading: CircleAvatar(
            child: Icon(CupertinoIcons.person),
          ),
          //Name
          title: Text('Jack Crowly'),
          // Message Title
          subtitle: Text(
            'Hey, How are you?',
            maxLines: 1,
          ),
          //Timing
          trailing: Text(
            '12:00 AM',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}

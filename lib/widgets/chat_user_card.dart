import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/models/chat_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;
  const ChatUserCard({super.key, required this.user});

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
          // leading: CircleAvatar(
          //   child: Icon(CupertinoIcons.person),
          // ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(mq.height * .3),
            child: CachedNetworkImage(
              width: mq.width * .055,
              height: mq.height * .055,
              imageUrl: widget.user.image,
              //    placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => CircleAvatar(
                child: Icon(CupertinoIcons.person),
              ),
            ),
          ),
          //Name
          title: Text(widget.user.name),
          // Message Title
          subtitle: Text(
            widget.user.message,
            maxLines: 1,
          ),
          // //Timing
          // trailing: Text(
          //   '12:00 AM',
          //   style: TextStyle(color: Colors.black54),
          // ),

          trailing: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatly/models/chat_user.dart';
import 'package:chatly/pages/chat.dart';
import 'package:flutter/material.dart';

class ChateeListTile extends StatefulWidget {
  final ChatUser user;
  final Function()? onTap;
  const ChateeListTile({super.key, required this.user, this.onTap});

  @override
  State<ChateeListTile> createState() => _ChateeListTileState();
}

class _ChateeListTileState extends State<ChateeListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                user: widget.user,
              ),
            ));
      },
      child: Ink(
        width: double.infinity,
        height: 75,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CachedNetworkImage(
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  imageUrl: widget.user.image,
                  errorWidget: (context, url, error) {
                    return CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.grey.shade600,
                      ),
                    );
                  }),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 240),
                  child: Text(
                    widget.user.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 240),
                  child: Text(
                    widget.user.bio,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/plus_messenger/chat_model.dart';

class TelegramChatPage extends StatelessWidget {
  Size _size;
  Chat chat;
  TelegramChatPage(this.chat);

  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _setAppBar(),
      body: _getBody(),
    );
  }

  _getBody() => Column(
        children: [
          _showChat(),
          _sendMessage(),
        ],
      );

  _showChat() => Expanded(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/background.jpeg"))),
        ),
      );

  SizedBox _sendMessage() => SizedBox(
        // height: _size.height * 0.07,
        child: TextField(
          // maxLines: 10,
          controller: _messageController,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: "Message",
            prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.emoji_emotions_outlined),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                String message = _messageController.text.trim();
                if (message.isEmpty) return;
                _messageController.clear();
              },
              icon: Icon(Icons.send_rounded),
            ),
          ),
        ),
      );

  _setAppBar() => AppBar(
        backgroundColor: Colors.teal,
        title: ListTile(
          title: _setText(chat.name),
          subtitle: _setText("last seen at " + chat.date),
          leading: CircleAvatar(
            foregroundImage: NetworkImage(chat.imageUrl),
            child: _setText(chat.name[0]),
          ),
        ),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              _setPopUpMenuItem(Icons.phone_outlined, "Call"),
              _setPopUpMenuItem(Icons.video_camera_back_outlined, "Video Call"),
              _setPopUpMenuItem(Icons.star_border, "Add to Favourites"),
              _setPopUpMenuItem(
                  Icons.cleaning_services_rounded, "Clear history"),
              _setPopUpMenuItem(
                  Icons.volume_mute_outlined, "Mute notifications"),
              _setPopUpMenuItem(Icons.delete_outline_outlined, "Delete chat"),
              _setPopUpMenuItem(
                  Icons.keyboard_arrow_up_outlined, "Go to first message"),
            ];
          }),
        ],
      );

  PopupMenuItem _setPopUpMenuItem(IconData icon, String title) => PopupMenuItem(
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
        ),
      );

  Text _setText(String text) => Text(
        text,
        style: TextStyle(color: Colors.white),
      );
}

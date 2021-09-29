import 'package:flutter_ui/pages/messaging_app/models/chat_model.dart';

String imageUrl = "https://source.unsplash.com/random/";
List<ChatModel> _chatList = [
  ChatModel(
    "Darlene Steward",
    "Pis a look at the images",
    imageUrl + '1',
    "18.31",
  ),
  ChatModel(
    "Fullstack Designers",
    "That’s very nice place! you guys made a very good decision. Can’t wait to go on vacation!",
    imageUrl+ '2',
    "16.01",
  ),
  ChatModel(
    "Lee Williamson",
    "Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali. We will have a very big party after this corona ends! These are some images about our destination",
    imageUrl+ '4',
    "12.55",
  ),
  ChatModel(
    "Ronald McCoy",
    "Pis a look at the images",
    imageUrl+ '3',
    "06.12",
  ),
  ChatModel(
    "Albert Bell",
    "Pis a look at the images",
    imageUrl+ '5',
    "Yesterday",
  ),
  ChatModel(
    "Darlene Steward",
    "Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali. We will have a very big party after this corona ends! These are some images about our destination",
    imageUrl+ '6',
    "Yesterday",
  ),
  ChatModel(
    "Darlene Steward",
    "Pis a look at the images",
    imageUrl+ '7',
    "This week",
  ),

];

List<ChatModel> get chatList => _chatList;

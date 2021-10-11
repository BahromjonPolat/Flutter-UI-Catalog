import 'package:flutter_ui/pages/praying_time/models/video_model.dart';

List<VideoModel> _liveVideos = [
  VideoModel(
      "Jazo va mukofot kunining egasi",
      "Islom.uz",
      "https://i.ytimg.com/an_webp/Ugom1ye6Glk/mqdefault_6s.webp?du=3000&sqp=CK7pjosG&rs=AOn4CLCDoKaH_aOyajadelJxxslBGBxvnw",
      "Jonli"),
];

List<VideoModel> _videos = [
  VideoModel("Fotiha surasining yetti oyatdan iboratligi haqida", "Islom.uz",
      "https://i.ytimg.com/vi/xP8zYodYgAo/mqdefault.jpg", "1:15"),
  VideoModel(
      "Sayr qiling",
      "Quran.uz",
      "https://i.ytimg.com/vi/pZ-c0g_dvg4/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDZmP1NZwRepHmblSQYigsrfdYHZw",
      "15:25"),
  VideoModel("Qur'on ila hidoyat topdim", "Quran.uz",
      "https://i.ytimg.com/vi/F-Uh8zkX7FM/maxresdefault.jpg", "23:08"),
  VideoModel(
      "Yo'lovchi uyda | Yo'lovchi onlayn",
      "AzonTV",
      "https://i.ytimg.com/vi/j1FEElicRk0/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLARvIB6oiNN2OmmKzEV7aifQZXqSw",
      "1:02:01"),
  VideoModel("Iymonlashaylik", "AzonTV",
      "https://i.ytimg.com/vi/MIgDrZibPlg/maxresdefault.jpg", "15:07"),
];

List<VideoModel> get getLiveVideoList => _liveVideos;

List<VideoModel> get getVideoList => _videos;

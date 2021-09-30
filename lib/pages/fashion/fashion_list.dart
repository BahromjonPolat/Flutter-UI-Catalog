import 'package:flutter_ui/pages/fashion/fashion_model.dart';
import 'package:flutter_ui/pages/fashion/image_list.dart';

String _description =
    "This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temperament and is recommend to friends.";
List<String> _tags1 = ["#LouisVuitton", "#Chloe"];
List<String> _tags2 = ["#Versace", "#Chanel", "#Gucci"];

List<String> _imageList1 = [manInBrownJacket, manInIndigoJacket, manInJacket];
List<String> _imageList2 = [manInJeans, manInShirt, manWithBeard];
List<String> _imageList3 = [manWithSunGlasses, manInUniqueHairStyle, manInWhiteTShirt, manInJeans];

List<Fashion> fashionList = [
  Fashion("Micheal", _description, randomImage, _tags1, _imageList1),
  Fashion("Diesel", _description, randomImage, _tags2, _imageList2),
  Fashion("Peter", _description, randomImage, _tags1, _imageList3),
];

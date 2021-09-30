import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/fashion/fashion_model.dart';
import 'package:flutter_ui/pages/fashion/image_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FashionInfoPage extends StatefulWidget {
  Fashion fashion;

  FashionInfoPage(this.fashion);

  @override
  _FashionInfoPageState createState() => _FashionInfoPageState();
}

class _FashionInfoPageState extends State<FashionInfoPage> {
  Size _size;
  Color _black = Colors.black;
  Color _white = Colors.white;
  Color _brown = Colors.brown;
  Color _grey = Colors.grey;
  Color _blackWithOpacity = Color(0x90000000);

  int _currentIndex = 1;

  Fashion _fashion;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _fashion = widget.fashion;
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _getBody(),
    );
  }

  _getBody() => Stack(
        children: [
          _setPageView(),
          _getBackButton(),
          _showCurrentIndex(),
          _showFashionInfo(),
        ],
      );

  PageView _setPageView() => PageView.builder(
      controller: _pageController,
      itemCount: _fashion.images.length,
      onPageChanged: (i) {
        setState(() {
          _currentIndex = i + 1;
        });
      },
      itemBuilder: (context, index) {
        String imageUrl = _fashion.images[index];
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
          child: Stack(
            children: [
              _showPriceButton(120.0, _size.width * 0.7),
              _showProductName(),
              _showPriceButton(_size.height * 0.6, _size.width * 0.7),
            ],
          ),
        );
      });

  Positioned _getBackButton() => Positioned(
      top: 32,
      left: 16.0,
      child: IconButton(
        onPressed: _onBackPressed,
        icon: Icon(
          Icons.arrow_back_ios_outlined,
        ),
      ));

  Positioned _showFashionInfo() => Positioned(
        bottom: 21.0,
        left: 16.0,
        right: 16.0,
        child: Container(
          height: _size.height * 0.245,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: _white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: _showFullInfo(),
        ),
      );

  Column _showFullInfo() => Column(
        children: [
          Row(
            children: [
              _setImage(),
              SizedBox(
                height: _size.height * 0.12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _setText("Laminated", _black, 27.0, true),
                    _setText("Louis Vuitton", _grey, 14.0, true),
                    _setText(_fashion.description, _grey, 12.0, false),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.0,
            height: 32.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _setText("\$6500", _brown, 25.0, false),
              CircleAvatar(
                radius: 18.0,
                backgroundColor: _brown,
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 12.0,
                  color: _white,
                ),
              )
            ],
          ),
        ],
      );

  /// Rasmni ko`rsatish uchun funksiya
  Container _setImage() => Container(
        height: _size.height * 0.12,
        width: _size.height * 0.12,
        margin: EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(randomImage),
          ),
        ),
      );

  SizedBox _setText(String text, Color color, double size, bool isBold) =>
      SizedBox(
        width: _size.width * 0.51,
        child: Text(
          text,
          maxLines: 2,
          style: TextStyle(
              color: color,
              fontSize: size,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      );

  Positioned _showCurrentIndex() => Positioned(
        top: _size.height * 0.1,
        left: _size.width / 2,
        child: Text.rich(
          TextSpan(text: "$_currentIndex", children: [
            TextSpan(
              text: "/${_fashion.images.length}",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ]),
          style: TextStyle(
            color: _white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Positioned _showPriceButton(double top, double left) => Positioned(
        top: top,
        left: left,
        child: Container(
          padding: EdgeInsets.all(6.0),
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: _white,
            size: 24.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(color: _white, width: 0.5),
          ),
        ),
      );

  Positioned _showProductName() => Positioned(
      left: 24.0,
      top: _size.height / 2,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: _blackWithOpacity,
          borderRadius: BorderRadius.circular(4.0)
        ),
        child: Row(
          children: [
            Text("Laminated", style: TextStyle(color: _white, fontSize: 16.0), ),
            SizedBox(width: 12.0),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: _white,
              size: 16.0,
            )
          ],
        ),
      ));

  void _onBackPressed() {
    Navigator.pop(context);
  }
}

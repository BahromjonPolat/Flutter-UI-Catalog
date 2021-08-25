
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class InstagramSearchPage extends StatefulWidget {
  @override
  _InstagramSearchPageState createState() => _InstagramSearchPageState();
}

class _InstagramSearchPageState extends State<InstagramSearchPage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _staggeredGridView();
  }

  _staggeredGridView() => StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: 30,
      itemBuilder: (context, index) {
        if (index.isEven)
          return _a(index);
        else
          return _c(index);
      },
      staggeredTileBuilder: (index) {
        return StaggeredTile.count(1, index.isEven ? 2 : 1);
      });

  Container _a(i) => Container(
    margin: EdgeInsets.symmetric(horizontal: (i.isEven) ? 3.0 : 0.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                child: Image.network(
                  "https://source.unsplash.com/random/${i + 4}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 2.0),
                          child: Image.network(
                            "https://source.unsplash.com/random/${i + 7}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 2.0),
                          child: Image.network(
                            "https://source.unsplash.com/random/${i * 5}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      );

  Container _c(i) => Container(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
              4,
              (index) => Container(
                    margin: EdgeInsets.all(2.0),
                    child: Image.network(
                      "https://source.unsplash.com/random/${index * i +  1}",
                      fit: BoxFit.cover,
                    ),
                  )),
        ),
      );
}

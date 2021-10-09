import 'package:flutter/cupertino.dart';

Center _showIndicator() => Center(
  child: CupertinoActivityIndicator(radius: 42.0),
);

Center get showIndicator => _showIndicator();
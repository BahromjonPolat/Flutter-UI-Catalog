import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/students_mark/mark_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

class MarkListPage extends StatefulWidget {
  @override
  _MarkListPageState createState() => _MarkListPageState();
}

class _MarkListPageState extends State<MarkListPage> {
  Size _size;
  int _grade = 100;
  GlobalKey<FormFieldState> _subjectKey = GlobalKey<FormFieldState>();
  TextEditingController _subjectController = TextEditingController();
  List<Mark> _markList = [];

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  AppBar _getAppBar() => AppBar(
        title: Text("Student's mark"),
      );

  Container _getBody() => Container(
        child: ListView.builder(
            itemCount: _markList.length,
            itemBuilder: (context, index) {
              Mark mark = _markList[index];
              return Dismissible(
                key: Key(mark.id),
                child: _showMarkInfoLayout(mark),
                onDismissed: (direction) {
                  setState(() {
                    _markList.removeAt(index);
                  });
                },
              );
            }),
      );

  ListTile _showMarkInfoLayout(Mark mark) => ListTile(
        title: Text(mark.name),
        leading: CircleAvatar(
          child: Text("${mark.mark}"),
        ),
        trailing: Icon(Icons.arrow_back_ios_outlined),
      );

  void _onFloatingButtonPressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Baholash"),
        content: Container(
          height: _size.height * 0.2,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _getTextField(),
                _getDropButton(),
                _elevatedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField _getTextField() => TextField(
        key: _subjectKey,
        controller: _subjectController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 12.0,
            ),
            hintText: "Enter subject name",
            label: Text("Subject name"),
            border: OutlineInputBorder()),
      );

  ElevatedButton _elevatedButton() => ElevatedButton(
        onPressed: () {
          if (_subjectController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Please, Fill the field!");
            return;
          }
          if (_subjectController.text.length < 3) {
            Fluttertoast.showToast(msg: "Please, Enter minimum 3 letters!");
            return;
          }

          Uuid uuid = Uuid();
          _markList.add(
            Mark(
              uuid.v4(),
              _subjectController.text,
              _grade,
            ),
          );
          Fluttertoast.showToast(msg: "${_subjectController.text} was added!");
          _subjectController.clear();
          setState(() {});
        },
        child: Text("Add"),
        style: ElevatedButton.styleFrom(fixedSize: Size(_size.width, 32.0)),
      );

  Container _getDropButton() => Container(
        width: _size.width * 0.6,
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          value: _grade,
          items: [
            _setDropMenuItem(100),
            _setDropMenuItem(80),
            _setDropMenuItem(60),
            _setDropMenuItem(40),
            _setDropMenuItem(20),
            _setDropMenuItem(0),
          ],
          onChanged: (value) {
            _grade = value;
            setState(() {});
          },
        )),
      );

  DropdownMenuItem _setDropMenuItem(int grade) => DropdownMenuItem(
        value: grade,
        child: Text("$grade"),
        onTap: () {
          setState(
            () {
              _grade = grade;
            },
          );
        },
      );

  FloatingActionButton _getFloatingActionButton() => FloatingActionButton(
        onPressed: _onFloatingButtonPressed,
        child: Icon(Icons.add),
      );

  Container _getBottomNavigationBar() {
    int sum = 0;
    for (Mark mark in _markList) {
      sum += mark.mark;
    }
    double mean = sum / _markList.length;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 16.0),
              height: _size.height * 0.07,
              width: _size.width * 0.6,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.blue),
              child: Text(
                mean != null
                    ? "O`rtacha baho: ${mean.toStringAsFixed(2)}"
                    : "Hali baho yo`q",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
          ),
          _getFloatingActionButton(),
        ],
      ),
    );
  }
}

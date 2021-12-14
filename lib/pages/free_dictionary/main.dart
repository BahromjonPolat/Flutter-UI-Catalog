import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/free_dictionary/dictionary_model.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';

class FreeDictionary extends StatefulWidget {
  @override
  _FreeDictionaryState createState() => _FreeDictionaryState();
}

enum TtsState { playing, stopped, paused, continued }

class _FreeDictionaryState extends State<FreeDictionary> {
  TextEditingController _wordController = TextEditingController();
  AudioPlayer _player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _getAppBar() => AppBar(
        title: Text("Free Dictionary"),
      );

  _buildBody() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Column(
          children: [
            TextField(
              controller: _wordController,
              decoration: InputDecoration(
                  hintText: "Word",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: Icon(Icons.search),
                  ),
                  border: OutlineInputBorder()),
            ),
            FutureBuilder(
                future: _getWordFromApi(),
                builder: (context, AsyncSnapshot<List<Dictionary>> snap) {
                  return snap.hasData
                      ? Column(
                          children: [
                            Text(snap.data![0].meanings[0].toString()),
                            ElevatedButton(
                                onPressed: () async {
                                  await _player.play(
                                    "https:" + snap.data![0].phonetics[0].audio,
                                  );
                                },
                                child: Text("PLAY"))
                          ],
                        )
                      : Center(
                          child: CupertinoActivityIndicator(),
                        );
                }),
          ],
        ),
      );

  Future<List<Dictionary>> _getWordFromApi() async {
    String word = _wordController.text;
    Uri url =
        Uri.parse("https://api.dictionaryapi.dev/api/v2/entries/en/$word");

    var wordInfo = await http.get(url);
    return (jsonDecode(wordInfo.body) as List)
        .map((e) => Dictionary.fromJson(e))
        .toList();
  }
}

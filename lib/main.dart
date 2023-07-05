import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Rainbow(),
      ),
    ),
  );
}

class Rainbow extends StatelessWidget {
  const Rainbow({super.key});

  void playSound(int soundNum) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNum.wav'));
  }

  Expanded buildKey({required Color color, required int keyNum}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
        ),
        onPressed: () {
          playSound(keyNum);
        },
        child: Text(
          '$keyNum',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(color: Colors.red, keyNum: 1),
          buildKey(color: Colors.grey, keyNum: 2),
          buildKey(color: Colors.purple, keyNum: 3),
          buildKey(color: Colors.orange, keyNum: 4),
          buildKey(color: Colors.green, keyNum: 5),
          buildKey(color: Colors.blue, keyNum: 6),
          buildKey(color: Colors.teal, keyNum: 7),
        ],
      ),
    );
  }
}

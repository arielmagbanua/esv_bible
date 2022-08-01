import 'dart:io';

import 'package:esv_bible/src/domain/entities/passage_audio.dart';
import 'package:test/test.dart';

void main () {
  test('Should be able to instantiate with audio file', () async {
    // use the current directory if temp directory does not exists
    final audioPath = Platform.isWindows
        ? Directory.current.path + r'\test\passageAudio.mp3'
        : Directory.current.path + '/test/passageAudio.mp3';

    final audioFile = File(audioPath);
    final passageAudio = PassageAudio(query: 'John 3:16', audio: audioFile);
    expect(passageAudio.query, 'John 3:16');
    expect(audioFile, passageAudio.audio);
    expect(await passageAudio.audio.exists(), true);
  });
}
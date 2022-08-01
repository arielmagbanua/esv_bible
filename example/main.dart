import 'package:esv_bible/esv_bible.dart';

void main() async {
  const apiKey = 'your-api-key';

  final passage = Passage(apiKey);

  // PassageText
  final passageText = await passage.text('John 3:16');
  print(passageText.passages[0]);

  // PassageAudio
  final passageAudio = await passage.audio('John 3:16');
  print(passageAudio.query);
  print(passageAudio.audio.path);
}

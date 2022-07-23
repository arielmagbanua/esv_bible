import 'package:esv_bible/esv_bible.dart';

void main () async {
  const apiKey = 'your-api-key';

  final passage = GetPassage.text(apiKey);
  final passageText = await passage('John 3:16');
  print(passageText.passages[0]);
}

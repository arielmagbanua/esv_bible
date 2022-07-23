import 'package:esv_bible/esv_bible.dart';

void main () async {
  const apiKey = 'adf6689e8a9a0ad80364ed1a1cb2f30a682f46fd';

  final passage = GetPassage.text(apiKey);
  final passageText = await passage('John 3:16');
  print(passageText.passages[0]);
}

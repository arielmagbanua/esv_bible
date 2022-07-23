import 'dart:convert';
import 'package:test/test.dart';
import 'package:esv_bible/data/models/passage_text.dart' as models;

import '../../test_data.dart' show samplePassageText;

void main() {
  // convert sample data to map
  final samplePassageTextMap = json.decode(samplePassageText);

  test('Should be able to instantiate PassageText model', () {
    final parsed =
        List<List<dynamic>?>.from(samplePassageTextMap['parsed']).toList();
    final passageMeta =
        List<Map<String, dynamic>?>.from(samplePassageTextMap['passage_meta'])
            .toList();
    final passages =
        List<String>.from(samplePassageTextMap['passages']).toList();

    final passageText = models.PassageText(
      query: samplePassageTextMap['query'],
      canonical: samplePassageTextMap['canonical'],
      parsed: parsed,
      passageMeta: passageMeta,
      passages: passages,
    );

    expect(passageText.query, 'John 11:35');
    expect(passageText.canonical, 'John 11:35');
    expect(passageText.passages, isNotEmpty);
    expect(passageText.passages[0], 'John 11:35\n\n  [35] Jesus wept. (ESV)');
  });

  test('Should be able to instantiate PassageText model via factory', () {
    final passageText = models.PassageText.fromJson(samplePassageTextMap);

    expect(passageText.query, 'John 11:35');
    expect(passageText.canonical, 'John 11:35');
    expect(passageText.passages, isNotEmpty);
    expect(passageText.passages[0], 'John 11:35\n\n  [35] Jesus wept. (ESV)');
  });
}

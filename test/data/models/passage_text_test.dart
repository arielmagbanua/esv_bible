import 'dart:convert';
import 'package:test/test.dart';
import 'package:esv_bible/data/models/passage_text.dart' as models;

import '../../test_data.dart' show samplePassageText;

void main() {
  // convert sample data to map
  final samplePassageTextMap =
      json.decode(samplePassageText) as Map<String, dynamic>;

  test('Should be able to instantiate PassageText model', () {
    final jsonParsed = (samplePassageTextMap['parsed'] as List<dynamic>)
        .map((item) => item as List<dynamic>?)
        .toList();

    final jsonPassageMeta =
        (samplePassageTextMap['passage_meta'] as List<dynamic>)
            .map((item) => item as Map<String, dynamic>?)
            .toList();

    final jsonMessages = (samplePassageTextMap['passages'] as List<dynamic>)
        .map((item) => item as String?)
        .toList();

    final parsed = List<List<dynamic>?>.from(
      jsonParsed,
    ).toList();
    final passageMeta = List<Map<String, dynamic>?>.from(
      jsonPassageMeta,
    ).toList();
    final passages = List<String>.from(
      jsonMessages,
    ).toList();

    final passageText = models.PassageText(
      query: samplePassageTextMap['query'].toString(),
      canonical: samplePassageTextMap['canonical'].toString(),
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

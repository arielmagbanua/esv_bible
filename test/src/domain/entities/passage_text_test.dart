import 'dart:convert';
import 'package:esv_bible/src/domain/entities/passage_text.dart';
import 'package:test/test.dart';

import '../../../test_data.dart' show samplePassageText;

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

    final passageText = PassageText(
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

  test(
      'Should be able to instantiate PassageText model via factory and conversion to json',
      () {
    final passageText = PassageText.fromJson(samplePassageTextMap);

    final jsonPassageText = passageText.toJson();

    expect(passageText.query, 'John 11:35');
    expect(jsonPassageText['query'], 'John 11:35');
    expect(passageText.canonical, 'John 11:35');
    expect(jsonPassageText['canonical'], 'John 11:35');
    expect(passageText.passages, isNotEmpty);
    expect(jsonPassageText['passages'], isNotEmpty);
    expect(passageText.passages[0], 'John 11:35\n\n  [35] Jesus wept. (ESV)');
    expect(jsonPassageText['passages'][0], 'John 11:35\n\n  [35] Jesus wept. (ESV)');
  });
}

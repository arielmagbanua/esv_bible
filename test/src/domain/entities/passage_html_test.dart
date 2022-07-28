import 'dart:convert';
import 'package:test/test.dart';
import 'package:esv_bible/src/data/models/passage_html.dart' as models;

import '../../../test_data.dart' show samplePassageHTML;

void main() {
  // convert sample data to map
  final samplePassageHTMLMap =
      json.decode(samplePassageHTML) as Map<String, dynamic>;

  test('Should be able to instantiate PassageHtml model', () {
    final jsonParsed = (samplePassageHTMLMap['parsed'] as List<dynamic>)
        .map((item) => item as List<dynamic>?)
        .toList();

    final jsonPassageMeta =
        (samplePassageHTMLMap['passage_meta'] as List<dynamic>)
            .map((item) => item as Map<String, dynamic>?)
            .toList();

    final jsonMessages = (samplePassageHTMLMap['passages'] as List<dynamic>)
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

    final passageHtml = models.PassageHtml(
      query: samplePassageHTMLMap['query'].toString(),
      canonical: samplePassageHTMLMap['canonical'].toString(),
      parsed: parsed,
      passageMeta: passageMeta,
      passages: passages,
    );

    expect(passageHtml.query, 'John 11:35');
    expect(passageHtml.canonical, 'John 11:35');
    expect(passageHtml.passages, isNotEmpty);
    expect(
      passageHtml.passages[0],
      '<h2 class="extra_text">John 11:35 <small class="audio extra_text">(<a class="mp3link" href="https://audio.esv.org/hw/43011035-43011035.mp3" title="John 11:35" type="audio/mpeg">Listen</a>)</small></h2>\n<p id="p43011035_01-1" class="virtual"><b class="verse-num" id="v43011035-1">35 </b>Jesus wept.</p>\n<p>(<a href="http://www.esv.org" class="copyright">ESV</a>)</p>',
    );
  });

  test('Should be able to instantiate PassageText model via factory', () {
    final passageHtml = models.PassageHtml.fromJson(samplePassageHTMLMap);

    expect(passageHtml.query, 'John 11:35');
    expect(passageHtml.canonical, 'John 11:35');
    expect(passageHtml.passages, isNotEmpty);
    expect(
      passageHtml.passages[0],
      '<h2 class="extra_text">John 11:35 <small class="audio extra_text">(<a class="mp3link" href="https://audio.esv.org/hw/43011035-43011035.mp3" title="John 11:35" type="audio/mpeg">Listen</a>)</small></h2>\n<p id="p43011035_01-1" class="virtual"><b class="verse-num" id="v43011035-1">35 </b>Jesus wept.</p>\n<p>(<a href="http://www.esv.org" class="copyright">ESV</a>)</p>',
    );
  });
}

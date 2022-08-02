# ESV API Bible for Dart

![Dart CI](https://github.com/arielmagbanua/esv_bible/actions/workflows/ci.yml/badge.svg)

A future based dart package for the [ESV API](https://api.esv.org/) from [Crossway](https://www.crossway.org/)
which can be used to fetch ESV bible passages.

This package requires an API key to fetch bible passages. You can secure an API key by creating a new application on the [ESV API website](https://api.esv.org/).

## Features
* Get [passage text](https://api.esv.org/docs/passage-text/) from ESV Bible API.
* Get [passage html](https://api.esv.org/docs/passage-html/) from ESV Bible API.
* [Search a passage](https://api.esv.org/docs/passage-search/) from ESV Bible API.
* [Download a mp3 audio](https://api.esv.org/docs/passage-audio/) of a bible passage.

## Getting started

* Secure your API key at the [ESV API website](https://api.esv.org/).
* Import the package.
* To fetch a passage, create an instance of the Passage class and provide the ESV API key in the constructor.
* Call the `text` method to retrieve the `PassageText` object, call the`html` method to retrieve the `PassageHtml` object,
call the `search` method to retrieve the `PassageSearch` object, and call the `audio` method to retrieve the `PassageAudio` object.

## Usage

Basic passage text query:
```dart
import 'package:esv_bible/esv_bible.dart';

void main () async {
  const apiKey = 'your-api-key';

  final passage = Passage(apiKey);

  // PassageText
  final passageText = await passage.text('John 3:16');
  print(passageText.passages[0]);
}
```

Output:
```
John 3:16

For God So Loved the World

  [16] “For God so loved the world,(1) that he gave his only Son, that whoever believes in him should not perish but have eternal life.

Footnotes

(1) 3:16 Or *For this is how God loved the world*
 (ESV)
```

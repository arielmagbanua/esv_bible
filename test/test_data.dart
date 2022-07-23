const samplePassageHTML = r'''
{
  "query": "John 11:35",
  "canonical": "John 11:35",
  "parsed": [
    [
      43011035,
      43011035
    ]
  ],
  "passage_meta": [
    {
      "canonical": "John 11:35",
      "chapter_start": [
        43011001,
        43011057
      ],
      "chapter_end": [
        43011001,
        43011057
      ],
      "prev_verse": 43011034,
      "next_verse": 43011036,
      "prev_chapter": [
        43010001,
        43010042
      ],
      "next_chapter": [
        43012001,
        43012050
      ]
    }
  ],
  "passages": [
    "<h2 class=\"extra_text\">John 11:35 <small class=\"audio extra_text\">(<a class=\"mp3link\" href=\"https://audio.esv.org/hw/43011035-43011035.mp3\" title=\"John 11:35\" type=\"audio/mpeg\">Listen</a>)</small></h2>\n<p id=\"p43011035_01-1\" class=\"virtual\"><b class=\"verse-num\" id=\"v43011035-1\">35 </b>Jesus wept.</p>\n<p>(<a href=\"http://www.esv.org\" class=\"copyright\">ESV</a>)</p>"
  ]
}
''';

const samplePassageSearch = r'''
{
    "page": 1,
    "total_results": 3,
    "results": [
        {
            "reference": "Numbers 11:4",
            "content": "Now the rabble that was among them had a strong craving. And the people of Israel also wept again and said, \u201cOh that we had meat to eat!"
        },
        {
            "reference": "Job 30:12",
            "content": "On my right hand the rabble rise; they push away my feet; they cast up against me their ways of destruction."
        },
        {
            "reference": "Acts 17:5",
            "content": "But the Jews were jealous, and taking some wicked men of the rabble, they formed a mob, set the city in an uproar, and attacked the house of Jason, seeking to bring them out to the crowd."
        }
    ],
    "total_pages": 1
}
''';

const samplePassageText = r'''
{
  "query": "John 11:35",
  "canonical": "John 11:35",
  "parsed": [
    [
      43011035,
      43011035
    ]
  ],
  "passage_meta": [
    {
      "canonical": "John 11:35",
      "chapter_start": [
        43011001,
        43011057
      ],
      "chapter_end": [
        43011001,
        43011057
      ],
      "prev_verse": 43011034,
      "next_verse": 43011036,
      "prev_chapter": [
        43010001,
        43010042
      ],
      "next_chapter": [
        43012001,
        43012050
      ]
    }
  ],
  "passages": [
    "John 11:35\n\n  [35] Jesus wept. (ESV)"
  ]
}
''';

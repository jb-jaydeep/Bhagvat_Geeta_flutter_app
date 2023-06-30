String? popmenuvalue;

class JsonData {
  final int verses_count;
  final int id;
  final int chapter_number;
  final String name_meaning;
  final String Hindiname;
  final String image_name;
  final String chapter_summary_hindi;
  final String chapter_summary_gujarati;
  final String chapter_summary;
  final String GujName;
  final String EngName;

  JsonData({
    required this.verses_count,
    required this.id,
    required this.chapter_number,
    required this.name_meaning,
    required this.Hindiname,
    required this.image_name,
    required this.chapter_summary_hindi,
    required this.chapter_summary_gujarati,
    required this.chapter_summary,
    required this.GujName,
    required this.EngName,
  });
  factory JsonData.formMap({required Map Data}) {
    return JsonData(
      verses_count: Data['verses_count'],
      id: Data['id'],
      chapter_number: Data['chapter_number'],
      name_meaning: Data['name_meaning'],
      Hindiname: Data['Hindiname'],
      image_name: Data['image_name'],
      chapter_summary_hindi: Data['chapter_summary_hindi'],
      chapter_summary_gujarati: Data['chapter_summary_gujarati'],
      chapter_summary: Data['chapter_summary'],
      GujName: Data['GujName'],
      EngName: Data['EngName'],
    );
  }
}

class shlokData {
  final int chapter_id;
  final int id;
  final int chapter_number;
  final int externalId;
  final String text;
  final String title;
  final int verse_number;
  final int verse_order;
  final String transliteration;
  final String word_meanings;
  final String description;

  shlokData({
    required this.chapter_id,
    required this.id,
    required this.chapter_number,
    required this.externalId,
    required this.text,
    required this.title,
    required this.verse_number,
    required this.verse_order,
    required this.transliteration,
    required this.word_meanings,
    required this.description,
  });
  factory shlokData.formMap({required Map Data}) {
    return shlokData(
      chapter_id: Data['chapter_id'],
      id: Data['id'],
      chapter_number: Data['chapter_number'],
      externalId: Data['externalId'],
      text: Data['text'],
      title: Data['title'],
      verse_number: Data['verse_number'],
      verse_order: Data['verse_order'],
      transliteration: Data['transliteration'],
      word_meanings: Data['word_meanings'],
      description: Data['description'],
    );
  }
}

class GujaratishlokData {
  final int verseNumber;
  //final int chapter_number;
  final int language_id;
  final int id;
  final String lang;
  final String description;
  final String meaning;

  GujaratishlokData({
    required this.verseNumber,
    required this.meaning,
    //required this.chapter_number,
    required this.id,
    required this.language_id,
    required this.lang,
    required this.description,
  });
  factory GujaratishlokData.formMap({required Map Data}) {
    return GujaratishlokData(
      lang: Data['lang'],
      id: Data['id'],
      verseNumber: Data['verseNumber'],
      description: Data['description'],
      language_id: Data['language_id'],
      meaning: Data['meaning'],
      // chapter_number: Data['chapter_number'],
    );
  }
}

class EnglishshlokData {
  // "description": "dhṛitarāśhtra uvācha\ndharma-kṣhetre kuru-kṣhetre samavetā yuyutsavaḥ\nmāmakāḥ pāṇḍavāśhchaiva kimakurvata sañjaya\n",
  //     "lang": "english",
  //     "verseNumber": 1,
  //     "language_id": 1,
  //     "id": 1
  // "chapter_id": 1

  final int id;
  final int language_id;
  final int verseNumber;
  final String lang;

  // final String description;

  EnglishshlokData({
    required this.id,
    required this.lang,
    required this.verseNumber,
    required this.language_id,
  });
  factory EnglishshlokData.formMap({required Map Data}) {
    return EnglishshlokData(
      id: Data['id'],
      language_id: Data['language_id'],
      verseNumber: Data['verseNumber'],
      lang: Data['lang'],
    );
  }
}

List<shlokData> likedVerses = [];
List<shlokData> likeVerses = [];
List<GujaratishlokData>like = [];
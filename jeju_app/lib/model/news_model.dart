class NewsModel {
  late String title;
  late String description;
  late String originallink;

  NewsModel(
      {required this.title,
      required this.description,
      required this.originallink});

  NewsModel.fromMap(Map<String, dynamic>? map) {
    title = map?['title'] ?? '';
    description = map?['description'] ?? '';
    originallink = map?['originallink'] ?? '';
  }
}

class PhotoModel {
  int id;
  String url;
  String title;

  PhotoModel({required this.url, required this.title, required this.id});

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      PhotoModel(url: json["url"], title: json["title"], id: json["id"]);

  PhotoModel copyWith({int? id, String? url, String? title}) {
    return PhotoModel(
        url: url ?? this.url, title: title ?? this.title, id: id ?? this.id);
  }
}

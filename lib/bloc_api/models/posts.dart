class PostsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  PostsModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  @override
  String toString() {
    return 'PostsModel{userId: $userId, id: $id, title: $title, body: $body}';
  }
}

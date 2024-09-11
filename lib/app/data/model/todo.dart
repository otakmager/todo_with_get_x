class ToDoData {
  int code;
  String message;
  List<ToDo?> items;

  ToDoData({
    required this.code,
    required this.message,
    required this.items,
  });

  ToDoData.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int? ?? -999,
        message = json['message'] ?? 'Uknown error',
        items = (json['items'] as List<dynamic>?)
                ?.map((e) => ToDo.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [];
}

class ToDo {
  String id;
  String title;
  String description;
  bool isCompleted;

  ToDo({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  ToDo.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        title = json['title'] ?? '',
        description = json['description'] ?? '',
        isCompleted = json['isCompleted'] as bool? ?? false;
}

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
        items = (json['items'] != null && json['items'].isNotEmpty)
            ? List<ToDo>.from(json['items'].map((x) => ToDo.fromJson(x)))
            : [];
}

class SingleToDoData {
  int code;
  String message;
  ToDo todo;

  SingleToDoData({
    required this.code,
    required this.message,
    required this.todo,
  });

  SingleToDoData.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'],
        todo = ToDo.fromJson(json['data']);
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
      : id = json['_id'] ?? '',
        title = json['title'] ?? '',
        description = json['description'] ?? '',
        isCompleted = json['isCompleted'] as bool? ?? false;
}

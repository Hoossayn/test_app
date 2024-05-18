class Task {
  final int id;
  final String name;
  final bool isCompleted;

  Task(
      this.id,
     this.name,
     this.isCompleted,
  );

  // JSON serialization: Map<String, dynamic> -> TodoModel
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      json['id'],
       json['name'],
      json['is_completed'],
    );
  }

  // JSON deserialization: TodoModel -> Map<String, dynamic>
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'is_completed': isCompleted,
    };
  }

  Task copyWith({
    int? id,
    String? name,
    bool? isCompleted,
  }) {
    return Task(
      id ?? this.id,
      name ?? this.name,
      isCompleted ?? this.isCompleted,
    );
  }
}





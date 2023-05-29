class Task {
  String? id;
  String description;
  String location;

  Task(this.description, this.location);

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
      description = json['description'],
      location = json['location'];

  Map<String, dynamic> toJson() => {
    'description': description,
    'location': location
  };

  static List<Task> listFromJson(Map<String, dynamic> json) {
    List<Task> tasks = [];
    json.forEach((key, value) { 
      Map<String, dynamic> item = { "id": key, ...value };
      tasks.add(Task.fromJson(item));
    });
    return tasks;
  }


}
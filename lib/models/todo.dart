class Todo{
  String id;
  String todoText;
  bool isCompleted;

  Todo({
    required this.id,
    required this.todoText,
    this.isCompleted = false
});

  static List<Todo> todos(){
    return [
      Todo(id: '1', todoText: 'Create'),
      Todo(id: '2', todoText: 'Create ssd'),
      Todo(id: '3', todoText: 'Create sds'),
      Todo(id: '4', todoText: 'Create 333'),
    ];
  }
}
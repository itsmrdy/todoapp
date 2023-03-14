enum Screen {
  TODO_LIST,
  TODO_CREATE,
  TODO_EDIT,
}

extension Name on Screen {
  String get name {
    switch (this) {
      case Screen.TODO_LIST:
        return 'My Todos';
      case Screen.TODO_CREATE:
        return 'Create Task';
      default:
        return '';
    }
  }
}

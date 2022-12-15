import 'package:flutter/material.dart';

import 'main.dart';

class Todo {
  String text; // 할 일
  bool isDone; // 완료 여부

  Todo(this.text, this.isDone);
}

/// Todo Data 담당
class TodoService extends ChangeNotifier {
  List<Todo> todoList = [
    Todo('Grocery Store', false), // dummy data
  ];

  /// Todo List 추가
  void createTodo(String text) {
    todoList.add(Todo(text, false));
    notifyListeners();
    // 갱신 - 모든 Consumer<TodoService>의 builder 함수를 호출해 builder 부분만 새로고침.
    // ChangeNotifierProvider 로 등록된 경우만 사용 가능.
  }

  /// Todo List 수정
  void updateTodo(int index, bool type) {
    todoList[index].isDone = type;
    notifyListeners();
  }

  /// Todo List 삭제
  void deleteTodo(int index) {
    todoList.removeAt(index);
    notifyListeners();
  }
}

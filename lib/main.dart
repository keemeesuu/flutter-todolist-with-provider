import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_with_provider/todo_service.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        // Provider 등록
        ChangeNotifierProvider(create: (_) => TodoService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/// To-Do List Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoService>(
      builder: (context, todoService, child) {
        // TodoService의 todo list 가져오기
        List<Todo> todoList = todoService.todoList;

        return Scaffold(
          appBar: AppBar(
            title: Text("To-Do List"),
          ),
          body: Center(
            child: todoList.isEmpty
                ? Center(
                    child: Text("Creat Your To-Do List"),
                  )
                : ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Todo todo = todoList[index]; // index에 해당하는 todo 가져오기
                      return ListTile(
                        title: Text(
                          todoList[index].text,
                          style: TextStyle(
                            fontSize: 20,
                            color: todo.isDone ? Colors.grey : Colors.black,
                          ),
                        ),
                        // 삭제 아이콘 버튼
                        trailing: IconButton(
                          onPressed: () {
                            // 삭제 버튼 클릭시
                            todoService.deleteTodo(index);
                          },
                          icon: Icon(CupertinoIcons.delete),
                        ),
                        onTap: () {
                          // 리스트 아이템 클릭시
                          todo.isDone = !todo.isDone;
                          todoService.updateTodo(index, todo.isDone);
                        },
                      );
                    },
                  ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(CupertinoIcons.add),
            onPressed: () {
              // 버튼 클릭시 투두 리스트 생성 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreatePage(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

/// To-Do Create Page
class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController textControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add your new todo"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CupertinoTextField(
              placeholder: "Add a todo",
              autofocus: true,
              controller: textControll,
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              // 글쓰기 버튼
              child: CupertinoButton.filled(
                child: Text("Submit"),
                onPressed: textControll.text.isEmpty
                    ? null
                    : () {
                        // TodoService 가져오기
                        TodoService todoService = context.read<TodoService>();
                        todoService.createTodo(textControll.text);
                        Navigator.pop(context); // 화면 종료
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

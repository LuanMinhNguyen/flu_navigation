import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Route',
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/third') {
          final todo = settings.arguments as ToDo;
          return MaterialPageRoute(
            builder: (context) {
              return ThirdScreen(todo: todo);
            },
          );
        }
      },
    ),
  );
}

class ToDo {
  final String title;
  final String description;
  const ToDo(this.title, this.description);
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                'Second Screen',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SecondScreen(),
                //   ),
                // );
                Navigator.pushNamed(
                  context,
                  '/second',
                  arguments: ToDo(
                    'ToDo Title',
                    'ToDo Description - extract',
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text(
                'Third Screen',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SecondScreen(),
                //   ),
                // );
                Navigator.pushNamed(
                  context,
                  '/third',
                  arguments: ToDo(
                    'ToDo Title',
                    'ToDo Description - extract',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as ToDo;
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              todo.title,
              style: TextStyle(
                fontSize: 35,
                color: Colors.red,
              ),
            ),
            Text(
              todo.description,
              style: TextStyle(
                fontSize: 20,
                color: Colors.teal,
              ),
            ),
            ElevatedButton(
              child: Text(
                'First Screen',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  final ToDo todo;
  const ThirdScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              todo.title,
              style: TextStyle(
                fontSize: 35,
                color: Colors.red,
              ),
            ),
            Text(
              todo.description,
              style: TextStyle(
                fontSize: 20,
                color: Colors.teal,
              ),
            ),
            ElevatedButton(
              child: Text(
                'First Screen',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'signup_page.dart'; 
import 'login_page.dart';  

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final List<Map<String, dynamic>> _toDoList = [];
  final TextEditingController _textController = TextEditingController();

  void _addToDoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _toDoList.add({'task': task, 'completed': false});
      });
      _textController.clear();
    }
  }

  void _toggleCompletion(int index) {
    setState(() {
      _toDoList[index]['completed'] = !_toDoList[index]['completed'];
    });
  }

  void _removeToDoItem(int index) {
    setState(() {
      _toDoList.removeAt(index);
    });
  }

  void _navigateToSettings() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SettingsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 195, 254),
      appBar: AppBar(
        title: const Text('ToDo List'),
        backgroundColor: const Color.fromARGB(255, 224, 165, 254),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _navigateToSettings,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter task',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _addToDoItem(_textController.text),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _toDoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _toDoList[index]['task'],
                    style: TextStyle(
                      decoration: _toDoList[index]['completed']
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  leading: Checkbox(
                    value: _toDoList[index]['completed'],
                    onChanged: (value) {
                      _toggleCompletion(index);
                    },
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeToDoItem(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }

  void _navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person_add, color: Colors.purple),
            title: const Text('Sign Up'),
            onTap: _navigateToSignUp,
            tileColor: Colors.purple.shade50,
            textColor: Colors.purple,
          ),
          ListTile(
            leading: const Icon(Icons.login, color: Colors.purple),
            title: const Text('Login'),
            onTap: _navigateToLogin,
            tileColor: Colors.purple.shade50,
            textColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}

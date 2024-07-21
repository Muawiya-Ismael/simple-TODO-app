
import 'package:flutter/material.dart';
import 'package:second_flutter_project/util/dialog_box.dart';
import 'package:second_flutter_project/util/to_do_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List toDoList = [
    ["make a todo app",false],
  ];

  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
     _controller.clear();
    });
    Navigator.of(context).pop();
  }

  final _controller =TextEditingController();

  void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
        return DialogBox(controller: _controller, onSave:saveNewTask, onCancel: ()=> Navigator.of(context).pop(),);
      },
    );
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.blue,
        title:const Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Text('TO DO', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,)),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        onPressed: createNewTask,
        child: const Icon(Icons.add, color: Colors.black,),

      ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context,index){
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            deletedFunction:(context) => deleteTask(index),
            onChanged: (value)=> checkBoxChanged(value, index),
          );
        },
      )
    );
  }
}

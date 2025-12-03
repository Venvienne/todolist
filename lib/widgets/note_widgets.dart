import 'package:flutter/material.dart';
import 'package:todolist/models/list_item_widget.dart';
import 'package:todolist/models/list_item_model.dart';

class NoteWidget extends StatefulWidget {
  const NoteWidget({super.key});

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  final List<ListItemModel> taskList = [];
 final TextEditingController taskController = TextEditingController();

  void addTask(String t) {
    if (taskController.text == "") return;

    setState(() {
      taskList.add(ListItemModel(task: t));
      taskController.clear();
    });
  }

  void updateStatus(bool? status, int index) {
    setState(() {
      taskList[index].isDone = status;
    });
  }

  void removeItem(ListItemModel item) {
    setState(() {
      taskList.remove(item);
    });
  }

  void clearList() {
    setState(() {
      taskList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("To Do List", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30,right: 30,top: 30),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey[20],
                      hint: Text("Enter Task", style: TextStyle(fontSize: 18),),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      )
                    ),
                  ),
                  ),
                  const SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () => addTask(taskController.text), 
                    child: Icon(Icons.add),                 
                  ),
              ],

            ),
            
            SizedBox(height: 20,),


            Expanded(child:ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (BuildContext context, int index ) {
                  return ListItem(listItemModel: taskList[index],
                  updateTask: (value) => updateStatus(value, index),
                  removeItem: () => removeItem(taskList[index]),
                  
                  );
                },
             ),
            ),
          ],
        ),
      ),
      ); 
  }
}

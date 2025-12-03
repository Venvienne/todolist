import 'package:flutter/material.dart';
import 'package:todolist/models/list_item_model.dart';


class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.listItemModel,
    required this.updateTask,
    required this.removeItem,
  });

  final ListItemModel listItemModel;
  final Function(bool?) updateTask;
  final Function() removeItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),
      decoration: listItemModel.isDone == true
          ? BoxDecoration(color: Colors.grey[100])
          : BoxDecoration(color: Colors.amber[100]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            style: TextStyle(
              fontSize: 18,
              decoration: listItemModel.isDone == true
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
            listItemModel.task,
          ),
          Row(
            children: [
              Checkbox(
                value: listItemModel.isDone,
                onChanged: (bool? value) {
                  updateTask(value);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  removeItem();
                },
                child: Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
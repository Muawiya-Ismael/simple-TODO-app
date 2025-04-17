
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deletedFunction,
  });

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletedFunction;

  void onTapTial(DragEndDetails details){
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,top: 25,right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
             SlidableAction(
                onPressed:deletedFunction, // Pass context and index},
                icon: Icons.delete,
                backgroundColor: Colors.red.shade300,
                borderRadius:const BorderRadius.only(topRight:Radius.circular(12) , bottomRight: Radius.circular(12)),
             ),
          ],
        ),
        child: MouseRegion(
          onHover: (event) => onTapTial(DragEndDetails()),
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration:const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(12) , bottomLeft: Radius.circular(12)),
            ),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text(
                  taskName,
                  style: TextStyle(
                    decoration: taskCompleted ? TextDecoration.lineThrough:TextDecoration.none,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomEditAndDeleteButton extends StatelessWidget {
  const CustomEditAndDeleteButton({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            onPressed: (context) {},
            backgroundColor: Colors.lightGreen,
            foregroundColor: Colors.white,
            icon: Icons.done,
            label: 'Done',
          ),
        ]),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topLeft: Radius.circular(12)),
              onPressed: (context) {},
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  topRight: Radius.circular(12)),
              onPressed: (context) {},
              backgroundColor: const Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.share,
              label: 'Edit',
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: widget,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTitle extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;

  const HabitTitle({
    super.key,
    required this.habitName,
    required this.habitCompleted,
    required this.onChanged,
    required this.settingsTapped,
    required this.deleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          // settings option
          SlidableAction(
            onPressed: settingsTapped,
            backgroundColor: Colors.grey.shade800,
            icon: Icons.settings,
            borderRadius: BorderRadius.circular(12.0),
          ),

          // delete option
          SlidableAction(
            onPressed: deleteTapped,
            backgroundColor: Colors.red.shade400,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12.0),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(children: [
            // checkbox
            Checkbox(value: habitCompleted, onChanged: onChanged),
            // habit name
            Text(habitName),
            const Spacer(),
            Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.grey.shade800,
            ),
          ]),
        ),
      ),
    );
  }
}

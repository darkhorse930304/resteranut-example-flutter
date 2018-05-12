import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:knuffiworkout/src/db/exercise.dart' as exercise_db;
import 'package:knuffiworkout/src/model.dart';
import 'package:knuffiworkout/src/plan/change_list.dart';
import 'package:knuffiworkout/src/plan/exercise_widget.dart';

/// A view where the user defines their [PlannedExercise]s, i.e. what type
/// of exercises they want to perform (name, sets, reps, weighted, ...).
class PlanExercisesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new ChangeList<PlannedExercise>(
      changes: exercise_db.stream,
      widgetBuilder: (context, exercises, index) =>
          new ExerciseWidget(exercises[index]));
}

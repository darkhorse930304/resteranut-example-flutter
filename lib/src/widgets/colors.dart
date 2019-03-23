import 'package:flutter/material.dart';
import 'package:knuffiworkout/src/model.dart';

/// Primary color of the app.
Color get primarySwatch => Colors.blue;

/// Border color for cards.
Color get borderColor => Colors.lightBlue;

/// Color for card titles.
Color get titleColor => primarySwatch;

/// The color for a [WorkoutSet], depending on whether it was successful.
Color colorForSet(WorkoutSet set) {
  if (set.completed) {
    return set.actualReps < set.plannedReps
        ? Colors.red[700]
        : Colors.lightGreen;
  }
  return defaultSetColor;
}

/// Returns a suitable text color for the [background].
Color textColor(Color background) {
  if (background == Colors.transparent) return Colors.black;
  final luminance = background.computeLuminance();
  return luminance >= 0.45 ? Colors.black : Colors.white;
}

/// Default set color for uncompleted sets.
Color get defaultSetColor => Colors.grey[300];

/// Color for the floating action button to add new items.
Color get fabColor => primarySwatch;

/// Color for the mini-version of the FAB.
Color get miniFabColor => primarySwatch;

/// Color for underlines of editable values.
Color get underlineColor => Colors.black26;

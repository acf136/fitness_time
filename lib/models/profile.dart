import 'package:flutter/material.dart';

import 'activity.dart';

class Profile {
  final int id;
  String name;
  DateTime enrollDate;      // Date of enrollment
  int height;
  int weight;
  DateTimeRange totalTime;  // Total time accumulated for listActivities
  double totalDistance;     // Total listActivities's distance accumulated in km
  late List<Activity> listActivities;

  // CRUD - Non-final instance variables and late final instance variables,
  //  without initializers also generate an implicit setter method. For details,
  //  see https://dart.dev/guides/language/language-tour#getters-and, List list-setters

  Profile(this.id, this.name, this.enrollDate, this.height, this.weight, this.totalTime,
      this.totalDistance, this.listActivities);
}

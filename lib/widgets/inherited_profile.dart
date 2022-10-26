import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../models/profile.dart';
import '../models/extensions.dart';

class InheritedProfiles extends InheritedWidget {
  int _current ;
  static final DateTime dtstart = DateTime.now();

  List<Profile> profiles = <Profile>[
    Profile(1, 'Antonia Font', DateTime.now() , 150, 60,
        DateTimeRange(start: dtstart, end: dtstart.add(const Duration(days: 2))),
        212.4, [
      Activity(1, 0, NofActivity.running.name.toCapitalized(), DateTime.now().subtract(Duration(days: 1)),
          DateTime.now(), 1500.87, Dimension.km.name),
      Activity(1, 1, NofActivity.sauna.name.toCapitalized(), DateTime.now(),
          DateTime.now(), 204, Dimension.min.name),
      Activity(1, 2, NofActivity.marcha.name.toCapitalized(), DateTime.now(),
          DateTime.now(), 75.6, Dimension.km.name),
    ]),
    Profile(2, 'Diana', DateTime.now(), 150, 60,
        DateTimeRange(start: dtstart, end: dtstart.add(const Duration(days: 24))),
        33212.4, [
      Activity(2, 0, 'str', DateTime.now(), DateTime.now(), 0, Dimension.kg.name)
    ]),
    Profile(3, 'Harry', DateTime.now(), 180, 160,
        DateTimeRange(start: dtstart, end: dtstart.add(const Duration(days: 24))),
        99212.4, [
      Activity(0, 0, 'str', DateTime.now(), DateTime.now(), 0, Dimension.kg.name)
    ]),
  ];

  InheritedProfiles({super.key, required super.child, index = 0})
      : _current = index;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // // TODO: implement updateShouldNotify
    // throw UnimplementedError();
    return true;
  }

  // return the Profile with index in profiles,  if it exists
  int setCurrent(int index) {
    if (index < profiles.length) _current = index;
    return _current;
  }

  // return the current profile - Is the CRUD:Read operation
  Profile current() {
    return profiles[_current];
  }

  // CRUD - Depending on the existence of profile makes the suitable operation
  bool crudProfile(Profile newP) {
    int theIndex = indexId(newP.id);
    if (theIndex == -1) {
      // doesn't exist, CRUD:Create
      profiles.add(newP);
    } else {
      if (profiles[theIndex] == newP) {
        // exact element, CRUD:Delete
        profiles.remove(newP);
      } else {
        // same id and not exact element, CRUD:Update
        final repla = <Profile>[newP];
        profiles.replaceRange(theIndex, theIndex + 1, repla);
      }
    }
    return true;
  }

  int indexId(int id) => profiles.lastIndexWhere((element) => element.id == id);
}

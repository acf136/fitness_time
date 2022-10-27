import 'package:flutter/material.dart';

import '../widgets/inherited_profile.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  // final Profile profile;

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEditingText = false;
  final TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _editingController = TextEditingController();
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final InheritedProfiles inhProfile =
        context.dependOnInheritedWidgetOfExactType<InheritedProfiles>()!;
    _editingController.text = inhProfile.current().name;
    var durInh = inhProfile.current().totalTime.duration.inHours;
    var durInm = inhProfile.current().totalTime.duration.inMinutes;
    var durRemanent = durInm % durInh;
    var sinceEnroll = DateFormat.yMMMMd().format(inhProfile.current().enrollDate);
    // 'October 10, 2012'
    return Scaffold(
      appBar: AppBar(
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(Icons.arrow_back_ios),
        //       onPressed: () => Navigator.of(context).pop(),
        //       tooltip: 'Back',
        //     );
        //   },
        // ),
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20), //header margin
            const Hero(
              tag: "hero_tag",
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/44.jpg'),
                radius: 100,
              ),
            ),
            _editTitleTextField(inhProfile),
            Text('since $sinceEnroll' ),
            const SizedBox(height: 20), //metrics
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _activityProfile(
                  Icons.lock_clock,
                  'Time',
                  '${durInh}h $durRemanent\'',
                ),
                _activityProfile(
                  Icons.room,
                  'km',
                  '${inhProfile.current().totalDistance}',
                ),
                _activityProfile(
                  Icons.directions_run,
                  'Activities',
                  '${inhProfile.current().listActivities.length}',
                ),
              ],
            ),
            const SizedBox(height: 20), //Sliders
            _sliderProfile('Height', 1, 200, 40, inhProfile, 'cm'),
            _sliderProfile('Weight', 40, 140, 100, inhProfile, 'kg'),
          ],
        ),
      ),
    );
  }

  Widget _sliderProfile(String label, double min, double max, int divisions,
      InheritedProfiles inhProfile, String dimension) {
    num item = 0;
    switch (label) {
      case 'Height':
        item = inhProfile.current().height;
        break;
      case 'Weight':
        item = inhProfile.current().weight;
        break;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(label),
        Slider(
          min: min,
          max: max,
          divisions: divisions,
          label: '$item  $dimension',
          value: item.toDouble(),
          onChanged: (newValue) {
            setState(() {
              if (label == 'Height') {
                inhProfile.current().height = newValue.round();
              }
              if (label == 'Weight') {
                inhProfile.current().weight = newValue.round();
              }
            });
          },
          activeColor: Colors.purpleAccent,
          inactiveColor: Colors.grey,
        ),
        Text('$item $dimension'),
      ],
    );
  }

  Widget _activityProfile(IconData icon, String label, String quantity) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.purpleAccent,
      ),
      child: Column(
        children: [
          // const Icon(Icons.lock_clock),
          // const Text("Time"),
          // const Text("2:45", style: TextStyle(fontSize: 24)),
          Icon(icon),
          Text(label),
          Text(quantity, style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }

  Widget _editTitleTextField(InheritedProfiles inhProfile) {
    if (_isEditingText) {
      return Center(
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              inhProfile.current().name = newValue;
              _isEditingText = false;
            });
          },
          style: const TextStyle(color: Colors.red, fontSize: 40.0),
          autofocus: true,
          controller: _editingController,
        ),
      );
    }

    return InkWell(
        onTap: () {
          setState(() {
            _isEditingText = true;
          });
        },
        child: Text(
          inhProfile.current().name,
          style: const TextStyle(color: Colors.black, fontSize: 40.0),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:fitness_time/profile.dart';

class ProfileState extends StatefulWidget {
  final Profile profile;

  const ProfileState({Key? key, required this.profile}) : super(key: key);

  @override
  State<ProfileState> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<ProfileState> {

  num _sliderHeight = 150;
  num _sliderWeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop() ,
              tooltip: 'Back',
            );
          },
        ),
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20), //header margin
            const Hero(
              tag: "amtonia_font",
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/44.jpg'),
                radius: 100,
              ),
            ),
            const Text('Antònia Font',style: TextStyle(fontSize: 40),),
            const Text('since 20 April 2022'),
            const SizedBox(height: 20), //metrics
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.purpleAccent,
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.lock_clock),
                      const Text("Time"),
                      const Text("2:45", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.purpleAccent,
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.room),
                      const Text("Km"),
                      const Text("212,4", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.purpleAccent,
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.directions_run),
                      const Text("Activities"),
                      const Text("42", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), //Sliders
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Height'),
                  Slider(
                    min: 1,
                    max: 200,
                    divisions: 40,
                    label: '${_sliderHeight} cm',
                    value: _sliderHeight.toDouble(),
                    onChanged: (newValue) {
                      setState(() {
                        _sliderHeight = newValue.round();
                      });
                    },
                    activeColor: Colors.purpleAccent,
                    inactiveColor: Colors.grey,
                  ),
                  Text('${_sliderHeight} cm'),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Weight'),
                  Slider(
                    min: 40,
                    max: 140,
                    divisions: 100,
                    label: '${_sliderWeight} kg',
                    value: _sliderWeight.toDouble(),
                    onChanged: (newValue) {
                      setState(() {
                        _sliderWeight = newValue.round();
                      });
                    },
                    activeColor: Colors.purpleAccent,
                    inactiveColor: Colors.grey,
                  ),
                  Text('${_sliderWeight} kg'),
                ]
            ),
          ],
        ),
      ),
    );
  }
}















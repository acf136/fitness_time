import 'package:fitness_time/screens/profile_page.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../models/activity.dart';
import '../widgets/inherited_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentProfile = 0;

  @override
  Widget build(BuildContext context) {
    final InheritedProfiles inhProfile =
        context.dependOnInheritedWidgetOfExactType<InheritedProfiles>()!;
    currentProfile = inhProfile.setCurrent(currentProfile);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: Text(
          widget.title,
          style: GoogleFonts.getFont('Montserrat'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
                setState(() {});
              },
              child: const Hero(
                tag: "hero_tag",
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/women/44.jpg'),
                ),
              ),
            ),
          ),
        ], // actions
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            //  Text1 , Text2, Text3
            Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(inhProfile.current().name, //'Diana, ',
                        style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.headline4)),
                    const SizedBox(height: 20), //separator
                    SizedBox(
                        height: 40,
                        width: 300,
                        child: Text(
                            'Come 5 veces al día y permanece hidratada durante el dia',
                            style: GoogleFonts.montserrat(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium))),
                    const SizedBox(height: 20), //separator
                    SizedBox(
                      height: 40,
                      child: Text(
                        'Mas detalles',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.subtitle2,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                )),
            //  Text4 "Ultimas actividades"
            SizedBox(
              height: 20,
              child: Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: Row(
                    children: [
                      Text('Ultimas actividades',
                          style: GoogleFonts.montserrat(
                              textStyle: Theme.of(context).textTheme.subtitle2))
                    ],
                  )),
            ),
            //  List of 3 Cards
            Container(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: inhProfile.profiles[currentProfile].listActivities
                    .map((a) => HomeListCard(a))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 200,
              child: CircularPercentIndicator(
                radius: 50.0,
                lineWidth: 15.0,
                percent: 0.7,
                center: const Text('70%', style: TextStyle(fontSize: 30)),
                footer: const Text('Objetivo mensual',
                    style: TextStyle(fontSize: 15)),
                backgroundColor: Colors.grey,
                progressColor: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeListCard extends StatelessWidget {
  final IconData icon = Icons.run_circle_outlined;
  String name = '';
  DateTime start = DateTime.now();
  DateTime? end;
  num? quantity;

  String? _dimension;

  HomeListCard(Activity activity, {super.key}) {
    name = activity.name;
    start = activity.start;
    end = activity.end;
    quantity = activity.quantity;
    _dimension = activity.dimension;
  }

  @override
  Widget build(BuildContext context) {
    var strAyer = '';
    initializeDateFormatting('es_ES', null);
    // Intl.defaultLocale = 'es';
    DateTime dtAyer = DateTime.now().subtract(const Duration(days: 1));
    if (start.year == dtAyer.year &&
        start.month == dtAyer.month &&
        start.day == dtAyer.day) {
      strAyer = 'Ayer';
    }
    String startActivity = '$strAyer ${DateFormat.yMMMd('es').format(start)} '
        '${DateFormat.Hm().format(start)}';
    return Card(
      shadowColor: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 7,
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(width: 10), //separator
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headline6),
                    ),
                    Text(startActivity),
                  ], // children
                ),
              ],
            ),
          ),
          Flexible(
            flex: 5,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$quantity $_dimension',
                style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.headline5),
              ),
            ),
          ),
        ],
      ),
    );
  }
} // End of HomeListCard

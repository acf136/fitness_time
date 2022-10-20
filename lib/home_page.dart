import 'package:fitness_time/profile.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'profile_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> homeListCard = [
    HomeListCard(),
    HomeListCard(),
    HomeListCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: Text(
          widget.title,
          style: GoogleFonts.getFont('Montserrat'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileState(
                      profile: Profile(1, 'Antonia Font', 150, 60)))),
              child: const Hero(
                tag: "amtonia_font",
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
                    Text('Hola Diana, ',
                        style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.headline4)),
                    SizedBox(height: 20), //separator
                    SizedBox(
                        height: 40,
                        width: 300,
                        child: Text(
                            'Come 5 veces al día y permanece hidratada durante el dia',
                            style: GoogleFonts.montserrat(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium))),
                    SizedBox(height: 20), //separator
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
                children: [
                  homeListCard[0],
                  homeListCard[1],
                  homeListCard[2],
                ],
              ),
            ),
            //  Percent Indicator
            SizedBox(
              height: 200,
              child: CircularPercentIndicator(
                radius: 50.0,
                lineWidth: 15.0,
                percent: 0.7,
                center: Text('70%', style: const TextStyle(fontSize: 30)),
                footer: Text('Objetivo mensual',
                    style: const TextStyle(fontSize: 15)),
                backgroundColor: Colors.grey,
                progressColor: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Buscar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}

class MyBottomNavigationBarItem extends BottomNavigationBarItem {
  final Icon _icon = const Icon(Icons.question_mark);
  String? _label;
  Icon? _activeIcon;
  Color? _backgroundColor;
  String? _tooltip;

  MyBottomNavigationBarItem({
    required Icon icon,
    String? label,
    Icon? activeIcon,
    Color? backgroundColor,
    String? tooltip,
  }) : super(
          icon: icon,
          label: label,
          activeIcon: activeIcon,
          backgroundColor: backgroundColor,
          tooltip: tooltip,
        );

  @override
  BottomNavigationBarItem build(BuildContext context) {
    return BottomNavigationBarItem(
        icon: _icon,
        label: _label,
        activeIcon: _activeIcon,
        backgroundColor: _backgroundColor,
        tooltip: _tooltip);
  }
}

class HomeListCard extends StatelessWidget {
  final IconData icon = Icons.run_circle_outlined;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shadowColor: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  Icon(icon),
                  SizedBox(width: 10), //separator
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Running, ',
                        style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.headline6),
                      ),
                      Text('Ayer 18:20')
                    ], // children
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '7,300 km',
                  style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headline5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} // End of HomeListCard














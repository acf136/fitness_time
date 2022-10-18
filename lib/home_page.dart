import 'package:flutter/material.dart';

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
          leading: CircleAvatar(
            // backgroundColor: Colors.
            child: Image.network(
              'https://randomuser.me/api/portraits/women/44.jpg',
              width: 50,
            ),
          ),
          centerTitle: true,
          title: Text(widget.title),
          // backgroundColor: Theme.of(context).backgroundColor ,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hola Diana, ',
                          style: Theme.of(context).textTheme.headline4),
                      Text(
                          'Come 5 veces al día y permanece hidratada durante el dia',
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text('Mas detalles',
                          style: Theme.of(context).textTheme.subtitle2),
                      Text('Ultimas actividades',
                          style: Theme.of(context).textTheme.subtitle2),
                    ],
                  )),
              // List of 3 Cards
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    homeListCard[0],
                    homeListCard[1],
                    homeListCard[2],
                  ],
                ),
              ),

              Text('Objetivo mensual', style: const TextStyle(fontSize: 30)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.home),
                      Text("Inicio"),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.search),
                      Text("Buscar"),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.person),
                      Text("Perfil"),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class HomeListCard extends StatelessWidget {
  final IconData icon = Icons.run_circle_outlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Running, ', style: Theme.of(context).textTheme.headline6),
              Text('Ayer')
            ],  // children
          ),
          Text('7300 KM', style: Theme.of(context).textTheme.headline5),
        ],
      ),
    );
  }
}

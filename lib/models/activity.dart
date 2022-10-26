enum NofActivity { running, sauna, futbol, basquet, marcha }
enum Dimension { km, kg, cm, min, hour }

class Activity {
  final int idUser; // id Profile by default = MySelf
  final int id; //id
  // denomination :  Running get from enum.name
  late String name = "${NofActivity.running.name}.capitalize()";
  late DateTime start = DateTime.now();
  late DateTime end = DateTime.now();
  late num quantity = 0;
  late String dimension; //KM,KG,. . .

  // CRUD - Non-final instance variables and late final instance variables,
  //  without initializers also generate an implicit setter method. For details,
  //  see https://dart.dev/guides/language/language-tour#getters-and-setters

  Activity(this.idUser, this.id, this.name, this.start, this.end, this.quantity,
      this.dimension);
}

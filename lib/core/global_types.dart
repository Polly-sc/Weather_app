
class Coords{
  late double lat;
  late double lon;

  Coords(double this.lat, double this.lon);
}

final List<Coords> AllCitiesListCoords = [Coords(55.751244, 37.618423), Coords(50.6107, 36.5802), Coords(59.9343, 30.3351)];

Map<int, String> CurrentCityList = {
  213: 'Moscow',
  4: 'Belgorod',
  2: 'Sankt-petersburg'
};
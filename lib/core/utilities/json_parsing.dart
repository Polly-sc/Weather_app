
Map<String, dynamic> fieldFromJson(
    {required String fieldName, required Map<String, dynamic> json}) {
  List<dynamic> _list = json['fields'] as List;
  _list = _list.where((element) => element['name'] == fieldName).toList();
  return _list.isNotEmpty ? _list.first : Map();
}
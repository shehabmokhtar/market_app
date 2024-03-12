List<T> getListFromJson<T>({
  required List<dynamic> data,
  required T Function(Map<String, dynamic>) fromJson,
}) {
  List<T> list = [];
  for (var e in data) {
    list.add(fromJson(e));
  }
  return list;
}

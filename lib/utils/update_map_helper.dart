Map<String, Object?> diffMaps(
    {required Map<String, Object?> oldMap,
    required Map<String, Object?> newMap}) {
  var newKeys = newMap.keys.toList();

  var newUpdateMap = <String, Object?>{};

  for (var key in newKeys) {
    if (!oldMap.containsKey(key) || oldMap[key] != newMap[key]) {
      newUpdateMap[key] = newMap[key];
    }
  }

  return newUpdateMap;
}

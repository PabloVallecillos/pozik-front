class Model
{
  static int findKeyByValue(Map<int, String> map, String value)
    => map.keys.firstWhere((int key) => map[key] == value);

  Map<String, dynamic> toMap() => <String, dynamic>{};

  Map<String, dynamic> toMapConstant() => <String, dynamic>{};

  dynamic get(String propertyName) => toMap()[propertyName];

  dynamic getConstant(String propertyName) => toMapConstant()[propertyName];
}

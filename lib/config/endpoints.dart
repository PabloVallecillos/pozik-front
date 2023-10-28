final Map<String, dynamic> endpoints = <String, dynamic>{
  'user': <String, dynamic>{
    'login': 'login',
    'logout': 'logout',
    'register': 'register',
    'update': (int? id) => 'user/update${id != null ? '/$id' : ''}',
  }
};

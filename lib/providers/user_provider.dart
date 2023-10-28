import 'package:flutter/material.dart';

import '../models/user.dart';
import 'abstract_provider.dart';

class UserProvider extends AbstractProvider {
  User _user = User();
  final List<User> _users = <User>[];

  User get user => _user;

  List<User> get users => _users;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  bool isSignedIn() => _user.id != null;

  void set({
    int? id,
    String? username,
    String? name,
    String? surname,
    String? email,
    String? telephone,
    int? position,
    String? positionName,
    int? availabilityRadius,
    String? address,
    String? city,
    String? regionCode,
    String? countryCode,
    String? emailVerifiedAt,
    String? createdAt,
    String? updatedAt,
    ImageProvider? avatar,
    bool? isPublic,
    int? pendingNotifications,
  }) {
    if (id != null) _user.id = id;
    if (username != null) _user.username = username;
    if (name != null) _user.name = name;
    if (surname != null) _user.surname = surname;
    if (email != null) _user.email = email;
    if (telephone != null) _user.telephone = telephone;
    if (position != null) _user.position = position;
    if (positionName != null) _user.positionName = positionName;
    if (availabilityRadius != null) {
      _user.availabilityRadius = availabilityRadius;
    }
    if (address != null) _user.address = address;
    if (city != null) _user.city = city;
    if (regionCode != null) _user.regionCode = regionCode;
    if (countryCode != null) _user.countryCode = countryCode;
    if (emailVerifiedAt != null) _user.emailVerifiedAt = emailVerifiedAt;
    if (createdAt != null) _user.createdAt = createdAt;
    if (updatedAt != null) _user.updatedAt = updatedAt;
    if (avatar != null) _user.avatar = avatar;
    if (isPublic != null) _user.isPublic = isPublic;
    if (pendingNotifications != null)
      _user.pendingNotifications = pendingNotifications;
    notifyListeners();
  }
}

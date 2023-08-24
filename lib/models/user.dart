import 'package:flutter/material.dart';

import 'model.dart';

class User extends Model
{
  static const int roleAdmin = 1;
  static const int roleUser = 0;

  int? id;
  String? username;
  String? name;
  String? surname;
  String? email;
  String? telephone;
  int? position;
  String? positionName;
  int? availabilityRadius;
  String? address;
  String? city;
  String? regionCode;
  String? countryCode;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  dynamic avatar;
  bool? isPublic;
  int? score;
  int role;
  int pendingNotifications;

  User({
    this.id,
    this.username,
    this.name,
    this.surname,
    this.email,
    this.telephone,
    this.position,
    this.positionName,
    this.availabilityRadius,
    this.address,
    this.city,
    this.regionCode,
    this.countryCode,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.avatar,
    this.isPublic,
    this.score,
    this.role = 0,
    this.pendingNotifications = 0
  });

  factory User.fromJson(Map<String, dynamic> res) => User(
    id: res['id'],
    username: res['username'],
    email: res['email'],
    name: res['name'],
    surname: res['surname'],
    telephone: res['telephone'],
    position: res['position'],
    positionName: res['position_name'],
    availabilityRadius: res['availability_radius'],
    address: res['address'],
    city: res['city'],
    regionCode: res['region_code'],
    countryCode: res['country_code'],
    emailVerifiedAt: res['email_verified_at'],
    createdAt: res['created_at'],
    updatedAt: res['updated_at'],
    avatar: res['avatar'] != null ? NetworkImage(res['avatar']) : null,
    isPublic: res['is_public'],
    score: res['score'],
    role: res['role'] ?? 0,
    pendingNotifications: res['pending_notifications'] ?? 0,
  );

  @override
  Map<String, dynamic> toMapConstant() => <String, dynamic>{
    'roleAdmin': roleAdmin,
    'roleUser': roleUser,
  };

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['name'] = name;
    map['surname'] = surname;
    map['email'] = email;
    map['telephone'] = telephone;
    map['position'] = position;
    map['positionname'] = positionName;
    map['availabilityradius'] = availabilityRadius;
    map['address'] = address;
    map['city'] = city;
    map['regioncode'] = regionCode;
    map['countrycode'] = countryCode;
    map['emailverifiedat'] = emailVerifiedAt;
    map['createdat'] = createdAt;
    map['updatedat'] = updatedAt;
    return map;
  }

  bool isRole(String role) => this.role == getConstant('role$role');
}

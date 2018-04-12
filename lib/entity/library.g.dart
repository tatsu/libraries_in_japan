// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Library _$LibraryFromJson(Map<String, dynamic> json) => new Library(
    systemId: json['systemid'] as String,
    systemName: json['systemname'] as String,
    libKey: json['libkey'] as String,
    libId: json['libid'] as String,
    shortName: json['short'] as String,
    formalName: json['formal'] as String,
    urlPC: json['url_pc'] as String,
    address: json['address'] as String,
    pref: json['pref'] as String,
    city: json['city'] as String,
    post: json['post'] as String,
    tel: json['tel'] as String,
    geoCode: json['geocode'] as String,
    category: json['category'] as String,
    image: json['image'] as String,
    distance: json['distance'] as String);

abstract class _$LibrarySerializerMixin {
  String get systemId;
  String get systemName;
  String get libKey;
  String get libId;
  String get shortName;
  String get formalName;
  String get urlPC;
  String get address;
  String get pref;
  String get city;
  String get post;
  String get tel;
  String get geoCode;
  String get category;
  String get image;
  String get distance;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'systemid': systemId,
        'systemname': systemName,
        'libkey': libKey,
        'libid': libId,
        'short': shortName,
        'formal': formalName,
        'url_pc': urlPC,
        'address': address,
        'pref': pref,
        'city': city,
        'post': post,
        'tel': tel,
        'geocode': geoCode,
        'category': category,
        'image': image,
        'distance': distance
      };
}

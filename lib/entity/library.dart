import 'package:json_annotation/json_annotation.dart';

part 'library.g.dart';

@JsonSerializable()
class Library extends Object with _$LibrarySerializerMixin {
  @JsonKey(name: 'systemid')
  final String systemId; // システムID
  @JsonKey(name: 'systemname')
  final String systemName; // システム名称
  @JsonKey(name: 'libkey')
  final String libKey; // システム毎の図書館キー
  @JsonKey(name: 'libid')
  final String libId; // 図書館のユニークID
  @JsonKey(name: 'short')
  final String shortName; // 略称
  @JsonKey(name: 'formal')
  final String formalName; // 正式名称
  @JsonKey(name: 'url_pc')
  final String urlPC; // PC版ウェブサイト
  final String address; // 住所
  final String pref; // 都道府県
  final String city; // 市町村
  final String post; // 郵便番号
  final String tel; // 電話番号
  @JsonKey(name: 'geocode')
  final String geoCode; // 位置情報
  final String category; // カテゴリー（下記参照）
  final String image; // 外観写真（現時点では空です）
  final String distance; // パラメータでgeocodeが指定されている場合、その地点からの距離(単位：km)

  Library(
      {this.systemId,
      this.systemName,
      this.libKey,
      this.libId,
      this.shortName,
      this.formalName,
      this.urlPC,
      this.address,
      this.pref,
      this.city,
      this.post,
      this.tel,
      this.geoCode,
      this.category,
      this.image,
      this.distance});

  factory Library.fromJson(Map<String, dynamic> json) => _$LibraryFromJson(json);
}

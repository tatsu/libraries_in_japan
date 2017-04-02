import 'package:dartson/dartson.dart';

@Entity()
class Library {
  String systemid;	// システムID
  String systemname;	// システム名称
  String libkey;	// システム毎の図書館キー
  String libid;	// 図書館のユニークID
  String short;	// 略称
  String formal;	// 正式名称
  String url_pc;	// PC版ウェブサイト
  String address;	// 住所
  String pref;	// 都道府県
  String city;	// 市町村
  String post;	// 郵便番号
  String tel;	// 電話番号
  String geocode;	// 位置情報
  String category;	// カテゴリー（下記参照）
  String image;	// 外観写真（現時点では空です）
  String distance;	// パラメータでgeocodeが指定されている場合、その地点からの距離(単位：km)
}

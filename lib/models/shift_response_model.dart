// To parse this JSON data, do
//
//     final shiftResponse = shiftResponseFromJson(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';

ShiftResponse shiftResponseFromJson(String str) =>
    ShiftResponse.fromJson(json.decode(str));

String shiftResponseToJson(ShiftResponse data) => json.encode(data.toJson());

class ShiftResponse {
  ShiftResponse({
    this.data,
    this.links,
    this.meta,
  });

  List<Shift>? data;
  Links? links;
  Meta? meta;

  factory ShiftResponse.fromJson(Map<String, dynamic> json) => ShiftResponse(
        data: List<Shift>.from(json["data"].map((x) => Shift.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links!.toJson(),
        "meta": meta!.toJson(),
      };
}

class Shift {
  Shift({
    this.id,
    this.status,
    this.startAt,
    this.endAt,
    this.postName,
    this.postId,
    this.startSoon,
    this.recurring,
    this.company,
    this.buyPrice,
    this.bonus,
    this.latitude,
    this.longitude,
  });

  int? id;
  String? status;
  DateTime? startAt;
  DateTime? endAt;
  String? postName;
  int? postId;
  bool? startSoon;
  Recurring? recurring;
  String? company;
  String? buyPrice;
  int? bonus;
  double? latitude;
  double? longitude;

  String formatDate(DateTime date) => DateFormat('hh:mm').format(date);
// console.log(new Intl.DateTimeFormat('fr-FR', { dateStyle: 'full', timeStyle: 'long' }).format(date));

  String formatTofrench(DateTime date) =>
      DateFormat('EEEE - dd - MMM', 'fr-FR').format(date);

  factory Shift.fromJson(Map<String, dynamic> json) => Shift(
        id: json["id"],
        status: json["status"],
        startAt: DateTime.parse(json["start_at"]),
        endAt: DateTime.parse(json["end_at"]),
        postName: json["post_name"],
        postId: json["post_id"],
        startSoon: json["start_soon"],
        recurring: json["recurring"] == null
            ? null
            : Recurring.fromJson(json["recurring"]),
        company: json["company"],
        buyPrice: json["buy_price"],
        bonus: json["bonus"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "start_at": startAt!.toIso8601String(),
        "end_at": endAt!.toIso8601String(),
        "post_name": postName,
        "post_id": postId,
        "start_soon": startSoon,
        "recurring": recurring == null ? null : recurring!.toJson(),
        "company": company,
        "buy_price": buyPrice,
        "bonus": bonus,
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Recurring {
  Recurring({
    this.id,
    this.startAt,
    this.endAt,
    this.isAvailable,
  });

  int? id;
  DateTime? startAt;
  DateTime? endAt;
  bool? isAvailable;

  factory Recurring.fromJson(Map<String, dynamic> json) => Recurring(
        id: json["id"],
        startAt: DateTime.parse(json["start_at"]),
        endAt: DateTime.parse(json["end_at"]),
        isAvailable: json["is_available"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start_at": startAt!.toIso8601String(),
        "end_at": endAt!.toIso8601String(),
        "is_available": isAvailable,
      };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  String? next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

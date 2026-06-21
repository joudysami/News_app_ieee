import 'source.dart';

class Sources {
  String? status;
  List<Source>? sources;

  Sources({this.status, this.sources});

  factory Sources.fromJson(Map<String, dynamic> json) => Sources(
    status: json['status'] as String?,
    sources: (json['sources'] as List<dynamic>?)
        ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
        .toList(),
  );




  Map<String, dynamic> toJson() => {
    'status': status,
    'sources': sources?.map((e) => e.toJson()).toList(),
  };
}
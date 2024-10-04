import 'reel_model.dart';
import 'links.dart';
import 'meta.dart';

class ReelsResponse {
  List<ReelModel>? data;
  Links? links;
  Meta? meta;
  String? status;
  dynamic message;

  ReelsResponse({
    this.data,
    this.links,
    this.meta,
    this.status,
    this.message,
  });

  factory ReelsResponse.fromJson(Map<String, dynamic> json) => ReelsResponse(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => ReelModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        status: json['status'] as String?,
        message: json['message'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
        'status': status,
        'message': message,
      };
}

class ReelModel {
  int? id;
  bool? isMine;
  int? roomId;
  String? video;
  String? preview;
  String? size;
  String? duration;
  int? likesCount;
  String? likesCountTranslated;
  bool? authLikeStatus;

  ReelModel({
    this.id,
    this.isMine,
    this.roomId,
    this.video,
    this.preview,
    this.size,
    this.duration,
    this.likesCount,
    this.likesCountTranslated,
    this.authLikeStatus,
  });

  factory ReelModel.fromJson(Map<String, dynamic> json) => ReelModel(
        id: json['id'] as int?,
        isMine: json['is_mine'] as bool?,
        roomId: json['room_id'] as int?,
        video: json['video'] as String?,
        preview: json['preview'] as String?,
        size: json['size'] as String?,
        duration: json['duration'] as String?,
        likesCount: json['likes_count'] as int?,
        likesCountTranslated: json['likes_count_translated'] as String?,
        authLikeStatus: json['auth_like_status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'is_mine': isMine,
        'room_id': roomId,
        'video': video,
        'preview': preview,
        'size': size,
        'duration': duration,
        'likes_count': likesCount,
        'likes_count_translated': likesCountTranslated,
        'auth_like_status': authLikeStatus,
      };
}

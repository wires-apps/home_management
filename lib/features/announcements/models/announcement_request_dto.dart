import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_request_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AnnouncementRequestDto extends Equatable {
  const AnnouncementRequestDto({
    required this.title,
    required this.message,
    this.photos,
  });

  @JsonKey(name: 'title', required: true, includeIfNull: false)
  final String title;

  @JsonKey(name: 'message', required: true, includeIfNull: false)
  final String message;

  @JsonKey(includeFromJson: false, includeToJson: false, required: false, includeIfNull: false)
  final List<File>? photos;

  factory AnnouncementRequestDto.fromJson(Map<String, dynamic> json) => _$AnnouncementRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementRequestDtoToJson(this);

  @override
  List<Object?> get props => [
        title,
        message,
        photos,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:home_management/features/announcements/models/announcement_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_single_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AnnouncementSingleDto extends Equatable {
  const AnnouncementSingleDto({required this.announcement, required this.deletable});

  @JsonKey(name: 'announcement', required: true, includeIfNull: false)
  final AnnouncementDto announcement;

  @JsonKey(name: 'deletable', required: true, includeIfNull: false)
  final bool deletable;

  factory AnnouncementSingleDto.fromJson(Map<String, dynamic> json) => _$AnnouncementSingleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementSingleDtoToJson(this);

  @override
  List<Object?> get props => [announcement, deletable];
}

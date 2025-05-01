import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_delete_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AnnouncementDeleteResponseDto extends Equatable {
  const AnnouncementDeleteResponseDto({
    required this.message,
  });

  @JsonKey(name: 'message', required: true, includeIfNull: false)
  final String message;

  factory AnnouncementDeleteResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementDeleteResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementDeleteResponseDtoToJson(this);

  @override
  List<Object?> get props => [
        message,
      ];
}

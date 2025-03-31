import 'package:equatable/equatable.dart';
import 'package:home_management/features/notification/models/single_notification_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_data_notification_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SingleDataNotificationResponseDto extends Equatable {
  const SingleDataNotificationResponseDto({
    required this.data,
  });

  @JsonKey(name: 'data', required: true, includeIfNull: false)
  final SingleNotificationResponseDto data;

  factory SingleDataNotificationResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SingleDataNotificationResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SingleDataNotificationResponseDtoToJson(this);

  @override
  List<Object?> get props => [data];
}

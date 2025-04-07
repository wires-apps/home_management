import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_service_request_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NotificationServiceRequestDto extends Equatable {
  const NotificationServiceRequestDto({
    required this.fcmToken,
  });

  @JsonKey(name: 'fcm_token', required: true, includeIfNull: false)
  final String fcmToken;

  factory NotificationServiceRequestDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationServiceRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationServiceRequestDtoToJson(this);

  @override
  List<Object?> get props => [fcmToken];
}

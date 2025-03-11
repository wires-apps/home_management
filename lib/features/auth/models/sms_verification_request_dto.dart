import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sms_verification_request_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmsVerificationRequestDto extends Equatable {
  const SmsVerificationRequestDto({
    required this.userId,
    required this.code,
    required this.device,
  });

  @JsonKey(name: 'user_id', required: true, includeIfNull: false)
  final num userId;

  @JsonKey(name: 'code', required: true, includeIfNull: false)
  final String code;

  @JsonKey(name: 'device', required: true, includeIfNull: false)
  final String device;

  factory SmsVerificationRequestDto.fromJson(Map<String, dynamic> json) => _$SmsVerificationRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SmsVerificationRequestDtoToJson(this);

  @override
  List<Object?> get props => [
        userId,
        code,
        device,
      ];
}

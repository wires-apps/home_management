import 'package:equatable/equatable.dart';
import 'package:home_management/features/auth/models/user_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sms_verification_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmsVerificationResponseDto extends Equatable {
  const SmsVerificationResponseDto({
    required this.authToken,
    required this.user,
  });

  @JsonKey(name: 'auth_token', required: true, includeIfNull: false)
  final String authToken;

  @JsonKey(name: 'user', required: true, includeIfNull: false)
  final UserResponseDto user;

  factory SmsVerificationResponseDto.fromJson(Map<String, dynamic> json) => _$SmsVerificationResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SmsVerificationResponseDtoToJson(this);

  @override
  List<Object?> get props => [];
}

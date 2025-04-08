import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sing_in_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SignInResponseDto extends Equatable {
  const SignInResponseDto({
    required this.message,
    required this.requiresVerification,
    required this.userId,
  });

  @JsonKey(name: 'message', required: true, includeIfNull: false)
  final String message;

  @JsonKey(name: 'requires_verification', required: true, includeIfNull: false)
  final bool requiresVerification;

  @JsonKey(name: 'user_id', required: true, includeIfNull: false)
  final num userId;

  factory SignInResponseDto.fromJson(Map<String, dynamic> json) => _$SignInResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseDtoToJson(this);

  @override
  List<Object?> get props => [
        message,
        requiresVerification,
        userId,
      ];
}

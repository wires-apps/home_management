import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SignInRequestDto extends Equatable {
  const SignInRequestDto({
    required this.password,
    required this.personalAccount,
    required this.device,
    required this.phoneNumber,
  });

  @JsonKey(name: 'personal_account', required: true, includeIfNull: false)
  final String personalAccount;

  @JsonKey(name: 'password', required: true, includeIfNull: false)
  final String password;

  @JsonKey(name: 'device', required: true, includeIfNull: false)
  final String device;

  @JsonKey(name: 'phone_number', required: true, includeIfNull: false)
  final String phoneNumber;

  factory SignInRequestDto.fromJson(Map<String, dynamic> json) => _$SignInRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestDtoToJson(this);

  @override
  List<Object?> get props => [
        password,
        personalAccount,
        device,
        phoneNumber,
      ];
}

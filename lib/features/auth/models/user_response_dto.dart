import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserResponseDto extends Equatable {
  const UserResponseDto({
    required this.id,
    required this.name,
    required this.personalAccount,
    required this.phoneNumber,
    required this.residentialComplexId,
    required this.blockNumber,
    required this.apartmentNumber,
  });

  @JsonKey(name: 'id', required: true, includeIfNull: false)
  final num id;

  @JsonKey(name: 'name', required: true, includeIfNull: false)
  final String name;

  @JsonKey(name: 'personal_account', required: true, includeIfNull: false)
  final String? personalAccount;

  @JsonKey(name: 'phone_number', required: true, includeIfNull: false)
  final String? phoneNumber;

  @JsonKey(name: 'residential_complex_id', required: false, includeIfNull: false)
  final int? residentialComplexId;

  @JsonKey(name: 'block_number', required: true, includeIfNull: false)
  final String? blockNumber;

  @JsonKey(name: 'apartment_number', required: true, includeIfNull: false)
  final String? apartmentNumber;

  factory UserResponseDto.fromJson(Map<String, dynamic> json) => _$UserResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        personalAccount,
        phoneNumber,
        residentialComplexId,
        blockNumber,
        apartmentNumber,
      ];
}

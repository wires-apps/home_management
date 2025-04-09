import 'package:equatable/equatable.dart';
import 'package:home_management/features/public_utilities/models/debt_item_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'debt_single_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DebtSingleResponse extends Equatable {
  const DebtSingleResponse({
    required this.data,
  });

  @JsonKey(name: 'data', required: true, includeIfNull: false)
  final DebtItemResponse data;

  factory DebtSingleResponse.fromJson(Map<String, dynamic> json) => _$DebtSingleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DebtSingleResponseToJson(this);

  @override
  List<Object?> get props => [
        data,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:home_management/features/public_utilities/models/debt_item_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'debts_data_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DebtsDataResponse extends Equatable {
  const DebtsDataResponse({
    required this.data,
  });

  @JsonKey(name: 'data', required: true, includeIfNull: false)
  final List<DebtSingleItemResponse> data;

  factory DebtsDataResponse.fromJson(Map<String, dynamic> json) => _$DebtsDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DebtsDataResponseToJson(this);

  @override
  List<Object?> get props => [data];
}

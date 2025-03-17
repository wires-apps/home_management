import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'debt_item_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DebtItemResponse extends Equatable {
  const DebtItemResponse({
    required this.id,
    required this.userId,
    required this.name,
    required this.amount,
    required this.dueDate,
    required this.overdue,
  });


  @JsonKey(name: 'id', required: true, includeIfNull: false)
  final int id;

  @JsonKey(name: 'user_id', required: true, includeIfNull: false)
  final int userId;

  @JsonKey(name: 'name', required: true, includeIfNull: false)
  final String name;

  @JsonKey(name: 'amount', required: true, includeIfNull: false)
  final String amount;

  @JsonKey(name: 'due_date', required: true, includeIfNull: false)
  final String dueDate;

  @JsonKey(name: 'overdue', required: true, includeIfNull: false)
  final bool overdue;

  factory DebtItemResponse.fromJson(Map<String, dynamic> json) => _$DebtItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DebtItemResponseToJson(this);

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        amount,
        dueDate,
        overdue,
      ];
}

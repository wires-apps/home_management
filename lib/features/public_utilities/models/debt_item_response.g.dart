// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DebtItemResponse _$DebtItemResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DebtItemResponse',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'user_id',
            'name',
            'amount',
            'due_date',
            'overdue'
          ],
        );
        final val = DebtItemResponse(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          amount: $checkedConvert('amount', (v) => v as String),
          dueDate: $checkedConvert('due_date', (v) => v as String),
          overdue: $checkedConvert('overdue', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'userId': 'user_id', 'dueDate': 'due_date'},
    );

Map<String, dynamic> _$DebtItemResponseToJson(DebtItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'amount': instance.amount,
      'due_date': instance.dueDate,
      'overdue': instance.overdue,
    };

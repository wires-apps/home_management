// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_single_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DebtSingleResponse _$DebtSingleResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DebtSingleResponse',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['data'],
        );
        final val = DebtSingleResponse(
          data: $checkedConvert('data',
              (v) => DebtItemResponse.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$DebtSingleResponseToJson(DebtSingleResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

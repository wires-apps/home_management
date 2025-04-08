// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debts_data_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DebtsDataResponse _$DebtsDataResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DebtsDataResponse',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['data'],
        );
        final val = DebtsDataResponse(
          data: $checkedConvert(
              'data',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      DebtSingleItemResponse.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$DebtsDataResponseToJson(DebtsDataResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

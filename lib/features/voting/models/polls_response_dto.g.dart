// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polls_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollsResponseDto _$PollsResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PollsResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'title',
            'description',
            'residential_complex_id',
            'start_date',
            'end_date',
            'created_at',
            'updated_at'
          ],
        );
        final val = PollsResponseDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          residentialComplexId: $checkedConvert(
              'residential_complex_id', (v) => (v as num?)?.toInt()),
          startDate: $checkedConvert('start_date', (v) => v as String),
          endDate: $checkedConvert('end_date', (v) => v as String),
          createdAt: $checkedConvert('created_at', (v) => v as String),
          updatedAt: $checkedConvert('updated_at', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'residentialComplexId': 'residential_complex_id',
        'startDate': 'start_date',
        'endDate': 'end_date',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$PollsResponseDtoToJson(PollsResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      if (instance.residentialComplexId case final value?)
        'residential_complex_id': value,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

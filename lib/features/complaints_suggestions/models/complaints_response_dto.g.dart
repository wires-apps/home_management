// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaints_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintsResponseDto _$ComplaintsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ComplaintsResponseDto',
      json,
      ($checkedConvert) {
        final val = ComplaintsResponseDto(
          complaints: $checkedConvert(
              'complaints',
              (v) => (v as List<dynamic>)
                  .map((e) => SingleComplaintResponseDto.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ComplaintsResponseDtoToJson(
        ComplaintsResponseDto instance) =>
    <String, dynamic>{
      'complaints': instance.complaints.map((e) => e.toJson()).toList(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_notification_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleNotificationResponseDto _$SingleNotificationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SingleNotificationResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'type',
            'title',
            'message',
            'photos',
            'has_pdf',
            'pdf_url',
            'created_at'
          ],
        );
        final val = SingleNotificationResponseDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          type: $checkedConvert('type', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String),
          message: $checkedConvert('message', (v) => v as String),
          userId: $checkedConvert('user_id', (v) => v as String?),
          residentialComplexId: $checkedConvert(
              'residential_complex_id', (v) => (v as num?)?.toInt()),
          photos: $checkedConvert(
              'photos',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      PhotoModelResponseDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          hasPdf: $checkedConvert('has_pdf', (v) => v as bool),
          pdfUrl: $checkedConvert('pdf_url', (v) => v as String?),
          createdAt: $checkedConvert('created_at', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'residentialComplexId': 'residential_complex_id',
        'hasPdf': 'has_pdf',
        'pdfUrl': 'pdf_url',
        'createdAt': 'created_at'
      },
    );

Map<String, dynamic> _$SingleNotificationResponseDtoToJson(
        SingleNotificationResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
      if (instance.userId case final value?) 'user_id': value,
      if (instance.residentialComplexId case final value?)
        'residential_complex_id': value,
      'photos': instance.photos.map((e) => e.toJson()).toList(),
      'has_pdf': instance.hasPdf,
      if (instance.pdfUrl case final value?) 'pdf_url': value,
      'created_at': instance.createdAt,
    };

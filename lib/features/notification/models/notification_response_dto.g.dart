// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponseDto _$NotificationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'NotificationResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'current_page',
            'data',
            'first_page_url',
            'last_page',
            'last_page_url',
            'links',
            'path',
            'per_page',
            'total'
          ],
        );
        final val = NotificationResponseDto(
          currentPage:
              $checkedConvert('current_page', (v) => (v as num).toInt()),
          data: $checkedConvert(
              'data',
              (v) => (v as List<dynamic>)
                  .map((e) => DataNotificationResponseDto.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          firstPageUrl: $checkedConvert('first_page_url', (v) => v as String),
          lastPage: $checkedConvert('last_page', (v) => (v as num).toInt()),
          lastPageUrl: $checkedConvert('last_page_url', (v) => v as String),
          from: $checkedConvert('from', (v) => (v as num?)?.toInt()),
          links: $checkedConvert(
              'links',
              (v) => (v as List<dynamic>)
                  .map((e) => LinkNotificationResponseDto.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          path: $checkedConvert('path', (v) => v as String),
          nextPageUrl: $checkedConvert('next_page_url', (v) => v as String?),
          perPage: $checkedConvert('per_page', (v) => (v as num).toInt()),
          prevPageUrl: $checkedConvert('prev_page_url', (v) => v as String?),
          to: $checkedConvert('to', (v) => (v as num?)?.toInt()),
          total: $checkedConvert('total', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'currentPage': 'current_page',
        'firstPageUrl': 'first_page_url',
        'lastPage': 'last_page',
        'lastPageUrl': 'last_page_url',
        'nextPageUrl': 'next_page_url',
        'perPage': 'per_page',
        'prevPageUrl': 'prev_page_url'
      },
    );

Map<String, dynamic> _$NotificationResponseDtoToJson(
        NotificationResponseDto instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'first_page_url': instance.firstPageUrl,
      if (instance.from case final value?) 'from': value,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'links': instance.links.map((e) => e.toJson()).toList(),
      if (instance.nextPageUrl case final value?) 'next_page_url': value,
      'path': instance.path,
      'per_page': instance.perPage,
      if (instance.prevPageUrl case final value?) 'prev_page_url': value,
      if (instance.to case final value?) 'to': value,
      'total': instance.total,
    };

import 'package:equatable/equatable.dart';
import 'package:home_management/features/notification/models/data_notification_response_dto.dart';
import 'package:home_management/features/notification/models/link_notification_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NotificationResponseDto extends Equatable {
  const NotificationResponseDto({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.lastPage,
    required this.lastPageUrl,
    required this.from,
    required this.links,
    required this.path,
    required this.nextPageUrl,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  @JsonKey(name: 'current_page', required: true, includeIfNull: false)
  final int currentPage;

  @JsonKey(name: 'data', required: true, includeIfNull: false)
  final List<DataNotificationResponseDto> data;

  @JsonKey(name: 'first_page_url', required: true, includeIfNull: false)
  final String firstPageUrl;

  @JsonKey(name: 'from', required: false, includeIfNull: false)
  final int? from;

  @JsonKey(name: 'last_page', required: true, includeIfNull: false)
  final int lastPage;

  @JsonKey(name: 'last_page_url', required: true, includeIfNull: false)
  final String lastPageUrl;

  @JsonKey(name: 'links', required: true, includeIfNull: false)
  final List<LinkNotificationResponseDto> links;

  @JsonKey(name: 'next_page_url', required: false, includeIfNull: false)
  final String? nextPageUrl;

  @JsonKey(name: 'path', required: true, includeIfNull: false)
  final String path;

  @JsonKey(name: 'per_page', required: true, includeIfNull: false)
  final int perPage;

  @JsonKey(name: 'prev_page_url', required: false, includeIfNull: false)
  final String? prevPageUrl;

  @JsonKey(name: 'to', required: false, includeIfNull: false)
  final int? to;

  @JsonKey(name: 'total', required: true, includeIfNull: false)
  final int total;

  factory NotificationResponseDto.fromJson(Map<String, dynamic> json) => _$NotificationResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseDtoToJson(this);

  @override
  List<Object?> get props => [
        currentPage,
        data,
        firstPageUrl,
        lastPage,
        from,
        lastPageUrl,
        links,
        nextPageUrl,
        path,
        perPage,
        prevPageUrl,
        to,
        total,
      ];
}

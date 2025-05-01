import 'dart:async';

import 'package:dio/dio.dart';
import 'package:home_management/api/base_api.dart';
import 'package:home_management/features/announcements/models/announcement_delete_response_dto.dart';
import 'package:home_management/features/announcements/models/announcement_dto.dart';
import 'package:home_management/features/announcements/models/announcement_request_dto.dart';
import 'package:home_management/features/announcements/models/announcement_single_dto.dart';

class AnnouncementsApi extends BaseApi {
  const AnnouncementsApi({required super.dio});

  Future<Response<List<AnnouncementDto>>> getAnnouncements() async {
    return callDioGetList(
      path: '/api/announcements',
      getData: (list) => list.map((json) => AnnouncementDto.fromJson(json)).toList(),
    );
  }

  Future<Response<AnnouncementSingleDto>> getAnnouncementById(int id) async {
    return callDioGet(
      path: '/api/announcements/$id',
      getData: (json) => AnnouncementSingleDto.fromJson(json),
    );
  }

  Future<Response<AnnouncementDeleteResponseDto>> deleteAnnouncementById(int id) async {
    return callDioDelete(
      path: '/api/announcements/$id',
      getData: (json) => AnnouncementDeleteResponseDto.fromJson(json),
    );
  }

  Future<Response<AnnouncementDto>> postAnnouncement(AnnouncementRequestDto request) async {
    return callMultipart(
      path: '/api/announcements',
      method: HttpMethod.post,
      request: request,
      toJson: (r) => r.toJson(),
      extractFiles: (r) => r.photos ?? [],
      fileFieldName: 'photos',
      getData: (json) => AnnouncementDto.fromJson(json),
    );
  }
}

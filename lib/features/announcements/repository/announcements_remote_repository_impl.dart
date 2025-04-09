import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/core/repository/base_repository.dart';
import 'package:home_management/features/announcements/api/announcements_api.dart';
import 'package:home_management/features/announcements/models/announcement_dto.dart';
import 'package:home_management/features/announcements/models/announcement_request_dto.dart';

import 'announcements_remote_repository.dart';

class AnnouncementsRemoteRepositoryImpl with BaseRepository implements AnnouncementsRemoteRepository {
  final AnnouncementsApi _api;

  AnnouncementsRemoteRepositoryImpl({required AnnouncementsApi api}) : _api = api;

  @override
  Future<Either<Failure, List<AnnouncementDto>>> getAnnouncements() {
    return execute(
      getResponse: () => _api.getAnnouncements(),
    );
  }

  @override
  Future<Either<Failure, AnnouncementDto>> getAnnouncementById({required int id}) {
    return execute(getResponse: () => _api.getAnnouncementById(id));
  }

  @override
  Future<Either<Failure, AnnouncementDto>> sendAnnouncement({required AnnouncementRequestDto request}) {
    return execute(getResponse: () => _api.postAnnouncement(request));
  }
}

import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/features/announcements/models/announcement_delete_response_dto.dart';
import 'package:home_management/features/announcements/models/announcement_dto.dart';
import 'package:home_management/features/announcements/models/announcement_request_dto.dart';
import 'package:home_management/features/announcements/models/announcement_single_dto.dart';

abstract interface class AnnouncementsRemoteRepository {
  Future<Either<Failure, List<AnnouncementDto>>> getAnnouncements();

  Future<Either<Failure, AnnouncementSingleDto>> getAnnouncementById({required int id});

  Future<Either<Failure, AnnouncementDeleteResponseDto>> deleteAnnouncementById({required int id});

  Future<Either<Failure, AnnouncementDto>> sendAnnouncement({required AnnouncementRequestDto request});
}

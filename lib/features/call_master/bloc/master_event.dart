part of 'master_bloc.dart';

abstract class CallMasterEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class SelectCategory extends CallMasterEvent {
  final ServiceResponseStoreItemDto category;

  SelectCategory(this.category);
}

class UpdateDetails extends CallMasterEvent {
  final String details;

  UpdateDetails(this.details);

  @override
  List<Object?> get props => [details];
}

class AttachImage extends CallMasterEvent {
  final File image;

  AttachImage(this.image);
}

class LoadCategories extends CallMasterEvent {}

class CallMaster extends CallMasterEvent {}

class CallMasterCheckButtonAvailability extends CallMasterEvent {}

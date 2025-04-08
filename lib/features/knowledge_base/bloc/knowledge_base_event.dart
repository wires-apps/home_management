part of 'knowledge_base_bloc.dart';

abstract class MasterEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class SelectCategory extends MasterEvent {
  final ReportCategory category;

  SelectCategory(this.category);
}

class UpdateDetails extends MasterEvent {
  final String details;

  UpdateDetails(this.details);
}

class AttachImage extends MasterEvent {
  final File image;

  AttachImage(this.image);
}

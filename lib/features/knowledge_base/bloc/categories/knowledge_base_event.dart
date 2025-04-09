part of 'knowledge_base_bloc.dart';

abstract class KnowledgeBaseEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class SelectCategory extends KnowledgeBaseEvent {
  final ReportCategory category;

  SelectCategory(this.category);
}

class UpdateDetails extends KnowledgeBaseEvent {
  final String details;

  UpdateDetails(this.details);
}

class AttachImage extends KnowledgeBaseEvent {
  final File image;

  AttachImage(this.image);
}

class KnowledgeBaseDataLoaded extends KnowledgeBaseEvent {}

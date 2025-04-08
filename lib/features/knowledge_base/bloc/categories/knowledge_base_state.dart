part of 'knowledge_base_bloc.dart';

enum ReportCategory { plumbing, electrical, carpentry, other }

class KnowledgeBaseState extends BaseState {
  final ReportCategory? selectedCategory;
  final String details;
  final File? image;
  final List<KnowledgeBaseCategoryDto>? categories;

  const KnowledgeBaseState({
    this.selectedCategory,
    this.details = '',
    this.image,
    required super.status,
    super.dialogInfo,
    this.categories,
  });

  @override
  KnowledgeBaseState copyWith({
    ReportCategory? selectedCategory,
    String? details,
    File? image,
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    List<KnowledgeBaseCategoryDto>? categories,
  }) =>
      KnowledgeBaseState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        selectedCategory: selectedCategory ?? this.selectedCategory,
        details: details ?? this.details,
        image: image ?? this.image,
        categories: categories ?? this.categories,
      );

  @override
  List<Object?> get props => [
        status,
        dialogInfo,
        selectedCategory,
        details,
        image,
        categories,
      ];
}

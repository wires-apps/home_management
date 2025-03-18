part of 'master_bloc.dart';

enum ReportCategory { plumbing, electrical, carpentry, other }

class MasterState extends BaseState {
  final ReportCategory? selectedCategory;
  final String details;
  final File? image;

  const MasterState({this.selectedCategory, this.details = '', this.image, required super.status, super.dialogInfo});

  @override
  MasterState copyWith({
    ReportCategory? selectedCategory,
    String? details,
    File? image,
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
  }) =>
      MasterState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        selectedCategory: selectedCategory ?? this.selectedCategory,
        details: details ?? this.details,
        image: image ?? this.image,
      );

  @override
  List<Object?> get props => [
        status,
        dialogInfo,
        selectedCategory,
        details,
        image,
      ];
}

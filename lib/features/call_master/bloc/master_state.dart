part of 'master_bloc.dart';

// enum ReportCategory { plumbing, electrical, carpentry, other }

class CallMasterState extends BaseState {
  final ServiceResponseStoreItemDto? selectedCategory;
  final String details;
  final File? image;
  final List<ServiceResponseStoreItemDto>? categories;
  final bool showDialog;
  final bool activeButton;

  const CallMasterState({
    this.selectedCategory,
    this.showDialog = false,
    this.activeButton = false,
    this.categories,
    this.details = '',
    this.image,
    required super.status,
    super.dialogInfo,
  });

  @override
  CallMasterState copyWith({
    String? details,
    File? image,
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    bool? showDialog,
    bool? activeButton,
    ServiceResponseStoreItemDto? selectedCategory,
    List<ServiceResponseStoreItemDto>? categories,
  }) =>
      CallMasterState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        selectedCategory: selectedCategory ?? this.selectedCategory,
        details: details ?? this.details,
        image: image ?? this.image,
        categories: categories ?? this.categories,
        showDialog: showDialog ?? this.showDialog,
        activeButton: activeButton ?? this.activeButton,
      );

  @override
  List<Object?> get props => [
        status,
        dialogInfo,
        selectedCategory,
        details,
        image,
        categories,
        showDialog,
        activeButton,
      ];
}

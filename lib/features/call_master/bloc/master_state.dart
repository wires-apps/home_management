part of 'master_bloc.dart';

class CallMasterState extends BaseState {
  final ServiceResponseStoreItemDto? selectedCategory;
  final String details;
  final File? image;
  final List<ServiceResponseStoreItemDto>? categories;
  final bool hasCalling;
  final bool isButtonEnabled;
  final bool isLoading;

  const CallMasterState({
    this.selectedCategory,
    this.isLoading = false,
    this.hasCalling = false,
    this.isButtonEnabled = false,
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
    bool? hasCalling,
    bool? isLoading,
    bool? isButtonEnabled,
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
        isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
        hasCalling: hasCalling ?? this.hasCalling,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object?> get props => [
        status,
        dialogInfo,
        selectedCategory,
        details,
        image,
        categories,
        isButtonEnabled,
        isLoading,
        hasCalling,
      ];
}

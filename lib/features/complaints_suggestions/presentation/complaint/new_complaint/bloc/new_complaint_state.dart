part of 'new_complaint_bloc.dart';

enum ComplaintPage { newComplaint, complaintDetails, complaints }

class NewComplaintState extends BaseState {
  const NewComplaintState({
    required super.status,
    super.dialogInfo,
    this.image,
    this.page,
    this.complaints,
    this.hasComplaint = false,
    this.isLoading = false,
    this.isButtonEnabled = false,
  });

  final File? image;
  final ComplaintScreenType? page;
  final List<SingleComplaintResponseDto>? complaints;
  final bool hasComplaint;
  final bool isLoading;
  final bool isButtonEnabled;

  @override
  NewComplaintState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    File? image,
    ComplaintScreenType? page,
    bool? hasComplaint,
    bool? isButtonEnabled,
    bool? isLoading,
    List<SingleComplaintResponseDto>? complaints,
  }) =>
      NewComplaintState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        image: image ?? this.image,
        page: page ?? this.page,
        complaints: complaints ?? this.complaints,
        hasComplaint: hasComplaint ?? this.hasComplaint,
        isLoading: isLoading ?? this.isLoading,
        isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        status,
        image,
        page,
        complaints,
        hasComplaint,
        isLoading,
        isButtonEnabled,
      ];
}

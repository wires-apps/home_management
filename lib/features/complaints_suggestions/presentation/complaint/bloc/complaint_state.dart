part of 'complaint_bloc.dart';

enum ComplaintPage { newComplaint, complaintDetails, complaints }

class ComplaintState extends BaseState {
  const ComplaintState({
    required super.status,
    super.dialogInfo,
    this.page,
    this.complaints,
  });

  final ComplaintScreenType? page;
  final List<SingleComplaintResponseDto>? complaints;

  @override
  ComplaintState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    File? image,
    ComplaintScreenType? page,
    List<SingleComplaintResponseDto>? complaints,
  }) =>
      ComplaintState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        page: page ?? this.page,
        complaints: complaints ?? this.complaints,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        status,
        page,
        complaints,
      ];
}

part of 'complaint_details_bloc.dart';

enum ComplaintPage { newComplaint, complaintDetails, complaints }

class ComplaintDetailsState extends BaseState {
  const ComplaintDetailsState({
    required super.status,
    super.dialogInfo,
    this.complaint,
    this.image,
    this.page,
  });

  final File? image;
  final ComplaintScreenType? page;

  final SingleComplaintResponseDto? complaint;

  @override
  ComplaintDetailsState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    File? image,
    ComplaintScreenType? page,
    SingleComplaintResponseDto? complaint,
  }) =>
      ComplaintDetailsState(
        status: status ?? this.status,
        dialogInfo: dialogInfo ?? this.dialogInfo,
        image: image ?? this.image,
        page: page ?? this.page,
        complaint: complaint ?? this.complaint,
      );

  @override
  List<Object?> get props => [
        status,
        image,
        page,
        complaint,
      ];
}

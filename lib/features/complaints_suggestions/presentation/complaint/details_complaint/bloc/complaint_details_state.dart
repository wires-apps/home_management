part of 'complaint_details_bloc.dart';

enum ComplaintPage { newComplaint, complaintDetails, complaints }

class ComplaintDetailsState extends BaseState {
  const ComplaintDetailsState({
    required super.status,
    super.dialogInfo,
    this.image,
    this.page,
  });

  final File? image;
  final ComplaintScreenType ? page;

  @override
  ComplaintDetailsState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    File? image,
    ComplaintScreenType ? page,
  }) =>
      ComplaintDetailsState(
        status: status ?? this.status,
        dialogInfo: dialogInfo ?? this.dialogInfo,
        image: image ?? this.image,
        page: page ?? this.page,
      );

  @override
  List<Object?> get props => [
        status,
        image,
        page,
      ];
}

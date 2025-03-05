part of 'complaint_details_bloc.dart';

enum ComplaintPage { newComplaint, complaintDetails, complaints }

class ComplaintDetailsState extends BaseState {
  const ComplaintDetailsState({
    required super.status,
    this.image,
    this.page,
  });

  final File? image;
  final ComplaintScreenType ? page;

  @override
  ComplaintDetailsState copyWith({
    BaseStatus? status,
    File? image,
    ComplaintScreenType ? page,
  }) =>
      ComplaintDetailsState(
        status: status ?? this.status,
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

part of 'complaint_bloc.dart';

enum ComplaintPage { newComplaint, complaintDetails, complaints }

class ComplaintState extends BaseState {
  const ComplaintState({
    required super.status,
    this.image,
    this.page,
  });

  final File? image;
  final ComplaintScreenType ? page;

  @override
  ComplaintState copyWith({
    BaseStatus? status,
    File? image,
    ComplaintScreenType ? page,
  }) =>
      ComplaintState(
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

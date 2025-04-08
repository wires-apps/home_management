part of 'rules_bloc.dart';

enum ComplaintPage { newComplaint, complaintDetails, complaints }

class RulesState extends BaseState {
  const RulesState({
    required super.status,
    this.image,
    this.page,
  });

  final File? image;
  final ComplaintScreenType? page;

  @override
  RulesState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    File? image,
    ComplaintScreenType? page,
  }) =>
      RulesState(
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

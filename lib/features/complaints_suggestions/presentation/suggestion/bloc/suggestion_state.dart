part of 'suggestion_bloc.dart';

class SuggestionState extends BaseState {
  const SuggestionState({
    required super.status,
    super.dialogInfo,
    this.image,
    this.hasSuggestion = false,
    this.isLoading = false,
    this.isButtonEnabled = false,
  });

  final File? image;
  final bool hasSuggestion;
  final bool isLoading;
  final bool isButtonEnabled;

  @override
  SuggestionState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    File? image,
    bool? hasSuggestion,
    bool? isLoading,
    bool? isButtonEnabled,
  }) =>
      SuggestionState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        image: image ?? this.image,
        hasSuggestion: hasSuggestion ?? this.hasSuggestion,
        isLoading: isLoading ?? this.isLoading,
        isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        status,
        image,
        hasSuggestion,
        isLoading,
        isButtonEnabled,
      ];
}

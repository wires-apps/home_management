part of 'home_bloc.dart';

class HomeState extends BaseState {
  const HomeState({
    this.needToCloseDialog = false,
    this.needToCloseHomePage = false,
    this.hasReachedMax = false,
    this.items = const [],
    this.lastPage = 1,
    this.currentPage = 1,
    required super.status,
    super.dialogInfo,
  });

  final bool needToCloseDialog;
  final bool hasReachedMax;
  final List<DataNotificationResponseDto> items;
  final int lastPage;
  final int currentPage;
  final bool needToCloseHomePage;

  @override
  HomeState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    bool? needToCloseDialog,
    bool? hasReachedMax,
    bool? needToCloseHomePage,
    List<DataNotificationResponseDto>? items,
    int? lastPage,
    int? currentPage,
  }) =>
      HomeState(
        status: status ?? this.status,
        dialogInfo: dialogInfo ?? this.dialogInfo,
        items: items ?? this.items,
        needToCloseDialog: needToCloseDialog ?? this.needToCloseDialog,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        lastPage: lastPage ?? this.lastPage,
        currentPage: currentPage ?? this.currentPage,
        needToCloseHomePage: needToCloseHomePage ?? this.needToCloseHomePage,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        needToCloseDialog,
        items,
        hasReachedMax,
        lastPage,
        currentPage,
        needToCloseHomePage,
      ];
}

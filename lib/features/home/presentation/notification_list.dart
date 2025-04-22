import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/core/ui/app_text_style.dart';
import 'package:home_management/core/widgets/bottom_loader.dart';
import 'package:home_management/features/home/bloc/home_bloc.dart';

class SingleDropdownList extends StatefulWidget {
  const SingleDropdownList({super.key});

  @override
  State<SingleDropdownList> createState() => _SingleDropdownListState();
}

class _SingleDropdownListState extends State<SingleDropdownList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    final bloc = context.read<HomeBloc>();
    _scrollController.addListener(() {
      if (_isBottom) {
        bloc.add(const NotificationsDownload(isFirstFetch: false));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        final items = state.items;

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.72,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              if (state.status.isFailure) {
                return const SizedBox();
              }

              return index >= items.length
                  ? const BottomLoader()
                  : _NotificationItem(
                      mainText: items[index].title,
                      secondText: items[index].message,
                      onTap: () {
                        context.pushRoute(NotificationRoute(id: items[index].id));
                      },
                    );
            },
            itemCount: state.hasReachedMax ? items.length : items.length + 1,
            controller: _scrollController,
          ),
        );
      },
    );
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double currentScroll = _scrollController.offset;

    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _NotificationItem extends StatelessWidget {
  const _NotificationItem({
    required this.mainText,
    required this.secondText,
    required this.onTap,
  });

  final String mainText;
  final String secondText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusColor: Colors.blueAccent,
        splashColor: Colors.green.shade100,
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.c0084EF),
          ),
          child: Column(
            children: [
              Text(
                mainText,
                style: AppTextStyle.style.copyWith(
                  fontSize: 20,
                  color: AppColors.c224795,
                ),
              ),
              Text(
                secondText,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.c2A569A,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

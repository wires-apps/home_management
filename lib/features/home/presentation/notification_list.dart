import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/routes/router.dart';
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
      ///TODO наверно удалить все что ниже
      // buildWhen: (HomeState previous, HomeState current) =>
      /*     previous.items != current.items ||
          previous.status != current.status ||
          // previous.itemsIsEmptyFromJson != current.itemsIsEmptyFromJson*/
      builder: (BuildContext context, HomeState state) {
        final bloc = context.read<HomeBloc>();
        final items = state.items;

        // if (state.items.isEmpty && state.status.isSuccess) return SizedBox();

        // if (items.isEmpty && !state.status.isFailure) {
        //   return const Loader();
        // }

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.44,
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
          ),
          child: Column(
            children: [
              Text(
                mainText,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              Text(secondText, style: const TextStyle(fontSize: 16, color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}

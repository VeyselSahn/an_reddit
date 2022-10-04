import 'package:an_reddit/screen/main_page/component/post_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodel/main_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // ilk req için
    // ignore: prefer_const_constructors
    context.read<MainBloc>().add(AddPosts(posts: const []));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<MainBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverAppBar(pinned: false),
          CupertinoSliverRefreshControl(
            onRefresh: () async => viewModel.add(const AddPosts(posts: [])),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return PostTileWidget(index: index);
            }, childCount: viewModel.state.posts.length),
          ),
        ],
      ),
    );
  }
}

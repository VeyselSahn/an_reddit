import 'package:an_reddit/screen/main_page/model/post_model.dart';
import 'package:an_reddit/screen/main_page/viewmodel/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostTileWidget extends StatelessWidget {
  final int index;
  const PostTileWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<MainBloc>();
    // model tanımlanıyor
    var postModel = viewModel.state.posts.elementAt(index);
    return ExpansionTile(
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [Icon(Icons.keyboard_arrow_down_outlined)],
        ),
        tilePadding: const EdgeInsets.all(8),
        childrenPadding: const EdgeInsets.all(8),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            tileUserWidget(postModel),
            const SizedBox(
              height: 10,
            ),
            tilePostWidget(postModel),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
        children: expansionChildrenWidgets(postModel, viewModel));
  }

  Row tileUserWidget(PostModel postModel) {
    return Row(
      children: [
        const CircleAvatar(radius: 15),
        const SizedBox(
          width: 10,
        ),
        Text(postModel.author ?? '')
      ],
    );
  }

  Row tilePostWidget(PostModel postModel) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text(postModel.title ?? '')),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 1,
          child: Image.network(
            postModel.thumbnail ?? '',
            errorBuilder: (context, error, stackTrace) => const FlutterLogo(),
          ),
        )
      ],
    );
  }

  List<Widget> expansionChildrenWidgets(
      PostModel postModel, MainBloc viewModel) {
    return [
      Text(
        postModel.description ?? '',
      ),
      const SizedBox(
        height: 10,
      ),
      ElevatedButton.icon(
          onPressed: () {
            viewModel.launchUrl(postModel.url ?? '');
          },
          icon: const Icon(Icons.travel_explore),
          label: const Text('Go to resource'))
    ];
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/core_shelf.dart';
import '../model/post_model.dart';
import 'package:url_launcher/url_launcher.dart' as urllaunch;

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<AddPosts>(_onFetchPosts);
  }

  void _onFetchPosts(AddPosts event, Emitter<MainState> emit) async {
    String params = _prepareParams();
    // postları çekme isteğini gönderiyoruz
    var response = await ApiService.instance.getRequest(
        endPoint: ApiConstants.instance.fetchPostEndPoint, params: params);

    var postList = response['data']['children'];
    if (response != null && postList != null) {
      // model listesini oluşturuyoruz
      List<PostModel> newPosts = [];
      for (var i = 0; i < postList.length; i++) {
        newPosts.add(PostModel.fromJson(postList[i]['data']));
      }

      // model yapmak yerine böyle kullanabiliriz
      var afterPost = response['data']['before'];
      return emit(state.copyWith(posts: newPosts, afterPost: afterPost));
    }
  }

  // parametreleri hazırlıyoruz
  String _prepareParams() {
    String params = '';

    // count
    params += '?count=20';
    // after
    params += (state.afterPost == '') ? '' : '&after=${state.afterPost}';
    return params;
  }

  Future launchUrl(String url) async {
    await urllaunch.launchUrl(Uri.parse(url));
  }
}

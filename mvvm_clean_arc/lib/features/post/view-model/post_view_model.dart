import 'dart:html';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_clean_arc/features/post/model/post.dart';
part 'post_view_model.g.dart';

class PostViewModel= _PostViewModelBase with _$PostViewModel;

abstract class _PostViewModelBase with Store{
  @observable
  List<Post> posts = [];
  
  final url = "https://jsonplaceholder.typicode.com/posts";

  @observable
  bool isServiceRequestLoading = false;

  @action
  Future<void> getAllPost() async{
    changeRequest();
    final response = await Dio().get(url);
    
    if( response.statusCode == HttpStatus.ok){
      final responseData = response.data as List<Map>;
      posts = responseData.map((e) => Post.fromMap(e)).toList();
    }
    changeRequest();
  }

  @action
  void changeRequest(){
    isServiceRequestLoading = !isServiceRequestLoading;
  }
}
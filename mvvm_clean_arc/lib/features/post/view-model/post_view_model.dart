import 'dart:html';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_clean_arc/features/post/model/post.dart';
part 'post_view_model.g.dart';

class PostViewModel= _PostViewModelBase with _$PostViewModel;

abstract class _PostViewModelBase with Store{
  @observable
  List<Post> posts = [];
  
  final url = "https://jsonplaceholder.typicode.com/posts";

  @action
  Future<void> getAllPost() async{
    final response = await Dio().get(url);
    
    if( response.statusCode == HttpStatus.ok){
      print(response.data);
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm_clean_arc/features/post/view-model/post_view_model.dart';

class PostView extends StatelessWidget {
  //const PostView({super.key});

  final _viewModel = PostViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _viewModel.getAllPost();
        },
      ),
      body: Center(
       //!!!!!34.dakika 
      ),
    );
  }
}

AppBar buildAppBar(){
  final _viewModel = PostViewModel();

  return AppBar(
    title: Text("vb10"),
    leading: Observer(builder: (_){
      return Visibility(
        visible:  _viewModel.isServiceRequestLoading,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }),
  );
}
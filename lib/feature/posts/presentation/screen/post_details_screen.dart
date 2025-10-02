import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/shared/arrow_back_widget.dart';
import 'package:qabilati/feature/posts/data/model/posts_model.dart';
import 'package:qabilati/feature/posts/presentation/widget/card_single_post_widget.dart';
import 'package:qabilati/generated/l10n.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ArrowBackWidget(),
        centerTitle: true,
        title: Text(S.of(context).post_details),
      ),
      body: CustomBody(post: post),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 17.0.h),
      child: Column(children: [CardSinglePostWidget(post: post)]),
    );
  }
}

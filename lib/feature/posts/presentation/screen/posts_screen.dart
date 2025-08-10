import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/feature/posts/presentation/cubit/posts_cubit.dart';
import 'package:qabilati/feature/posts/presentation/widget/card_posts.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<PostsCubit>()..getAllPosts(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.0.w, vertical: 13.0.h),
          child: CustomBody(),
        ),
      ),
    );
  }
}

class CustomBody extends StatefulWidget {
  const CustomBody({super.key});

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        final cubit = getIt<PostsCubit>();
        if (cubit.isPagination) {
          cubit.pagination();
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is PostsSuccess) {
          return Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: state.post.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (index < state.post.length - 1) {
                  return CardPosts(
                    username: state.post[index].userName.toString(),
                    post: state.post[index].postText.toString(),
                    image: state.post[index].userImage.toString(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(color: ColorApp.coral),
                  );
                }
              },
            ),
          );
        } else if (state is PostsLoading) {
          return Center(
            child: CircularProgressIndicator(color: ColorApp.coral),
          );
        }
        return Text("لا يوجد بيانات");
      },
    );
  }
}

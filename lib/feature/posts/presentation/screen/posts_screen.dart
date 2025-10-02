import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/skeletonizer_loading_widget.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/feature/posts/presentation/cubit/posts_cubit.dart';
import 'package:qabilati/feature/posts/presentation/screen/post_details_screen.dart';
import 'package:qabilati/feature/posts/presentation/widget/card_posts.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    scrollListener();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      buildWhen:
          (previous, current) =>
              current is PostsSuccess ||
              current is PostsLoading ||
              current is PostsError,
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is PostsLoading,
          child:
              state is PostsSuccess
                  ? ListView.builder(
                    controller: scrollController,
                    itemCount:
                        state.isPagination
                            ? state.post.length + 1
                            : state.post.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index < state.post.length) {
                        return CardPosts(
                          username: state.post[index].userName.toString(),
                          post: state.post[index].postContent.toString(),
                          image: state.post[index].userImage.toString(),
                          onTap: () {
                            context.push(
                              PostDetailsScreen(post: state.post[index]),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorApp.coral,
                          ),
                        );
                      }
                    },
                  )
                  : SkeletonizerLoadingWidget(),
        );
      },
    );
  }

  void scrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 100) {
        final cubit = getIt<PostsCubit>();
        if (!cubit.isLoadingMore && cubit.hasMoreData) {
          cubit.getPaginationPosts();
        }
      }
    });
  }
}

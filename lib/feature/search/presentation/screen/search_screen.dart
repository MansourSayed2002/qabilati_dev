import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/model/friends_model.dart';
import 'package:qabilati/core/shared/arrow_back_widget.dart';
import 'package:qabilati/core/shared/custom_text_from_global.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/feature/search/presentation/cubit/search_cubit.dart';
import 'package:qabilati/feature/search/presentation/widget/friend_card_widget.dart';
import 'package:qabilati/generated/l10n.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController valueSearch = TextEditingController();
  @override
  void dispose() {
    valueSearch.dispose();
    getIt<SearchCubit>().data.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SearchCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: ArrowBackWidget(),
          title: Text(S.of(context).search),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              CustomTextFormGlobal(
                controller: valueSearch,
                hinttext: S.of(context).search,
                onChanged: (value) {
                  getIt<SearchCubit>().clearData(value);
                },
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    getIt<SearchCubit>().searching(valueSearch.text);
                  },
                ),
              ),
              Gap(10.h),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    return state is SearchLoading
                        ? Center(
                          child: CircularProgressIndicator(
                            color: ColorApp.coral,
                          ),
                        )
                        : state is SearchSuccess
                        ? ListView.separated(
                          itemCount: getIt<SearchCubit>().data.length,
                          separatorBuilder:
                              (context, index) => Divider(
                                color:
                                    Theme.of(
                                      context,
                                    ).appBarTheme.iconTheme?.color,
                                indent: 10.0.w,
                                endIndent: 10.0.w,
                              ),
                          itemBuilder: (context, index) {
                            FriendsModel person = FriendsModel.fromJson(
                              getIt<SearchCubit>().data[index],
                            );
                            return FriendCardWidget(person: person);
                          },
                        )
                        : state is SearchError
                        ? Text("Error")
                        : SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/feature/friends/presentation/cubit/friend_cubit.dart';
import 'package:qabilati/feature/friends/presentation/widget/cards_ships.dart';
import 'package:qabilati/feature/friends/presentation/widget/contacts_with_qabilati.dart';
import 'package:qabilati/feature/friends/presentation/widget/my_friends_widget.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FriendsCubit>()..getFriend(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [CardsShips(), ContactsWithQabilati(), MyFriendsWidget()],
          ),
        ),
      ),
    );
  }
}

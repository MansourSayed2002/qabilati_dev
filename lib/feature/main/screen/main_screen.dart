import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qabilati/core/constants/image_app.dart';
import 'package:qabilati/core/function/choose_image_bar.dart';
import 'package:qabilati/feature/chats/presentation/screen/chats_screen.dart';
import 'package:qabilati/feature/friends/presentation/screen/friend_screen.dart';
import 'package:qabilati/feature/main/widget/leading_buttom_bar.dart';
import 'package:qabilati/feature/posts/presentation/screen/posts_screen.dart';
import 'package:qabilati/feature/profile/presentation/screen/me_screen.dart';
import 'package:qabilati/generated/l10n.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    ChatsScreen(),
    FriendScreen(),
    PostsScreen(),
    MeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          currentIndex == 0
              ? S.of(context).chats
              : currentIndex == 1
              ? S.of(context).friends
              : currentIndex == 2
              ? S.of(context).post
              : S.of(context).me,
        ),
        leading: currentIndex != 3 ? LeadingButtomBar() : SizedBox(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              chooseImageBar(ImageApp.chatslight, ImageApp.chatsdark),
            ),
            activeIcon: SvgPicture.asset(ImageApp.chatsfill),
            label: S.of(context).chats,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              chooseImageBar(ImageApp.friend2, ImageApp.friend3),
            ),
            activeIcon: SvgPicture.asset(ImageApp.friend1),
            label: S.of(context).friends,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_outlined),
            activeIcon: Icon(Icons.photo),
            label: S.of(context).post,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              chooseImageBar(ImageApp.profile2, ImageApp.profile3),
            ),
            activeIcon: SvgPicture.asset(ImageApp.profile1),
            label: S.of(context).me,
          ),
        ],
      ),
      body: screens.elementAt(currentIndex),
    );
  }
}

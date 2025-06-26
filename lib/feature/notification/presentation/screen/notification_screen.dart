import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/arrow_back_widget.dart';
import 'package:qabilati/feature/notification/data/model/notifi_model.dart';
import 'package:qabilati/feature/notification/presentation/cubit/notifications_cubit.dart';
import 'package:qabilati/feature/notification/presentation/widget/card_notifi_widget.dart';
import 'package:qabilati/generated/l10n.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<NotificationsCubit>()..getNotification(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(S.of(context).notification),
          leading: ArrowBackWidget(),
        ),
        body: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            var cubit = context.read<NotificationsCubit>();
            return state is NotificationsLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                  separatorBuilder: (context, index) => Gap(10.0.h),
                  itemCount: cubit.notifications.length,
                  itemBuilder: (context, index) {
                    var notifications = NotifiModel.fromJson(
                      cubit.notifications[index],
                    );
                    return notifications.notifiType == 1
                        ? CardNotifiRequestWidget(
                          image: notifications.image.toString(),
                          title: notifications.notifiContent.toString(),
                          acceptFriendOnTap: () {
                            cubit.acceptFriend(
                              notifications.notifiId!,
                              notifications.notifiSender!,
                              notifications.notifiReceiver!,
                            );
                          },
                          rejectFriendOnTap: () {
                            cubit.rejectFriend(
                              notifications.notifiId!,
                              notifications.notifiSender!,
                              notifications.notifiReceiver!,
                            );
                          },
                        )
                        : CardNotifiWidget(
                          image: notifications.image.toString(),
                          subtitle: notifications.notifiTitle.toString(),
                          title: notifications.notifiContent.toString(),
                        );
                  },
                );
          },
        ),
      ),
    );
  }
}

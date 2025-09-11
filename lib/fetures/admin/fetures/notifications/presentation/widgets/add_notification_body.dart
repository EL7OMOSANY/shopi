import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/notification_cubit/cubit/notification_cubit.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/widgets/add_notification_item.dart';
import 'package:shopi/fetures/admin/fetures/notifications/presentation/widgets/create/create_notification.dart';

class AddNotificationBody extends StatelessWidget {
  const AddNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        children: [
          // create notification title
          const CreateNotification(),
          //get all notifications
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                SliverToBoxAdapter(
                  child: BlocBuilder<NotificationCubit, NotificationState>(
                    builder: (context, state) {
                      return state is GetAllNotificationLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : ListView.separated(
                              itemCount: cubit.notificationList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  child: ScaleAnimation(
                                    duration: const Duration(milliseconds: 500),
                                    child: FadeInAnimation(
                                      child: AddNotificationItem(
                                        notificationModel:
                                            cubit.notificationList[index],
                                        index: index,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 15.h),
                            );
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20.h)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:book_store_manager/screens/notification/views/notification_item.dart';

import 'empty_page.dart';
import 'package:book_store_manager/widgets/loading/loading_list.dart';

import '../bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const LoadingList();
        }

        if (state.notis.isEmpty) {
          return const EmptyNotificationPage();
        }

        DateTime now = DateTime.now();
        return ListView.builder(
          itemCount: state.notis.length,
          itemBuilder: (context, index) {
            return NotificationItem(
              notiModel: state.notis[index],
              nowTime: now,
            );
          },
        );
      },
    );
  }
}

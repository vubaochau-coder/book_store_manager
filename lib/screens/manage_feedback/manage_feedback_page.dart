import 'package:book_store_manager/constant/app_icons.dart';
import 'package:book_store_manager/repositories/repository.dart';
import 'package:book_store_manager/screens/feedback_hide/feedback_hide_page.dart';
import 'package:book_store_manager/widgets/empty_feedback_list.dart';
import 'package:book_store_manager/widgets/loading/loading_list.dart';
import 'package:book_store_manager/widgets/page_route_transition.dart';
import 'bloc/feedback_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/feedback_item.dart';
import 'package:book_store_manager/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ManageFeedbackPage extends StatelessWidget {
  const ManageFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedbackBloc(
        RepositoryProvider.of<AppRepository>(context).feedbackRepository,
      )..add(FeedbackLoadEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Đánh giá của khách hàng',
          imgBg: AppIcons.feedbackFill,
          color: Colors.orangeAccent[700]!,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  Text(
                    'Gần đây',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.orangeAccent[700],
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteSlideTransition(
                          child: const FeedbackHidePage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Xem các đánh giá bị ẩn',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<FeedbackBloc, FeedbackState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const LoadingList();
                  }

                  if (state.feedback.isEmpty) {
                    return const EmptyFeedbackList();
                  }

                  DateTime nowTime = DateTime.now();
                  return ListView.builder(
                    itemCount: state.feedback.length,
                    padding: const EdgeInsets.only(top: 6),
                    itemBuilder: (context, index) {
                      return FeedbackItem(
                        feedback: state.feedback[index],
                        now: nowTime,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

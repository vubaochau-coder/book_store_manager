import 'package:book_store_manager/extensions/datetime_ex.dart';
import 'package:book_store_manager/models/feedback_model.dart';
import 'package:book_store_manager/utils/converter.dart';
import 'reply_bottom_sheet.dart';
import '../bloc/feedback_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class FeedbackItem extends StatelessWidget {
  final FeedbackModel feedback;
  final DateTime now;

  const FeedbackItem({super.key, required this.feedback, required this.now});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60 + 16,
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(feedback.userAvatar),
              ),
            ),
          ),
          const Gap(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  TextSpan(
                    text: feedback.userName,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                      color: feedback.isRead ? Colors.grey : Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: ' đã đánh giá ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: feedback.isRead ? Colors.grey : Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '${feedback.rating.toStringAsFixed(0)} sao',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: feedback.isRead ? Colors.grey : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(2),
                ExpandableText(
                  feedback.review,
                  expandText: 'Xem thêm',
                  collapseText: 'Ẩn bớt',
                  maxLines: 1,
                  linkColor: Colors.blue,
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: feedback.isRead ? Colors.grey : Colors.black,
                  ),
                ),
                if (feedback.isReply)
                  Column(
                    children: [
                      const Gap(4),
                      Text.rich(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        TextSpan(
                          text: 'Shop: ',
                          style: const TextStyle(
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: feedback.adminReply,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue[300]!,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                Row(
                  children: [
                    Text(
                      feedback.dateSubmit.displayTimeAgoFrom(now),
                      style: TextStyle(
                        fontSize: 12,
                        color: feedback.isRead ? Colors.grey : Colors.blue,
                        fontWeight: feedback.isRead
                            ? FontWeight.normal
                            : FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    if (feedback.isReply == false)
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            builder: (newContext) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(newContext)
                                      .viewInsets
                                      .bottom,
                                ),
                                child: ReplyBottomSheet(feedback: feedback),
                              );
                            },
                          ).then((value) {
                            if (value != null) {
                              value as Map<String, String>;

                              context.read<FeedbackBloc>().add(
                                    FeedbackReplyEvent(
                                      feedbackId: feedback.id,
                                      reply: cvToString(value['reply']),
                                    ),
                                  );
                            }
                          });
                        },
                        style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        icon: const Icon(Icons.reply_outlined, size: 16),
                      ),
                    IconButton(
                      onPressed: () {
                        context.read<FeedbackBloc>().add(
                              FeedbackLikeEvent(
                                feedbackId: feedback.id,
                                isLike: !feedback.isLiked,
                              ),
                            );
                      },
                      style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      icon: Icon(
                        feedback.isLiked
                            ? Icons.thumb_up
                            : Icons.thumb_up_alt_outlined,
                        color: feedback.isLiked ? Colors.blue : null,
                        size: 16,
                      ),
                    ),
                    PopupMenuButton(
                      icon: const Icon(Icons.more_horiz, size: 16),
                      padding: EdgeInsets.zero,
                      position: PopupMenuPosition.under,
                      color: Colors.black.withOpacity(0.8),
                      elevation: 0,
                      offset: const Offset(0, -4),
                      surfaceTintColor: Colors.white,
                      onSelected: (value) {
                        if (value == 1) {
                          context.read<FeedbackBloc>().add(
                                FeedbackReadEvent(
                                  feedbackId: feedback.id,
                                  isRead: !feedback.isRead,
                                ),
                              );
                        } else if (value == 2) {
                          context
                              .read<FeedbackBloc>()
                              .add(FeedbackHideEvent(feedbackId: feedback.id));
                        }
                      },
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: 1,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            height: 32,
                            child: Text(
                              feedback.isRead
                                  ? 'Đánh dấu là chưa đọc'
                                  : 'Đánh dấu là đã đọc',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 2,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            height: 32,
                            child: Text(
                              'Ẩn bình luận',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

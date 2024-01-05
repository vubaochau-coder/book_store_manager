part of 'feedback_bloc.dart';

sealed class FeedbackEvent extends Equatable {
  const FeedbackEvent();

  @override
  List<Object> get props => [];
}

class FeedbackLoadEvent extends FeedbackEvent {
  final ManageFeedbackType type;

  const FeedbackLoadEvent({required this.type});
}

class FeedbackLikeEvent extends FeedbackEvent {
  final String feedbackId;
  final bool isLike;

  const FeedbackLikeEvent({required this.feedbackId, required this.isLike});
}

class FeedbackReadEvent extends FeedbackEvent {
  final String feedbackId;
  final bool isRead;

  const FeedbackReadEvent({required this.feedbackId, required this.isRead});
}

class FeedbackHideEvent extends FeedbackEvent {
  final String feedbackId;

  const FeedbackHideEvent({required this.feedbackId});
}

class FeedbackReplyEvent extends FeedbackEvent {
  final String feedbackId;
  final String reply;

  const FeedbackReplyEvent({required this.feedbackId, required this.reply});
}

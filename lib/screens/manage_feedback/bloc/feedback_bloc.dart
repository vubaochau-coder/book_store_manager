import 'package:bloc/bloc.dart';
import 'package:book_store_manager/models/feedback_model.dart';
import 'package:book_store_manager/repositories/feedback_repository.dart';
import 'package:book_store_manager/utils/dialog_utils.dart';
import 'package:equatable/equatable.dart';

import '../../../constant/enum.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final FeedbackRepository _feedbackRepository;

  FeedbackBloc(this._feedbackRepository) : super(const FeedbackState()) {
    on<FeedbackLoadEvent>(_onLoad);
    on<FeedbackLikeEvent>(_onLike);
    on<FeedbackReadEvent>(_onRead);
    on<FeedbackHideEvent>(_onHide);
    on<FeedbackReplyEvent>(_onReply);
  }

  _onLoad(FeedbackLoadEvent event, Emitter emit) async {
    if (event.type != state.type) {
      emit(state.copyWith(isLoading: true, type: event.type));

      final feedbacks = await _feedbackRepository.getFeedback(event.type);
      feedbacks.sort((a, b) => b.dateSubmit.compareTo(a.dateSubmit));

      emit(state.copyWith(isLoading: false, feedback: feedbacks));
    }
  }

  _onLike(FeedbackLikeEvent event, Emitter emit) async {
    DialogUtils.showLoading();
    await _feedbackRepository.likeFeedback(event.feedbackId, event.isLike);

    int index =
        state.feedback.indexWhere((element) => element.id == event.feedbackId);
    if (index != -1) {
      List<FeedbackModel> newState = List.from(state.feedback);
      newState[index] = FeedbackModel(
        id: newState[index].id,
        userId: newState[index].userId,
        bookId: newState[index].bookId,
        review: newState[index].review,
        rating: newState[index].rating,
        isRead: newState[index].isRead,
        isLiked: event.isLike,
        isHide: newState[index].isHide,
        isReply: newState[index].isReply,
        adminReply: newState[index].adminReply,
        dateSubmit: newState[index].dateSubmit,
        userName: newState[index].userName,
        userAvatar: newState[index].userAvatar,
      );

      emit(state.copyWith(feedback: newState));
    }
    DialogUtils.hideLoading();
  }

  _onRead(FeedbackReadEvent event, Emitter emit) async {
    DialogUtils.showLoading();
    await _feedbackRepository.readFeedback(event.feedbackId, event.isRead);

    int index =
        state.feedback.indexWhere((element) => element.id == event.feedbackId);
    if (index != -1) {
      List<FeedbackModel> newState = List.from(state.feedback);
      newState.removeAt(index);

      emit(state.copyWith(feedback: newState));
    }
    DialogUtils.hideLoading();
  }

  _onHide(FeedbackHideEvent event, Emitter emit) async {
    DialogUtils.showLoading();
    await _feedbackRepository.hideFeedback(event.feedbackId, true);

    int index =
        state.feedback.indexWhere((element) => element.id == event.feedbackId);
    if (index != -1) {
      List<FeedbackModel> newState = List.from(state.feedback);
      newState.removeAt(index);

      emit(state.copyWith(feedback: newState));
    }
    DialogUtils.hideLoading();
  }

  _onReply(FeedbackReplyEvent event, Emitter emit) async {
    DialogUtils.showLoading();
    await _feedbackRepository.replyFeedback(event.feedbackId, event.reply);

    int index =
        state.feedback.indexWhere((element) => element.id == event.feedbackId);
    if (index != -1) {
      List<FeedbackModel> newState = List.from(state.feedback);
      newState[index] = FeedbackModel(
        id: newState[index].id,
        userId: newState[index].userId,
        bookId: newState[index].bookId,
        review: newState[index].review,
        rating: newState[index].rating,
        isRead: newState[index].isRead,
        isLiked: newState[index].isLiked,
        isHide: newState[index].isHide,
        isReply: true,
        adminReply: event.reply,
        dateSubmit: newState[index].dateSubmit,
        userName: newState[index].userName,
        userAvatar: newState[index].userAvatar,
      );

      emit(state.copyWith(feedback: newState));
    }
    DialogUtils.hideLoading();
  }
}

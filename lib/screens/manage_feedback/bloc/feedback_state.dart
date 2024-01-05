part of 'feedback_bloc.dart';

class FeedbackState extends Equatable {
  final bool isLoading;
  final List<FeedbackModel> feedback;
  final ManageFeedbackType? type;

  const FeedbackState({
    this.isLoading = true,
    this.feedback = const [],
    this.type,
  });

  @override
  List<Object?> get props => [isLoading, feedback, type];

  FeedbackState copyWith({
    bool? isLoading,
    List<FeedbackModel>? feedback,
    ManageFeedbackType? type,
  }) {
    return FeedbackState(
      isLoading: isLoading ?? this.isLoading,
      feedback: feedback ?? this.feedback,
      type: type ?? this.type,
    );
  }
}

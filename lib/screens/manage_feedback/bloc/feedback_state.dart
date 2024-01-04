part of 'feedback_bloc.dart';

class FeedbackState extends Equatable {
  final bool isLoading;
  final List<FeedbackModel> feedback;

  const FeedbackState({
    this.isLoading = true,
    this.feedback = const [],
  });

  @override
  List<Object?> get props => [isLoading, feedback];

  FeedbackState copyWith({
    bool? isLoading,
    List<FeedbackModel>? feedback,
  }) {
    return FeedbackState(
      isLoading: isLoading ?? this.isLoading,
      feedback: feedback ?? this.feedback,
    );
  }
}

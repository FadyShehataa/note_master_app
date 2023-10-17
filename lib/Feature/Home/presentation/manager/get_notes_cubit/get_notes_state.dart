part of 'get_notes_cubit.dart';

sealed class GetNotesState extends Equatable {
  const GetNotesState();

  @override
  List<Object> get props => [];
}

final class GetNotesInitial extends GetNotesState {}

// final class GetNotesLoading extends GetNotesState {}

// final class GetNotesSuccess extends GetNotesState {}

// final class GetNotesFailure extends GetNotesState {
//   final String message;

//   const GetNotesFailure({required this.message});
// }

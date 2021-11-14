import 'event.dart';

class ErrorState {
  final Event event;
  final String title;
  final String message;

  ErrorState({required this.event, required this.title, required this.message});
}

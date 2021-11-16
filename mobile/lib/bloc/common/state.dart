import 'event.dart';

/// custom error management system
class ErrorState {
  final Event event;
  final String title;
  final String message;

  ErrorState({required this.event, required this.title, required this.message});
}

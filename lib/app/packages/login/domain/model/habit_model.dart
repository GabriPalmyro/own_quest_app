import 'package:equatable/equatable.dart';

class Habit extends Equatable {
  const Habit({
    required this.id,
    required this.title,
    required this.createdAt,
  });

  final String id; 
  final String title; 
  final String createdAt; 

  @override
  List<Object?> get props => [id, title, createdAt];
}

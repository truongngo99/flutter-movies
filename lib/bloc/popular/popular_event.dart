import 'package:equatable/equatable.dart';

abstract class PopularEvent extends Equatable {
  const PopularEvent();
}

class PopularEventStart extends PopularEvent {
  const PopularEventStart();
  @override
  List<Object> get props => [];
}

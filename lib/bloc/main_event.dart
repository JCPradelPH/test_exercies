part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object?> get props => [];
}

class OnIncrementCounter extends MainEvent {
  final int newCounter;
  const OnIncrementCounter({required this.newCounter});
}

class OnChangeColor extends MainEvent {
  final Color color;
  const OnChangeColor(this.color);
}

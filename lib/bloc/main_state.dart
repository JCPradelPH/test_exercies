part of 'main_bloc.dart';
abstract class MainState extends Equatable{
  final int counter;
  final Color color;
  const MainState({
    this.counter = 0,
    this.color = Colors.blue,
  });
  
  @override
  List<Object?> get props => [];
}

class InitialState extends MainState {
  const InitialState();
}

class CounterState extends MainState {
  const CounterState({
    required super.counter
  });
}

class ButtonColorState extends MainState {
  const ButtonColorState({
    required super.color,
  });
}
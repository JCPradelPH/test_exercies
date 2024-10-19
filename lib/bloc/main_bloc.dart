import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState>{
  MainBloc() : super(const InitialState()) {
    on<OnIncrementCounter>(_onIncrementCounter);
    on<OnChangeColor>(_onChangeColor);
  }

  void _onIncrementCounter(
    OnIncrementCounter event,
    Emitter<MainState> emit
  ) {
    emit(const InitialState());
    int counter = event.newCounter;
    log('_onIncrementCounter: $counter');
    emit(CounterState(counter: counter));
  }

  void _onChangeColor(
    OnChangeColor event,
    Emitter<MainState> emit
  ) {
    emit(const InitialState());
    
    emit(ButtonColorState(color: event.color));
  }

}
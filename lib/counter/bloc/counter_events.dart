import 'package:equatable/equatable.dart';

abstract class CounterEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class IncreamentCounter extends CounterEvents {}

class DecreamentCounter extends CounterEvents {}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'teste_event.dart';
part 'teste_state.dart';

class TesteBloc extends Bloc<TesteEvent, TesteState> {
  TesteBloc() : super(TesteInitial()) {
    on<TesteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {

  PortfolioBloc() {
    this.add(const RequestLoadEvent());
  }

  @override
  PortfolioState get initialState => const InitialPortfolioState();

  @override
  Stream<PortfolioState> mapEventToState(PortfolioEvent event) async* {
    if (event is RequestLoadEvent) {
      yield const LoadingPortfolioState();
      try {
        final result = event.invoke();
        yield SuccessPortfolioState(await result);
      } catch (e) {
        yield ErrorPortfolioState(e);
      }
    }
  }
}

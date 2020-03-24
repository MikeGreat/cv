import 'package:cv/ui/page/portfolio/data/response.dart';
import 'package:equatable/equatable.dart';

abstract class PortfolioState extends Equatable {
  const PortfolioState();
  @override
  List<Object> get props => [];
}

class InitialPortfolioState extends PortfolioState {
  const InitialPortfolioState();
}

class LoadingPortfolioState extends PortfolioState {
  const LoadingPortfolioState();
}

class SuccessPortfolioState extends PortfolioState {

  final List<Repository> data;

  SuccessPortfolioState(this.data);

}

class ErrorPortfolioState extends PortfolioState {
  final e;
  ErrorPortfolioState(this.e);
}

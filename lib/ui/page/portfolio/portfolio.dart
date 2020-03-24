import 'package:cv/ui/page/portfolio/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocBuilder<PortfolioBloc, PortfolioState>(
            bloc: PortfolioBloc(),
            builder: (context, state) {
              if (state is SuccessPortfolioState) {
                return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, pos) {
                      final item = state.data[pos];
                      return ListTile(
                        leading: Icon(Icons.ac_unit),
                        title: Text(item.name ?? ""),
                        subtitle: Text(item.description ?? ""),
                      );
                    });
              } else if (state is ErrorPortfolioState) {
                return Center(child: Text("Error"));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}

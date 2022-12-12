import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto__/pages/home/bloc/home_state.dart';

import 'home/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  HomeBloc? bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<HomeBloc, HomeState>(
            bloc: BlocProvider.of<HomeBloc>(context),
            builder: (context, state) {
              if (state is HomeStateLoaded) {
                return ListView.builder(
                  itemCount: 50,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text("Item $index"),
                    );
                  }),
                );
              }

              if (state is HomeErrorState) {
                return Center(
                  child: Text(state.message),
                );
              }

              if (state is HomeStateEmptyList) {
                return const Center(
                  child: Text("não há dados disponíveis."),
                );
              }

              return const Center(child: CircularProgressIndicator());
            }));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto__/features/produtos/bloc/produto_bloc_bloc.dart';
import 'package:projeto__/features/produtos/models/produto.dart';
import 'package:projeto__/features/produtos/page/produto_page.dart';
import 'package:projeto__/pages/home/bloc/home_bloc.dart';
import 'package:projeto__/pages/home/bloc/home_event.dart';
import 'package:projeto__/pages/home/bloc/home_state.dart';
import 'package:projeto__/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: BlocProvider<ProdutoBlocBloc>(
        create: (BuildContext context) => ProdutoBlocBloc(),
        child: ProdutoPage()
      ) /* BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc(HomeLoadingState())..add(HomeFetchListWithError()),
        child: HomePage()
      ), */
    );
  }
}
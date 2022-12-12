import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto__/features/produtos/bloc/produto_bloc_bloc.dart';

class ProdutoPage extends StatelessWidget {
  ProdutoPage({super.key});
  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ProdutoBlocBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: _formKey,
          child: BlocBuilder<ProdutoBlocBloc, ProdutoBlocState>(
              bloc: bloc,
              builder: (context, state) {
                var stateProduto = (state as ProdutoDefaultState);
                var produto = stateProduto.produto;
                return ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(hintText: "Nome"),
                      onChanged: ((name) {
                        print("SEU NOME $name");
                        bloc.add(ProdutoEventUpdate(name: name));
                      }),
                    ),
                    TextFormField(
                        decoration:
                            const InputDecoration(hintText: "Categoria"),
                        onChanged: ((category) =>
                            bloc.add(ProdutoEventUpdate(category: category)))),
                    TextFormField(
                        decoration: const InputDecoration(hintText: "Imagem"),
                        onChanged: ((image) =>
                            bloc.add(ProdutoEventUpdate(image: image)))),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(hintText: "Valor"),
                        onChanged: ((value) => bloc.add(
                            ProdutoEventUpdate(value: double.parse(value))))),
                    TextFormField(
                        decoration:
                            const InputDecoration(hintText: "Código de barras"),
                        onChanged: ((code) =>
                            bloc.add(ProdutoEventUpdate(barCode: code)))),
                    Column(
                      children: [
                        Text(produto.name),
                        Text(produto.category),
                        Text(produto.image),
                        Text("valor: ${produto.value}"),
                        Text(produto.barCode),
                      ],
                    )
                  ],
                );
              })),
    );
  }
}

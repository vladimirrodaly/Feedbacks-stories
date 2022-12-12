part of 'produto_bloc_bloc.dart';

abstract class ProdutoBlocState {
  const ProdutoBlocState();

 /*  @override
  List<Object> get props => []; */
}

class ProdutoBlocInitial extends ProdutoBlocState {}

class ProdutoDefaultState extends ProdutoBlocState {
  ProdutoDefaultState({required this.produto});
  final Produto produto;
  /* @override
  List<Object> get props => [produto]; */
}

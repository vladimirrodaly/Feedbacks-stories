part of 'produto_bloc_bloc.dart';

abstract class ProdutoBlocEvent extends Equatable {
  const ProdutoBlocEvent();

  @override
  List<Object> get props => [];
}

class ProdutoEventUpdate extends ProdutoBlocEvent {
  final String? name;
  final String? barCode;
  final String? category;
  final double? value;
  final String? image;

  ProdutoEventUpdate(
      { this.name,
       this.barCode,
       this.category,
       this.value,
      this.image});
}

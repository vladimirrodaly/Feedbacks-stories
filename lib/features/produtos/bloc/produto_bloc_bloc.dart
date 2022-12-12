
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projeto__/features/produtos/models/produto.dart';

part 'produto_bloc_event.dart';
part 'produto_bloc_state.dart';

class ProdutoBlocBloc extends Bloc<ProdutoBlocEvent, ProdutoBlocState> {
  Produto _produto = Produto.empty();


  ProdutoBlocBloc() : super(ProdutoDefaultState(produto: Produto.empty())) {
    // on<ProdutoBlocEvent>((event, emit) async* {

      @override
      Stream<ProdutoBlocState> mapEventToState(ProdutoBlocEvent event) async* {
        if (event is ProdutoEventUpdate) {
        print("Isso ta rodando? kkkk");
        _updateProduct(
            name: event.name,
            barCode: event.barCode,
            category: event.category,
            value: event.value,
            image: event.image);
        yield ProdutoDefaultState(produto: _produto);
      }
      }

      
    // });
  }

  Produto get produto => _produto;

  _updateProduct(
      {String? name,
      String? barCode,
      String? category,
      double? value,
      String? image}) {
    _produto = _produto.copyWith(
        name: name,
        barCode: barCode,
        category: category,
        value: value,
        image: image);
  }
}

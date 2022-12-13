
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projeto__/features/produtos/models/produto.dart';

part 'produto_bloc_event.dart';
part 'produto_bloc_state.dart';


/* class TesteBloc extends Bloc<TesteEvent, TesteState> {
  TesteBloc() : super(TesteInitial()) {
    on<TesteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
} */

class ProdutoBlocBloc extends Bloc<ProdutoBlocEvent, ProdutoBlocState> {
  ProdutoBlocBloc() : super(ProdutoDefaultState(produto: Produto.empty()));

  Produto _produto = Produto.empty();

  @override
  Stream<ProdutoBlocState> mapEventToState(
    ProdutoBlocEvent event,
  ) async* {
    if(event is ProdutoEventUpdate){
        _updateProduct(
          name: event.name,
            barCode: event.barCode,
            value: event.value,
            image: event.image,
            category: event.category
        );
      yield ProdutoDefaultState(produto: _produto);
    } 
  }

  Produto get produto => _produto;

  _updateProduct({
    String? name,
      String? barCode,
      String? category,
      double? value,
      String? image
  }) {
    _produto = _produto.copyWith(
      name: name,
      barCode: barCode,
      category: category,
      value: value,
      image: image,
    );
  }










//   Produto get produto => _produto; 

//    _updateProduct(
//       {String? name,
//       String? barCode,
//       String? category,
//       double? value,
//       String? image}) {
//       _produto = _produto.copyWith(
//         name: name,
//         barCode: barCode,
//         category: category,
//         value: value,
//         image: image);
//   }

//   ProdutoBlocBloc() : super(ProdutoDefaultState(produto: Produto.empty())) {
//      // ignore: void_checks
//      on<ProdutoBlocEvent>((event, emit) async* {
//          print("Isso ta rodando? kkkk");
//          if(event is ProdutoEventUpdate){
//           _updateProduct(
//             name: event.name,
//             barCode: event.barCode,
//             value: event.value,
//             image: event.image,

//           );

//           yield ProdutoDefaultState(produto: _produto);
//          }
//   }
    
//   );

  
// }
}
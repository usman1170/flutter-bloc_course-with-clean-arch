import 'package:bloc/bloc.dart';
import 'package:bloc_course/favourite_exp/models/fev_model.dart';
import 'package:bloc_course/favourite_exp/repository/favourite_repo.dart';
import 'package:equatable/equatable.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  List<FavouriteModel> favouriteList = [];
  List<FavouriteModel> temprList = [];
  final FavouriteRepository favouriteRepository;
  FavouriteBloc(this.favouriteRepository) : super(const FavouriteState()) {
    on<FetchFavouriteList>(_fetchList);
    on<ClearFavouriteList>(_clearList);
    on<AddFavouriteItem>(_addFav);
    on<SelectItems>(_selectItems);
    on<UnSelectItems>(_unSelectItems);
    on<DeleteItems>(_deleteItems);
  }
  void _fetchList(
      FetchFavouriteList event, Emitter<FavouriteState> emit) async {
    favouriteList = await favouriteRepository.fetchItems();
    emit(
      state.copyWith(
          list: List.from(favouriteList), listStatus: ListStatus.success),
    );
  }

  void _clearList(
      ClearFavouriteList event, Emitter<FavouriteState> emit) async {
    favouriteList = [];
    emit(
      state.copyWith(
          list: List.from(favouriteList), listStatus: ListStatus.success),
    );
  }

  void _addFav(AddFavouriteItem event, Emitter<FavouriteState> emit) async {
    final index =
        favouriteList.indexWhere((element) => element.id == event.item.id);

    if (event.item.isFavourite) {
      if (temprList.contains(favouriteList[index])) {
        temprList.remove(favouriteList[index]);
        temprList.add(event.item);
      }
    } else {
      if (temprList.contains(favouriteList[index])) {
        temprList.remove(favouriteList[index]);
        temprList.add(event.item);
      }
    }
    favouriteList[index] = event.item;

    emit(
      state.copyWith(
        list: List.from(favouriteList),
        listStatus: ListStatus.success,
        tempList: List.from(temprList),
      ),
    );
  }

  void _selectItems(SelectItems event, Emitter<FavouriteState> emit) async {
    temprList.add(event.selectedItem);
    emit(
      state.copyWith(
          tempList: List.from(temprList), listStatus: ListStatus.success),
    );
  }

  void _unSelectItems(UnSelectItems event, Emitter<FavouriteState> emit) async {
    temprList.remove(event.unSelectedItem);
    emit(
      state.copyWith(
          tempList: List.from(temprList), listStatus: ListStatus.success),
    );
  }

  void _deleteItems(DeleteItems event, Emitter<FavouriteState> emit) async {
    for (var i = 0; i < temprList.length; i++) {
      favouriteList.remove(temprList[i]);
    }
    temprList.clear();
    emit(
      state.copyWith(
        list: List.from(favouriteList),
        tempList: List.from(temprList),
        listStatus: ListStatus.success,
      ),
    );
  }
}

part of 'favourite_bloc.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  final List<FavouriteModel> list;
  final List<FavouriteModel> tempList;
  final ListStatus listStatus;
  const FavouriteState(
      {this.list = const [],
      this.tempList = const [],
      this.listStatus = ListStatus.loading});

  FavouriteState copyWith(
      {List<FavouriteModel>? list,
      List<FavouriteModel>? tempList,
      ListStatus? listStatus}) {
    return FavouriteState(
      list: list ?? this.list,
      tempList: tempList ?? this.tempList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [
        list,
        tempList,
        listStatus,
      ];
}

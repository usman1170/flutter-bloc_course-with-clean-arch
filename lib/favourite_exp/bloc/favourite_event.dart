part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavouriteEvent {}

class ClearFavouriteList extends FavouriteEvent {}

class AddFavouriteItem extends FavouriteEvent {
  final FavouriteModel item;

  const AddFavouriteItem({required this.item});
}

class SelectItems extends FavouriteEvent {
  final FavouriteModel selectedItem;

  const SelectItems({required this.selectedItem});
}

class UnSelectItems extends FavouriteEvent {
  final FavouriteModel unSelectedItem;

  const UnSelectItems({required this.unSelectedItem});
}

class DeleteItems extends FavouriteEvent {}

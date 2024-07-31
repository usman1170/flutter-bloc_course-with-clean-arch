import 'dart:developer';

import 'package:bloc_course/favourite_exp/bloc/favourite_bloc.dart';
import 'package:bloc_course/favourite_exp/models/fev_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteHomeScreen extends StatefulWidget {
  const FavouriteHomeScreen({super.key});

  @override
  State<FavouriteHomeScreen> createState() => _FavouriteHomeScreenState();
}

class _FavouriteHomeScreenState extends State<FavouriteHomeScreen> {
  @override
  void initState() {
    context.read<FavouriteBloc>().add(FetchFavouriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Items"),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              if (state.tempList.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: IconButton(
                      onPressed: () {
                        context.read<FavouriteBloc>().add(DeleteItems());
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ListStatus.failure:
              return const Center(
                child: Text("Error while loading data"),
              );

            case ListStatus.success:
              if (state.list.isEmpty) {
                return const Center(
                  child: Text("No Data"),
                );
              } else {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    final item = state.list[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          leading: Checkbox(
                            value: state.tempList.contains(item) ? true : false,
                            onChanged: (value) {
                              log(value.toString());
                              if (value!) {
                                context.read<FavouriteBloc>().add(
                                      SelectItems(selectedItem: item),
                                    );
                              } else {
                                context.read<FavouriteBloc>().add(
                                      UnSelectItems(unSelectedItem: item),
                                    );
                              }
                            },
                          ),
                          title: Text(
                            "${item.value.toString()} ${item.isDeleting}",
                            style: TextStyle(
                              color:
                                  item.isDeleting ? Colors.red : Colors.black,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              FavouriteModel itemModel = FavouriteModel(
                                id: item.id,
                                value: item.value,
                                isFavourite: item.isFavourite ? false : true,
                              );
                              context
                                  .read<FavouriteBloc>()
                                  .add(AddFavouriteItem(item: itemModel));
                            },
                            icon: Icon(item.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

            default:
              return const Center(
                child: Text("No Data"),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<FavouriteBloc>().add(ClearFavouriteList());
        },
        child: const Icon(Icons.clear_all),
      ),
    );
  }
}

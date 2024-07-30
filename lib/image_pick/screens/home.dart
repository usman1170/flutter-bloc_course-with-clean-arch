import 'dart:developer';
import 'dart:io';
import 'package:bloc_course/image_pick/bloc/image_pick_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickHome extends StatefulWidget {
  const ImagePickHome({super.key});

  @override
  State<ImagePickHome> createState() => _ImagePickHomeState();
}

class _ImagePickHomeState extends State<ImagePickHome> {
  @override
  Widget build(BuildContext context) {
    log("Image top build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ImagePickBloc, ImagePickState>(
              builder: (context, state) {
                if (state.image == null) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<ImagePickBloc>().add(CameraImage());
                        },
                        icon: const Icon(Icons.camera),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<ImagePickBloc>().add(GalleryImage());
                        },
                        icon: const Icon(Icons.image),
                      ),
                    ],
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .6,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Image.file(
                        File(state.image!.path.toString()),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

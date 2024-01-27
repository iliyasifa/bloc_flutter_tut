import 'dart:io';

import 'package:bloc_flutter_tut/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_flutter_tut/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_flutter_tut/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Viewer'),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        /// To capture image through camera
                        context.read<ImagePickerBloc>().add(CaptureCamera());
                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.camera),
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        /// To pick image through gallery
                        context.read<ImagePickerBloc>().add(ImageGallery());
                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.image),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                /// Image shows only if the file is not null
                if (state.file != null)
                  Image.file(File(state.file!.path))
                else
                  const Text(
                      'No image, Please take image or pick from ur gallery'),
              ],
            );
          },
        ),
      ),
    );
  }
}

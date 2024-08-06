import 'dart:io';

import 'package:api_test/cubit/user_cubit.dart';
import 'package:api_test/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          width: 130,
          height: 130,
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage: context.read<UserCubit>().profilePic == null
                ? const AssetImage("assets/images/avatar.png")
                : FileImage(
                    File(context.read<UserCubit>().profilePic!.path),
                  ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () async {
                      ImagePicker().pickImage(source: ImageSource.camera).then(
                        (value) {
                          context.read<UserCubit>().pickProfilePicture(value!);
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        Icons.camera_alt_sharp,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

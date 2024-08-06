import 'package:api_test/cache/cache_helper.dart';
import 'package:api_test/cubit/user_cubit.dart';
import 'package:api_test/cubit/user_state.dart';
import 'package:api_test/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getUserProfile();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GetUserDataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is GetUserDataLoading
              ? const Center(child: CircularProgressIndicator())
              : state is GetUserDataSuccess
                  ? ListView(
                      children: [
                        const SizedBox(height: 16),
                        //! Profile Picture
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(state.user.profilePic),
                        ),
                        const SizedBox(height: 16),

                        //! Name
                        ListTile(
                          title: Text(state.user.name),
                          leading: const Icon(Icons.person),
                        ),
                        const SizedBox(height: 16),

                        //! Email
                        ListTile(
                          title: Text(state.user.email),
                          leading: const Icon(Icons.email),
                        ),
                        const SizedBox(height: 16),

                        //! Phone number
                        ListTile(
                          title: Text(state.user.phone),
                          leading: const Icon(Icons.phone),
                        ),
                        const SizedBox(height: 16),

                        //! Address
                        ListTile(
                          title: Text(state.user.address['type']),
                          leading: const Icon(Icons.location_city),
                        ),
                        const SizedBox(height: 16),
                        //Log out
                        Align(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            color: Colors.amber,
                            onPressed: () async {
                              await CacheHelper()
                                  .saveData(key: 'loged', value: false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ),
                              );
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.logout),
                                SizedBox(width: 8.0),
                                Text('Log Out'),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    )
                  : Container(),
        );
      },
    );
  }
}

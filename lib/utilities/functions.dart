
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/nav_cubit.dart';

int currentIndex(NavState state) {
  //عشان احافظ ع الايكون متتغيرش
  if (state is NavInitial|| state is NavPage1_1) return 0;
  if (state is NavPage2 ||state is NavPage2_2) return 1;
  if (state is NavPage3||state is NavPage3_3) return 2;
  return 0;
}

Widget page(NavState state, BuildContext context) {
  if (state is NavInitial) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(" Profile Page 1"),
          ElevatedButton(
            onPressed: () {
              context.read<NavCubit>().changeTab(3);
            },
            child: const Text("Go to Page 1.1"),
          ),
        ],
      ),
    );
  } else if (state is NavPage2) {
    return Center(
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(" Calls Page"),
          ElevatedButton(
            onPressed: () {
              context.read<NavCubit>().changeTab(4);
            },
            child: const Text("Go to Page 2.2"),
          ),
        ],
      ),
    );
  } else if (state is NavPage3) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Home Page"),
          ElevatedButton(
            onPressed: () {
              context.read<NavCubit>().changeTab(5);
            },
            child: const Text("Go to Page 3.3"),
          ),
        ],
      ),
    );
  } else if (state is NavPage1_1) {
    return  Center(child:
    Text(" Page 1.1"));
  } else if (state is NavPage2_2) {
    return  Center(child: Text(" Page 2.2"));
  } else if (state is NavPage3_3) {
    return  Center(child: Text(" Page 3.3"));
  } else {
    return  Center(child: Text(" try again"));
  }
}



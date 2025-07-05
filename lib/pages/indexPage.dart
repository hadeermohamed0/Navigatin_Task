import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/nav_cubit.dart';
import '../utilities/functions.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavCubit(),
      child: BlocBuilder<NavCubit, NavState>(
        builder: (context, state) {
          int selectIndex = currentIndex(state);

          return Scaffold(
            body: page(state, context),
            bottomNavigationBar: NavigationBar(
              selectedIndex: selectIndex,
              height: 70,
              onDestinationSelected: (index) {
                context.read<NavCubit>().changeTab(index);
              },
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.account_circle_outlined),
                  selectedIcon: Icon(Icons.account_circle_rounded),
                  label: "Profile",
                ),
                NavigationDestination(
                  icon: Icon(Icons.phone),
                  selectedIcon: Icon(Icons.phone_in_talk_rounded),
                  label: "Calls",
                ),
                NavigationDestination(
                  icon: Icon(Icons.home_work_outlined),
                  selectedIcon: Icon(Icons.home_work_rounded),
                  label: "Home",
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}

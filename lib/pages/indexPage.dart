import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/nav_cubit.dart';
import '../utilities/functions.dart';
import 'logoutPage.dart';
class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavCubit(),
      child: BlocBuilder<NavCubit,NavState>(
        builder: (context, state) {

          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LogoutPage()),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent, // Button color

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child:  Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                )
              ],
            ),
            body: page(state, context),
            bottomNavigationBar: NavigationBar(
              selectedIndex: context.watch<NavCubit>().currentIndex,
              height: MediaQuery.of(context).size.height * 0.10,
              onDestinationSelected: (index) {
                context.read<NavCubit>().changeTab(index);
              },
                backgroundColor:Colors.grey,
                 indicatorShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
          ),
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

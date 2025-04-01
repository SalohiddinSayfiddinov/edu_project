import 'package:edu_project/cubit/bottomNavBar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, selectedIndex) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: (index) => context.read<BottomNavCubit>().changeTab(index),
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/home.png")), label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/explore.png")),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/list.png")),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/notification.png")),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/profile.png")),
                label: ''),
          ],
        );
      },
    );
  }
}

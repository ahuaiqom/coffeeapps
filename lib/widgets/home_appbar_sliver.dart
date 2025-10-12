import 'package:flutter/material.dart';
import 'home_header.dart';
import 'search_bar.dart';

class HomeAppBarSliver extends StatelessWidget {
  const HomeAppBarSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      toolbarHeight: 96,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF111111), Color(0xFF1A1A1A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: HomeHeader(),
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: SearchBarWidget(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/home_controller.dart';
import '../controllers/nav_visibility_controller.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/home_appbar_sliver.dart';
import '../widgets/promo_section.dart';
import '../ui/dimens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontal = Dimens.horizontalByScreen(screenWidth);
    const whiteTopMargin = Dimens.bannerHeight / 2;
    final contentTopPadding = whiteTopMargin + 16;

    return ChangeNotifierProvider(
      create: (_) => NavVisibilityController(),
      child: Consumer<NavVisibilityController>(
        builder: (context, nav, _) {
          final safeBottom = MediaQuery.of(context).padding.bottom;
          final double bottomPadding = nav.show ? (Dimens.navHeight + safeBottom + 24.0) : 24.0;

          return Scaffold(
            backgroundColor: Colors.white,
            extendBody: true,

            bottomNavigationBar: AnimatedSlide(
              offset: Offset(0, nav.show ? 0 : 1),
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              child: AnimatedOpacity(
                opacity: nav.show ? 1 : 0,
                duration: const Duration(milliseconds: 180),
                child: const SafeArea(top: false, child: BottomNavBar()),
              ),
            ),

            body: SafeArea(
              bottom: false,
              child: NotificationListener<UserScrollNotification>(
                onNotification: (n) => context.read<NavVisibilityController>().onScroll(n),
                child: CustomScrollView(
                  slivers: [
                    const HomeAppBarSliver(),
                    SliverToBoxAdapter(
                      child: PromoSection(
                        horizontal: horizontal,
                        whiteTopMargin: whiteTopMargin,
                        contentTopPadding: contentTopPadding,
                        bottomPadding: bottomPadding,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/home_controller.dart';
import 'category_filter.dart';
import 'coffee_grid.dart';
import 'promo_banner.dart';

class PromoSection extends StatelessWidget {
  const PromoSection({
    super.key,
    required this.horizontal,
    required this.whiteTopMargin,
    required this.contentTopPadding,
    required this.bottomPadding,
  });

  final double horizontal;
  final double whiteTopMargin;
  final double contentTopPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 🔹 Tambah lapisan latar hitam di belakang banner
        Container(
          height: whiteTopMargin + 40, // sedikit di bawah banner
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF111111), Color(0xFF1A1A1A)],
             
            ),
          ),
        ),

        // 🔹 Panel putih konten utama
        Container(
          margin: EdgeInsets.only(top: whiteTopMargin),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10,
              offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              horizontal,
              contentTopPadding,
              horizontal,
              18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const CategoryFilterWidget(),
                const SizedBox(height: 12),
                CoffeeGridWidget(bottomPadding: bottomPadding),
              ],
            ),
          ),
        ),

        // 🔹 Banner promo tetap “menggantung” di batas hitam–putih
        Positioned(
          top: 0,
          left: horizontal,
          right: horizontal,
          child: SizedBox(
            height: 140,
            child: PromoBannerWidget(promo: controller.promo),
          ),
        ),
      ],
    );
  }
}

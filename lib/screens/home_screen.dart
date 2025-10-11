import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ScrollDirection;
import 'package:provider/provider.dart';

// Pastikan path impor ini sesuai dengan struktur proyek Anda
import '../controllers/home_controller.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/category_filter.dart';
import '../widgets/coffee_grid.dart';
import '../widgets/home_header.dart';
import '../widgets/promo_banner.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State untuk mengatur visibilitas bottom navigation bar
  bool _showNav = true;

  @override
  Widget build(BuildContext context) {
    // Mengakses HomeController menggunakan Provider
    final controller = context.watch<HomeController>();

    // Kalkulasi dinamis untuk layout responsif berdasarkan lebar layar
    const double bannerHeight = 140;
    const double figmaBannerWidth = 327;
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding =
        ((screenWidth - figmaBannerWidth) / 2).clamp(16.0, 32.0);

    final whiteTopMargin = bannerHeight / 2; // = 70
    final contentTopPadding = whiteTopMargin + 16;

    // Padding bawah dinamis agar konten tidak tertutup oleh navbar
    const double kNavHeight = 70; // Sesuaikan dengan tinggi BottomNavBar Anda
    final double safeBottom = MediaQuery.of(context).padding.bottom;
    final double bottomContentPadding =
        _showNav ? (kNavHeight + safeBottom + 24) : 24;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      extendBody: true,
      // Bottom navigation bar dengan animasi slide dan fade
      bottomNavigationBar: AnimatedSlide(
        offset: Offset(0, _showNav ? 0 : 1),
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        child: AnimatedOpacity(
          opacity: _showNav ? 1 : 0,
          duration: const Duration(milliseconds: 180),
          // SafeArea untuk menghindari area gesture sistem (misal: home bar di iPhone)
          child: const SafeArea(
            top: false,
            child: BottomNavBar(),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false, // SafeArea untuk bagian bawah sudah di-handle oleh bottomNavigationBar
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            // Logika untuk menyembunyikan/menampilkan navbar saat scroll
            if (notification.direction == ScrollDirection.reverse && _showNav) {
              setState(() => _showNav = false);
            } else if (notification.direction == ScrollDirection.forward && !_showNav) {
              setState(() => _showNav = true);
            }
            return true; // Mengizinkan notifikasi untuk terus "bubble up"
          },
          child: CustomScrollView(
            slivers: [
              // --- AppBar yang tetap di atas (pinned) ---
              SliverAppBar(
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
              ),

              // --- Konten utama: Banner promo dan panel putih ---
              SliverToBoxAdapter(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Panel putih sebagai background konten
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
                            color: Colors.black.withOpacity(0.10),
                            blurRadius: 24,
                            offset: const Offset(0, -6),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          horizontalPadding,
                          contentTopPadding,
                          horizontalPadding,
                          18,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            const CategoryFilterWidget(),
                            const SizedBox(height: 12),
                            // Grid produk kopi dengan padding bawah dinamis
                            CoffeeGridWidget(
                              bottomPadding: bottomContentPadding,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Banner promo yang "menggantung" di antara appbar dan panel putih
                    Positioned(
                      top: 0,
                      left: horizontalPadding,
                      right: horizontalPadding,
                      child: SizedBox(
                        height: bannerHeight,
                        child: PromoBannerWidget(promo: controller.promo),
                      ),
                    ),
                  ],
                ),
              ),

              // Mengisi sisa viewport dengan warna putih agar tidak ada area hitam
              // saat konten lebih pendek dari layar.
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
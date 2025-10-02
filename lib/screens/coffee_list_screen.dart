import 'package:flutter/material.dart';
import '../data/coffee_data.dart';
import '../widgets/coffee_card.dart';
import '../widgets/category_filter.dart';
import 'coffee_detail_screen.dart'; // pastikan nama file & class benar

class CoffeeListScreen extends StatefulWidget {
  const CoffeeListScreen({super.key});

  @override
  State<CoffeeListScreen> createState() => _CoffeeListScreenState();
}

class _CoffeeListScreenState extends State<CoffeeListScreen> {
  String selectedCategory = "All Coffee";

  @override
  Widget build(BuildContext context) {
    final dynamicCategories = <String>{"All Coffee", ...coffees.map((c) => c.type)}.toList();

    final filteredCoffees = selectedCategory == "All Coffee"
        ? coffees
        : coffees.where((c) => c.type == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory == "All Coffee" ? "All Coffee" : selectedCategory),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final crossAxisCount = w >= 1000 ? 4 : w >= 800 ? 3 : w >= 600 ? 2 : 1;
          final childAspectRatio = crossAxisCount == 1 ? 3 / 4 : 2 / 3;

          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                CategoryFilter(
                  categories: dynamicCategories,
                  selectedCategory: selectedCategory,
                  onSelected: (category) => setState(() => selectedCategory = category),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    itemCount: filteredCoffees.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: childAspectRatio,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      final item = filteredCoffees[index];
                      return CoffeeCard(
                        coffee: item,
                        onTap: () {
                          // indikator: pastikan tap tertembak
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Opening: ${item.name}')),
                          );
                          // navigasi ke detail (samakan nama class/param dengan file temanmu)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CoffeeDetailScreen(coffee: item),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

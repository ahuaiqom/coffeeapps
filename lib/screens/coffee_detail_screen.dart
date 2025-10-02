import 'package:flutter/material.dart';
import '../models/coffee.dart';

class CoffeeDetailScreen extends StatefulWidget {
  final Coffee coffee;

  const CoffeeDetailScreen({super.key, required this.coffee});

  @override
  State<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  String selectedSize = "M";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Detail"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWide = constraints.maxWidth > 700; // breakpoint responsif

          final imageWidget = ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              widget.coffee.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: isWide ? 300 : 200,
            ),
          );

          final detailWidget = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.coffee.name,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 20),
                  const SizedBox(width: 4),
                  Text("${widget.coffee.rating} (${widget.coffee.reviews})",
                      style: const TextStyle(fontSize: 14)),
                ],
              ),
              const SizedBox(height: 12),
              const Text("Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(widget.coffee.description,
                  style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),
              const Text("Size",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: ["S", "M", "L"].map((size) {
                  bool isSelected = size == selectedSize;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSize = size;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: isSelected ? Colors.orange : Colors.grey),
                        color: isSelected ? Colors.orange.shade100 : Colors.white,
                      ),
                      child: Text(
                        size,
                        style: TextStyle(
                            color: isSelected ? Colors.orange : Colors.black),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$ ${widget.coffee.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text("Buy Now",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  )
                ],
              )
            ],
          );

          // Mobile (Column) vs Desktop (Row)
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: isWide
                ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: imageWidget),
                const SizedBox(width: 24),
                Expanded(flex: 3, child: detailWidget),
              ],
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageWidget,
                const SizedBox(height: 16),
                detailWidget,
              ],
            ),
          );
        },
      ),
    );
  }
}

import '../models/coffee.dart';
import '../models/category.dart';
import '../models/promo.dart';

const Promo samplePromo = Promo(
  title: "Buy one get\none FREE",
  subtitle: "Promo",
  imageAsset: "assets/images/promo_banner.png",
);

final List<Category> categories = [
  Category(id: 'all', label: 'All Coffee'),
  Category(id: 'deep', label: 'Deep Foam'),
  Category(id: 'latte', label: 'Latte'),
  Category(id: 'sweet', label: 'Sweet'),
  Category(id: 'classic', label: 'Classic'),
];

final List<Coffee> coffees = [
  Coffee(
    name: "Caffe Mocha",
    category: "deep",
    image: "assets/image/coffee.jpg",
    price: 4.53,
    rating: 4.8,
    reviews: 230,
    description:
        "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk foam.",
  ),
  Coffee(
    name: "Flat White",
    category: "latte",
    image: "assets/image/Flat_white.jpg",
    price: 3.53,
    rating: 4.8,
    reviews: 180,
    description:
        "A flat white is a coffee drink consisting of espresso with microfoam (steamed milk with small, fine bubbles).",
  ),
  Coffee(
    name: "Black Coffee",
    category: "classic",
    image: "assets/image/blackcoffee.jpg",
    price: 2.99,
    rating: 4.6,
    reviews: 150,
    description: "A simple and strong coffee brewed without milk or sugar.",
  ),
  Coffee(
    name: "Caramel Macchiato",
    category: "sweet",
    image: "assets/image/caramelmachiato.jpg",
    price: 5.10,
    rating: 4.7,
    reviews: 200,
    description:
        "A caramel macchiato is made with vanilla syrup, steamed milk, espresso and caramel sauce.",
  ),
  Coffee(
    name: "Cold Brew Ice",
    category: "sweet",
    image: "assets/image/coldbrew.jpg",
    price: 5.10,
    rating: 4.7,
    reviews: 200,
    description:
        "A caramel macchiato is made with vanilla syrup, steamed milk, espresso and caramel sauce.",
  ),
  Coffee(
    name: "Creamy Affogato",
    category: "sweet",
    image: "assets/image/affogato.jpg",
    price: 5.10,
    rating: 4.7,
    reviews: 200,
    description:
        "A caramel macchiato is made with vanilla syrup, steamed milk, espresso and caramel sauce.",
  ),
];

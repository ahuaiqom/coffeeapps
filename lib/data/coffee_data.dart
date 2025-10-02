import '../models/coffee.dart';

final List<Coffee> coffees = [
  Coffee(
    name: "Caffe Mocha",
    type: "Deep Foam",
    image: "assets/image/coffee.jpg",
    price: 4.53,
    rating: 4.8,
    reviews: 230,
    description:
        "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk foam.",
  ),
  Coffee(
    name: "Flat White",
    type: "Espresso",
    image: "assets/image/Flat_white.jpg",
    price: 3.53,
    rating: 4.8,
    reviews: 180,
    description:
        "A flat white is a coffee drink consisting of espresso with microfoam (steamed milk with small, fine bubbles).",
  ),
  Coffee(
    name: "Black Coffee",
    type: "Classic",
    image: "assets/image/blackcoffee.jpg",
    price: 2.99,
    rating: 4.6,
    reviews: 150,
    description: "A simple and strong coffee brewed without milk or sugar.",
  ),
  Coffee(
    name: "Caramel Macchiato",
    type: "Sweet",
    image: "assets/image/caramelmachiato.jpg", // pastikan namanya sesuai file
    price: 5.10,
    rating: 4.7,
    reviews: 200,
    description:
        "A caramel macchiato is made with vanilla syrup, steamed milk, espresso and caramel sauce.",
  ),
];

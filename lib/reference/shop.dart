import 'package:flutter/material.dart';

void main() => runApp(EcommerceApp());

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ecommerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductCatalogPage(),
    );
  }
}

// Product model to represent items in the store
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

// Dummy data for product catalog
List<Product> products = [
  Product(
    id: '1',
    name: 'Smartphone',
    description: 'A modern smartphone with high-end features.',
    price: 599.99,
    imageUrl: 'https://via.placeholder.com/300',
  ),
  Product(
    id: '2',
    name: 'Laptop',
    description: 'Powerful laptop for work and gaming.',
    price: 1299.99,
    imageUrl: 'https://via.placeholder.com/300',
  ),
  Product(
    id: '3',
    name: 'Headphones',
    description: 'Noise-cancelling headphones for immersive audio.',
    price: 199.99,
    imageUrl: 'https://via.placeholder.com/300',
  ),
];

class ProductCatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(products[index].imageUrl),
            title: Text(products[index].name),
            subtitle: Text(products[index].description),
            trailing: Text('\$${products[index].price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network(product.imageUrl),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 8.0),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Implement logic to add product to cart
                    // For simplicity, we'll just navigate back to the catalog
                    Navigator.pop(context);
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

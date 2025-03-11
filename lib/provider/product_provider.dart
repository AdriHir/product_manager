import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../repositories/product_repo.dart';

class ProductProvider with ChangeNotifier {
  final ProductRepository _repository = ProductRepository();
  List<Product> _products = [];

  List<Product> get products => _products;

  // 📌 Charger les produits depuis la base de données
  Future<void> fetchProducts() async {
    _products = await _repository.getProducts();
    notifyListeners();
  }

  // 📌 Ajouter un produit
  Future<void> addProduct(Product product) async {
    await _repository.addProduct(product);
    await fetchProducts(); // Recharger la liste
  }

  // 📌 Supprimer un produit
  Future<void> deleteProduct(int id) async {
    await _repository.deleteProduct(id);
    await fetchProducts();
  }

  // 📌 Mettre à jour un produit
  Future<void> updateProduct(Product product) async {
    await _repository.updateProduct(product);
    await fetchProducts();
  }
}

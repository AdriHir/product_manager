import '../database/db_product_manager.dart';
import '../models/product.dart';

class ProductRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  // 📌 Ajouter un produit
  Future<int> addProduct(Product product) async {
    final db = await _dbHelper.database;
    return await db.insert('products', product.toMap());
  }

  // 📌 Récupérer tous les produits
  Future<List<Product>> getProducts() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return maps.map((map) => Product.fromMap(map)).toList();
  }

  // 📌 Mettre à jour un produit
  Future<int> updateProduct(Product product) async {
    final db = await _dbHelper.database;
    return await db.update(
      'products',
      product.toMap(),
      where: "id = ?",
      whereArgs: [product.id],
    );
  }

  // 📌 Supprimer un produit
  Future<int> deleteProduct(int id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      'products',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}

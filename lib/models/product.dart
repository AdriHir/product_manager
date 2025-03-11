// Définition de la classe Product représentant un produit
class Product {
  int? id; // ID du produit (optionnel, car généré par SQLite)
  String name; // Nom du produit
  double price; // Prix du produit
  String description; // Description du produit

  // Constructeur permettant de créer un produit
  Product({this.id, required this.name, required this.price, required this.description});

  // Convertit un objet Product en Map (utilisé pour l'insertion dans SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id, // Clé 'id' associée à l'attribut id
      'name': name, // Clé 'name' associée à l'attribut name
      'price': price, // Clé 'price' associée à l'attribut price
      'description': description, // Clé 'description' associée à l'attribut description
    };
  }

  // Constructeur "factory" permettant de créer un objet Product à partir d'un Map ( récupération dans la bdd )
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'], // Récupère l'ID depuis la base de données
      name: map['name'], // Récupère le nom du produit
      price: map['price'], // Récupère le prix
      description: map['description'], // Récupère la description
    );
  }
}

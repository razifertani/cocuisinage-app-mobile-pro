import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/product.dart';

class Commande {
  late int id;
  int? particulierId;
  double? montant;
  String? typeLivraison;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? establishmentId;
  String? commingHour;
  String? recevedHour;
  String? shipType;
  String? message;
  late List<CommandeProduct> commandeProduct;

  Commande({required this.id, this.particulierId, this.montant, this.typeLivraison, this.status, this.createdAt, this.updatedAt, this.establishmentId, this.commingHour, this.recevedHour, this.shipType, this.message, required this.commandeProduct});

  Commande.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    particulierId = json['particulier_id'];
    montant = double.parse(json['montant'].toString());
    typeLivraison = json['type_livraison'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    establishmentId = json['establishment_id'];
    commingHour = json['comming_hour'];
    recevedHour = json['receved_hour'];
    shipType = json['ship_type'];
    message = json['message'];
    if (json['commande_product'] != null) {
      commandeProduct = <CommandeProduct>[];
      json['commande_product'].forEach((v) {
        commandeProduct.add(new CommandeProduct.fromJson(v));
      });
    }
  }
}

class CommandeProduct {
  late int id;
  int? establishmentProductId;
  int? qte;
  double? prix;
  int? commandeId;
  String? createdAt;
  String? updatedAt;
  int? status;
  String? commingHour;
  String? shipType;
  String? message;
  EstablishmentProduct? establishmentProduct;

  CommandeProduct({required this.id, this.establishmentProductId, this.qte, this.prix, this.commandeId, this.createdAt, this.updatedAt, this.status, this.commingHour, this.shipType, this.message, this.establishmentProduct});

  CommandeProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    establishmentProductId = json['establishment_product_id'];
    qte = json['qte'];
    prix = double.parse(json['prix'].toString());
    commandeId = json['commande_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    commingHour = json['comming_hour'];
    shipType = json['ship_type'];
    message = json['message'];
    establishmentProduct = json['establishment_product'] != null ? new EstablishmentProduct.fromJson(json['establishment_product']) : null;
  }
}

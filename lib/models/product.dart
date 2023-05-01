class EstablishmentProduct {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? establishmentId;
  int? productId;
  String? unit;
  double? priceByUnit;
  String? location;
  String? stockQuantity;
  String? dlc;
  String? ref;
  String? img;
  int? isRec;
  int? isIng;
  int? qteForOneRec;
  int? establishmentProductRecetteId;
  int? showHome;
  String? description;
  int? autoUpgradeShoppingList;
  double? minimumQuantityToOrder;
  double? maximumQuantityToOrder;
  String? imageUrl;
  late Product product;

  EstablishmentProduct({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.establishmentId,
    this.productId,
    this.unit,
    this.priceByUnit,
    this.location,
    this.stockQuantity,
    this.dlc,
    this.ref,
    this.img,
    this.isRec,
    this.isIng,
    this.qteForOneRec,
    this.establishmentProductRecetteId,
    this.showHome,
    this.description,
    this.autoUpgradeShoppingList,
    this.minimumQuantityToOrder,
    this.maximumQuantityToOrder,
    this.imageUrl,
    required this.product,
  });

  EstablishmentProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    establishmentId = json['establishment_id'];
    productId = json['product_id'];
    unit = json['unit'];
    priceByUnit = double.parse(json['price_by_unit'].toString());
    location = json['location'];
    stockQuantity = json['stock_quantity'];
    dlc = json['dlc'];
    ref = json['ref'];
    img = json['img'];
    isRec = json['is_rec'];
    isIng = json['is_ing'];
    qteForOneRec = json['qte_for_one_rec'];
    establishmentProductRecetteId = json['establishment_product_recette_id'];
    showHome = json['show_home'];
    description = json['description'];
    autoUpgradeShoppingList = json['auto_upgrade_shopping_list'];
    // minimumQuantityToOrder = json['minimum_quantity_to_order'];
    // maximumQuantityToOrder = json['maximum_quantity_to_order'];
    imageUrl = json['image_url'];
    product = new Product.fromJson(json['product']);
  }
}

class Product {
  int? id;
  late String name;
  String? desc;
  String? createdAt;
  String? updatedAt;
  int? hasImage;
  String? sourceLink;
  String? aLair;
  String? img;
  String? imgCover;
  String? auFrigo;
  String? astucePreparation;
  String? good;
  String? bad;
  String? advice;
  String? nutritionGrades;
  String? nutriscoreScore;
  String? ingredients;
  String? codeCiqual;
  String? codeBar;
  String? originsLc;
  int? isVerified;
  String? ingredientImg;
  String? marque;
  String? origin;
  String? adresse;
  String? qte;
  int? hasCover;
  String? professionalId;
  String? imageUrl;
  String? covUrl;
  DefaultTag? defaultTag;

  Product(
      {this.id,
      required this.name,
      this.desc,
      this.createdAt,
      this.updatedAt,
      this.hasImage,
      this.sourceLink,
      this.aLair,
      this.img,
      this.imgCover,
      this.auFrigo,
      this.astucePreparation,
      this.good,
      this.bad,
      this.advice,
      this.nutritionGrades,
      this.nutriscoreScore,
      this.ingredients,
      this.codeCiqual,
      this.codeBar,
      this.originsLc,
      this.isVerified,
      this.ingredientImg,
      this.marque,
      this.origin,
      this.adresse,
      this.qte,
      this.hasCover,
      this.professionalId,
      this.imageUrl,
      this.covUrl,
      this.defaultTag});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hasImage = json['hasImage'];
    sourceLink = json['source_link'];
    aLair = json['a_lair'];
    img = json['img'];
    imgCover = json['img_cover'];
    auFrigo = json['au_frigo'];
    astucePreparation = json['astuce_preparation'];
    good = json['good'];
    bad = json['bad'];
    advice = json['advice'];
    nutritionGrades = json['nutrition_grades'];
    nutriscoreScore = json['nutriscore_score'];
    ingredients = json['ingredients'];
    codeCiqual = json['code_ciqual'];
    codeBar = json['code_bar'];
    originsLc = json['origins_lc'];
    isVerified = json['is_verified'];
    ingredientImg = json['ingredient_img'];
    marque = json['marque'];
    origin = json['origin'];
    adresse = json['adresse'];
    qte = json['qte'];
    hasCover = json['hasCover'];
    professionalId = json['professional_id'];
    imageUrl = json['image_url'];
    covUrl = json['cov_url'];
    defaultTag = json['default_tag'] != null ? new DefaultTag.fromJson(json['default_tag']) : null;
  }
}

class DefaultTag {
  int? id;
  int? hasImage;
  String? name;
  int? isFamily;
  String? source;
  String? group;
  String? img;
  int? isProduct;
  String? aLair;
  String? imgCover;
  String? auFrigo;
  String? astucePreparation;
  String? description;
  String? good;
  String? bad;
  String? advice;
  String? season;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  int? firstParent;
  String? scorePef;
  String? ciqualCode;
  int? defaultProductId;
  String? creatorId;
  int? isChecked;
  String? imageUrl;

  DefaultTag(
      {this.id,
      this.hasImage,
      this.name,
      this.isFamily,
      this.source,
      this.group,
      this.img,
      this.isProduct,
      this.aLair,
      this.imgCover,
      this.auFrigo,
      this.astucePreparation,
      this.description,
      this.good,
      this.bad,
      this.advice,
      this.season,
      this.parentId,
      this.createdAt,
      this.updatedAt,
      this.firstParent,
      this.scorePef,
      this.ciqualCode,
      this.defaultProductId,
      this.creatorId,
      this.isChecked,
      this.imageUrl});

  DefaultTag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hasImage = json['hasImage'];
    name = json['name'];
    isFamily = json['is_family'];
    source = json['source'];
    group = json['group'];
    img = json['img'];
    isProduct = json['is_product'];
    aLair = json['a_lair'];
    imgCover = json['img_cover'];
    auFrigo = json['au_frigo'];
    astucePreparation = json['astuce_preparation'];
    description = json['description'];
    good = json['good'];
    bad = json['bad'];
    advice = json['advice'];
    season = json['season'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstParent = json['first_parent'];
    // scorePef = json['score_pef'];
    // ciqualCode = json['ciqual_code'];
    defaultProductId = json['default_product_id'];
    creatorId = json['creator_id'];
    isChecked = json['is_checked'];
    imageUrl = json['image_url'];
  }
}

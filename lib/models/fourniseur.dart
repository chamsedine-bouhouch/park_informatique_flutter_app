class Fournisseur {
  final String nom;
  final String email;
  final String type;
  final int telephone;
  final String service;

  const Fournisseur(
      this.nom, this.email, this.type, this.telephone, this.service);

  factory Fournisseur.fromJson(Map<String, dynamic> json) {
    return Fournisseur(
        json['nom'] as String,
        json['email'] as String,
        json['type'] as String,
        json['telephone'] as int,
        json['service'] as String);
  }
}

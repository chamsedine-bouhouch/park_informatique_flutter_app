class Parc {
  final String nom;
  final int serie;
  final String type;
  final String fabricant;
  final String modele;
  final String version;

  const Parc(this.nom, this.type, this.serie, this.fabricant, this.modele, this.version);

  factory Parc.fromJson(Map<String, dynamic> json) {
    return Parc(
      json['nom'] as String,
      json['type'] as String,
      json['serie'] as int,
      json['fabricant'] as String,
      json['modele'] as String,
      json['version'] as String,
    
    );
  }
}

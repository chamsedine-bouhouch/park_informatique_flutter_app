class Ticket {
  final int id;
  final String titre;
  final String description;
  final int employe_id;
  final String statut;

  const Ticket(
    this.id,
    this.titre,
    this.description,
    this.employe_id,
    this.statut,
  );

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      json['id'] as int,
      json['titre'] as String,
      json['description'] as String,
      json['employe_id'] as int,
      json['statut'] as String,
    );
  }
}

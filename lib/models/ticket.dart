class Ticket {
  final String titre;
  final String description;
  final int employe_id;

  const Ticket(this.titre, this.description, this.employe_id);

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      json['titre'] as String,
      json['description'] as String,
      json['employe_id'] as int,
    );
  }
}

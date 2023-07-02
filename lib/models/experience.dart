class Experience {
  final String titre;
  final String description;

  const Experience(this.titre, this.description);

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      json['titre'] as String,
      json['description'] as String,
    );
  }
}

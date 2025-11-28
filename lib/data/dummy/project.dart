class Project {
  final int id;
  final String title;
  final String description;
  final String location;
  final String surfaceArea;
  final List<String> imageUrls;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.surfaceArea,
    required this.imageUrls,
  });
}

// ======= DATASET =======

final List<Project> projects = [
  Project(
    id: 1,
    title: 'Maison Contemporaine à Alger',
    description:
        'Une villa contemporaine située sur les hauteurs d Alger, avec une vue panoramique sur la baie. Le design met en valeur la lumière naturelle et les matériaux nobles comme le bois et le béton brut.',
    location: 'Alger, Algérie',
    surfaceArea: '450 m²',
    imageUrls: [
      'assets/images/villa1_1.png',
      'assets/images/villa1_2.png',
      'assets/images/villa1_3.png',
    ],
  ),
  Project(
    id: 2,
    title: 'Complexe Résidentiel El Mouradia',
    description:
        'Un ensemble d appartements modernes et fonctionnels. L accent est mis sur la durabilité énergétique et l intégration dans le tissu urbain existant.',
    location: 'El Mouradia, Alger',
    surfaceArea: '3200 m²',
    imageUrls: [
      'assets/images/residence1_1.jpg',
      'assets/images/residence1_2.jpg',
      'assets/images/residence1_3.jpg',
    ],
  ),
  Project(
    id: 3,
    title: 'Pavillon Culturel',
    description:
        'Un espace polyvalent conçu pour accueillir des expositions, ateliers et conférences. L architecture combine tradition et modernité avec des lignes épurées et des matériaux locaux.',
    location: 'Oran, Algérie',
    surfaceArea: '980 m²',
    imageUrls: [
      'assets/images/pavillon1_1.jpg',
      'assets/images/pavillon1_2.jpg',
    ],
  ),
];

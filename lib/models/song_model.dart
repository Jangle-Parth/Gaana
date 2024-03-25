class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
      title: 'Dhol Tasha',
      description: 'Dhol Tasha',
      url: 'assets/music/Dhol Tasha.mp3',
      coverUrl: 'assets/images/dhol tasha.jpeg',
    ),
    Song(
      title: 'Jeete Hain Chal',
      description: 'Kavita Seth',
      url: 'assets/music/Jeete Hain Chal.mp3',
      coverUrl: 'assets/images/jeete hai chal.jpg',
    ),
    Song(
      title: 'Manzar Naya',
      description: 'Shashwat S',
      url: 'assets/music/Manzar hai ye naya.mp3',
      coverUrl: 'assets/images/manzar hai ye naya.jpg',
    ),
    Song(
      title: 'Boss Song',
      description: 'Sonu Nigam',
      url: 'assets/music/Pitah se hai naam tera.mp3',
      coverUrl: 'assets/images/pitah se hai naam tera.jpg',
    ),
    Song(
      title: 'Khalsa',
      description: 'Daler Mehendi',
      url: 'assets/music/',
      coverUrl: 'assets/images/raj karega khalsa.jpg',
    ),
    Song(
      title: 'Sabashiyan',
      description: 'Shilpa Rao',
      url: 'assets/music/Raj Karega Khalsa.mp3',
      coverUrl: 'assets/images/Sabashiyan.jpg',
    ),
    Song(
      title: 'Soorma Theme',
      description: 'Shankar M.',
      url: 'assets/music/Soorma Theme.mp3',
      coverUrl: 'assets/images/Soorma Theme.jpg',
    ),
    Song(
      title: 'Sultan Theme',
      description: 'Sukhwinder S.',
      url: 'assets/music/Sultan Theme.mp3',
      coverUrl: 'assets/images/Sultan Theme.jpg',
    ),
  ];
}

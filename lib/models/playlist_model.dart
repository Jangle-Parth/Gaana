import 'package:GAANA/models/song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageloc;

  Playlist({required this.title, required this.songs, required this.imageloc});
  static List<Playlist> playlist = [
    Playlist(
        title: "Hip-Hop",
        songs: Song.songs,
        imageloc: 'assets/images/hip-hop.jpg'),
    Playlist(
        title: "Calm", songs: Song.songs, imageloc: "assets/images/calm.jpg"),
    Playlist(
        title: "Motivational",
        songs: Song.songs,
        imageloc: "assets/images/motiational.jpg"),
    Playlist(
        title: "Only Beats",
        songs: Song.songs,
        imageloc: "assets/images/onlybeat.jpg"),
  ];
}

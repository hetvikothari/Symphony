import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'db.dart';

Stream<QuerySnapshot> getAllSongs() {
  Stream<QuerySnapshot> query = Firestore.instance
      .collection('songs')
      .where('type', isEqualTo: 'song')
      .snapshots();
  return query;
}

Stream<QuerySnapshot> getArtistItems(String singername) {
  Stream<QuerySnapshot> query = Firestore.instance
      .collection('songs')
      .where('artist', arrayContains: singername)
      .snapshots();
  return query;
}

Stream<QuerySnapshot> getAllPodcasts() {
  Stream<QuerySnapshot> query = Firestore.instance
      .collection('songs')
      .where('type', isEqualTo: 'podcast')
      .snapshots();
  return query;
}

Stream<QuerySnapshot> getGenrePodcast(String genre) {
  Stream<QuerySnapshot> query = Firestore.instance
      .collection('songs')
      .where('type', isEqualTo: 'podcast')
      .where('description', isEqualTo: genre)
      .snapshots();
  return query;
}

Stream<QuerySnapshot> getUserPlaylists(User user) {
  Stream<QuerySnapshot> query = Firestore.instance
      .collection('playlist')
      .where('user', isEqualTo: user)
      .snapshots();
  return query;
}

Stream<QuerySnapshot> getUserPlaylistSongs(String playlistid) {
  Stream<QuerySnapshot> query = Firestore.instance
      .collection('playlist')
      .where('PlaylistId', isEqualTo: playlistid)
      .snapshots();
  return query;
}

Stream<QuerySnapshot> allsongs = getAllSongs();
Stream<QuerySnapshot> SonuNigamSongs = getArtistItems('Sonu Nigam');

final song1 = Song(songName: 'Tum ho', imglocation: 'assets/rockstar.jpg', detail: 'Rockstar');
final song2 = Song(songName: 'Maahi Ve', imglocation: 'assets/highway.jpg', detail: 'Highway');
final song3 = Song(songName: 'All of me', imglocation: 'assets/null.webp', detail: 'John Legend');
final song4 = Song(songName: 'Roobaroo', imglocation: 'assets/rangde.jpg', detail: 'Rand De Basanti');

final podcast1 = Song(songName: 'Dream With Your Eyes Open', imglocation: 'assets/dream.jpg', detail: 'By Anonymous speaker');
final podcast2 = Song(songName: 'Purpose', imglocation: 'assets/purpose.png', detail: 'By Gaur Gopal Das');
final podcast3 = Song(songName: 'Murder Mystery', imglocation: 'assets/murder.jpg', detail: 'By Saurabh');
final podcast4 = Song(songName: 'Girl In Space', imglocation: 'assets/girl.jpg', detail: 'By Anonymous speaker');

final poster1 = Song(songName: 'Kar Gayi Chull', imglocation: 'assets/kas.jpg', detail: 'Kapoor & Sons');
final poster2 = Song(songName: 'Matargashti', imglocation: 'assets/tamasha.jpg', detail: 'Tamasha');

final playlist1 = Playlist('Just Wanna Dance', 'Party Mood');
final playlist2 = Playlist('Tute Dil ki Dastan', 'Break up Songs');
final playlist3 = Playlist('Relax and Chill', 'Serene Songs');
final playlist4 = Playlist('Workout Rhythm', 'Inspirational Songs');

final playlists = [playlist1, playlist2, playlist3, playlist4, playlist1, playlist2, playlist3, playlist4];

final top_podcasts = [podcast1, podcast2, podcast1, podcast2];
final latest_podcasts = [podcast3, podcast4, podcast3, podcast4];
final crime_podcasts = [podcast3, podcast3, podcast3];
final sci_podcasts = [podcast4, podcast4, podcast4];

final song_posters = [poster1, poster2, poster1, poster2];

final favs = [song1, song2, song3, song4, song1, song2, song3, song4];
final songlist = [song1, song2, song3, song4, song1, song2, song3, song4];

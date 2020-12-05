import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

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

Stream<QuerySnapshot> getUserPlaylists(String userEmail) {
  Stream<QuerySnapshot> query = Firestore.instance
      .collection('playlist')
      .where('UserEmail', isEqualTo: userEmail)
      .snapshots();
  return query;
}
//
// Stream<QuerySnapshot> getUserPlaylistSongs(String playlistid) {
//   Stream<QuerySnapshot> query = Firestore.instance
//       .collection('playlist')
//       .where('id', isEqualTo: playlistid)
//       .snapshots();
//   return query;
// }


Stream<QuerySnapshot> getPlaylistSongs(String playlistid) {
  Stream<QuerySnapshot> query = Firestore.instance
      .collection('songs')
      .where('playlists', arrayContains: playlistid)
      .snapshots();
  return query;
}

Future<DocumentReference> CreatePlaylist(
    PlaylistName, PlaylistDesc, UserEmail) {
  Future<DocumentReference> query = Firestore.instance
      .collection('playlist')
      .add({
    'name': PlaylistName,
    'description': PlaylistDesc,
    'UserEmail': UserEmail
  });
  print(query);
}

void addSongToPlaylist(String SongId, String playlistId){
  Firestore.instance
      .collection('songs')
      .doc(SongId)
      .updateData({
    'playlists': FieldValue.arrayUnion([playlistId])
  });
}

Stream<QuerySnapshot> GetUserPlaylists(UserEmail) {
  Stream<QuerySnapshot> query = Firestore.instance
      .collection('playlist')
      .where('UserEmail', isEqualTo: UserEmail)
      .snapshots();
  print(query);
}
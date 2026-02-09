import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotlife/main/components/my_drawer.dart';
import 'package:spotlife/main/home/My_Home_Page.dart';
import 'package:spotlife/main/models/playlist_provider.dart';
import 'package:spotlife/main/models/song.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {

  late final dynamic playlistProvider;
  @override
  void initState (){
    super.initState();

    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong( int songIndex){
    playlistProvider.currentSongIndex = songIndex;


    Navigator.push(context, MaterialPageRoute(builder: (context) => Myhomepage(),));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 65.0),
          child: Text(" P L A Y L I S T"),
        ),
      ),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          final List <Song> playlist = value.playlist;


          return ListView.builder(
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                final Song song = playlist[index];

                return ListTile(

                  title: Text(song.songName),
                  subtitle: Text(song.artistName),
                  leading: Image.asset(song.albumArtImagePath),
                  onTap: () => goToSong(index),
                );
              });
        },
      ),
    );
  }
}

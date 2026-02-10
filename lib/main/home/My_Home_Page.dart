import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spotlife/core/app_image.dart';
import 'package:spotlife/main/components/my_drawer.dart';
import 'package:spotlife/main/home/music_page.dart';
import 'package:spotlife/main/home/song_page.dart';
import 'package:spotlife/main/models/playlist_provider.dart';
import 'package:spotlife/main/my_tabs.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage>
    with SingleTickerProviderStateMixin {
  List<dynamic> popularmusic = [];

  late ScrollController _scrollController;
  late TabController _tabController;

  Future<void> readData() async {
    try {
      final String response1 = await rootBundle.loadString('assets/json/popularmusic.json');
      final List data1 = json.decode(response1);



      setState(() {
        popularmusic = data1;

      });
    } catch (e) {
      print("Error loading JSON: $e");
    }
  }


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer <PlaylistProvider>(
      builder: (context, value, child) {
        final playlist =value.playlist;

        final currentSong = playlist[value.currentSongIndex ?? 0];
        return Scaffold(
          drawer: MyDrawer(),

          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(title: Padding(
            padding: const EdgeInsets.only(left:40),
            child: Row(
              children: [
                Text("E X P L O R E"),
                SizedBox(width: 20,),

                Row(

                  children: [

                    Icon(Icons.search,color: Theme.of(context).colorScheme.secondary,
                    ),

                    Icon(Icons.notifications,color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ],
            ),

          ),),
          body: SafeArea(

            child: Column(
              children: [
                SizedBox(height: 30,),


                // SLIDER
                SizedBox(
                  height: 180,
                  child: popularmusic.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : PageView.builder(
                    controller: PageController(viewportFraction: 0.8),
                    itemCount: popularmusic.length,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/${popularmusic[i]["img"]}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: NestedScrollView(
                    controller: _scrollController,
                    headerSliverBuilder: (BuildContext context, bool isScroll) {
                      return [
                        SliverAppBar(
                          pinned: true,
                          backgroundColor:Theme.of(context).colorScheme.background,

                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(50),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: TabBar(
                                indicatorPadding: const EdgeInsets.all(0),
                                indicatorSize: TabBarIndicatorSize.label,
                                labelPadding: const EdgeInsets.only(right: 10),
                                controller: _tabController,
                                isScrollable: true,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 7,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),

                                tabs: [
                                  AppTabs(Colors.red, "New"),
                                  AppTabs(Colors.pink, "Popular"),
                                  AppTabs(Colors.yellow, "Trending"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ];
                    },

                    body: TabBarView(

                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount: popularmusic.length,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),

                                  color: Color(0xFFfdfdfd),
                                  boxShadow: [
                                    BoxShadow(

                                      blurRadius: 2,
                                      offset: Offset(0, 0),
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                  ],
                                ),
                                child:
                                GestureDetector(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MusicPage(),)),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/${popularmusic[i]["img"]}',
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star,color: Colors.amberAccent,size: 24,),
                                                SizedBox(width: 5,),
                                                Text(popularmusic[i]["rating"],style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18
                                                ),)
                                              ],
                                            ),
                                            Text(popularmusic[i]["title"],style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold
                                            ),),
                                            Text(popularmusic[i]["artist"],style: TextStyle(
                                                fontSize: 14, color: Colors.grey
                                            ),),
                                            Container(
                                              width: 40,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Color(0xFF00ace6),
                                              ),
                                              child:Text("Love",style: TextStyle(fontSize: 12,color: Colors.white),),
                                              alignment: Alignment.center,
                                            )


                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),



                              ),
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: popularmusic.length,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFfdfdfd),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      offset: Offset(0, 0),
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                  ],
                                ),
                                child:
                                GestureDetector(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MusicPage(),)),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/${popularmusic[i]["img"]}',
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star,color: Colors.amberAccent,size: 24,),
                                                SizedBox(width: 5,),
                                                Text(popularmusic[i]["rating"],style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18
                                                ),)
                                              ],
                                            ),
                                            Text(currentSong.songName,style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold
                                            ),),
                                            Text(currentSong.artistName,style: TextStyle(
                                                fontSize: 14, color: Colors.grey
                                            ),),
                                            Container(
                                              width: 40,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Color(0xFF00ace6),
                                              ),
                                              child:Text("Love",style: TextStyle(fontSize: 12,color: Colors.white),),
                                              alignment: Alignment.center,
                                            )


                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),



                              ),
                            );
                          },
                        ),

                        ListView.builder(
                          itemCount: popularmusic.length,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFfdfdfd),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      offset: Offset(0, 0),
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                  ],
                                ),
                                child:
                                GestureDetector(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MusicPage(),)),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/${popularmusic[i]["img"]}',
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star,color: Colors.amberAccent,size: 24,),
                                                SizedBox(width: 5,),
                                                Text(popularmusic[i]["rating"],style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18
                                                ),)
                                              ],
                                            ),
                                            Text(currentSong.songName,style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold
                                            ),),
                                            Text(currentSong.artistName,style: TextStyle(
                                                fontSize: 14, color: Colors.grey
                                            ),),
                                            Container(
                                              width: 40,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Color(0xFF00ace6),
                                              ),
                                              child:Text("Love",style: TextStyle(fontSize: 12,color: Colors.white),),
                                              alignment: Alignment.center,
                                            )


                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),



                              ),
                            );
                          },
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );


      },
    );
  }
}

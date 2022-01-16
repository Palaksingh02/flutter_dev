import 'package:flutter/material.dart';
import 'package:movies/description.dart';
import 'package:movies/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            child: modified_text( text: 'Top Rated Movies',color: Colors.white,size: 24,),
          ),
          
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                       Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: toprated[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['poster_path'],
                                      description: toprated[index]['overview'],
                                      vote: toprated[index]['vote_average']
                                          .toString(),
                                      launch_on: toprated[index]
                                          ['release_date'],
                                    )));

                    

                    },
                    child: Container(
                      width: 140,
                      child: Column(children: [
                        Container(
                          height:200,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                            )
                            )),
                            ),
                            SizedBox(height:5),
                            Container(child:modified_text(
                                  size: 15,
                                  text: toprated[index]['title'] != null
                                      ? toprated[index]['title']
                                      : 'Loading',color: Colors.white,),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
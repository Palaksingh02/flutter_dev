import 'package:flutter/material.dart';
import 'package:movies/description.dart';
import 'package:movies/utils/text.dart';

class TV extends StatelessWidget {
  final List tvshows;

  const TV({Key? key, required this.tvshows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(2, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            child: modified_text( text: 'Popular Shows',color: Colors.white,size: 24,),
          ),
          
          SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView.builder(
                itemCount: tvshows.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                       Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: tvshows[index]['original_name'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              tvshows[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              tvshows[index]['poster_path'],
                                      description: tvshows[index]['overview'],
                                      vote: tvshows[index]['vote_average']
                                          .toString(),
                                      launch_on: tvshows[index]
                                          ['first_air_date'],
                                    )));


                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(children: [
                        Container(
                          height:140,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+tvshows[index]['backdrop_path']
                            ),
                            fit: BoxFit.cover
                            ),
                            ),
                            ),
                            SizedBox(height:5),
                            Container(child:modified_text(
                                  size: 15,
                                  text: tvshows[index]['original_name'] != null
                                      ? tvshows[index]['original_name']
                                      : 'Loading', color: Colors.white,),
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
import 'package:flutter/material.dart';
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
            child: modified_text( text: 'Popular Shows',color: Colors.red.shade900,size: 24,),
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
                                      : 'Loading', color: Colors.red.shade900,),
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
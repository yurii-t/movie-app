import 'package:flutter/material.dart';
import 'package:themoviedb/Library/Widgets/Inherited/provider.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/navigation/main_navigation.dart';
import 'package:themoviedb/resources/app_images.dart';
import 'package:themoviedb/widgets/movie_list/movie_list_model.dart';




class MovieListWidget extends StatelessWidget {
    const MovieListWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieListModel>(context);
    if(model == null) return SizedBox.shrink();
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top:70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: model.movies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index){
            model.showMoiveAtIndex(index);
            final movie = model.movies[index];
            final posterPath = movie.posterPath;

            return Padding(padding: EdgeInsets.symmetric(horizontal:16, vertical:10),
            child: Stack(
              children: [
                Container(
                  
                  decoration: BoxDecoration(
                    color:Colors.white,
                    border: Border.all(color:Colors.black.withOpacity(0.2)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                
                clipBehavior: Clip.hardEdge,
                  child: Row(
                    
                     children: 
                     [
                      
                       posterPath != null ? Image.network(ApiClient.imageUrl(posterPath), width: 95,): SizedBox.shrink(),
                       SizedBox(width:15),
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             SizedBox(height:20),
                             Text(
                               movie.title,
                               style: TextStyle(fontWeight: FontWeight.bold),
                               maxLines: 1,
                               overflow: TextOverflow.ellipsis,

                             ),
                             SizedBox(height:5),
                             Text(
                               model.stringFormatDate(movie.releaseDate),
                               style: TextStyle(color: Colors.grey),
                               maxLines: 1,
                               overflow: TextOverflow.ellipsis,

                             ),
                             SizedBox(height:20),
                             Text(
                              movie.overview,
                               
                               maxLines: 2,
                               overflow: TextOverflow.ellipsis,

                             ),
                           ],
                           
                         ),
                       )

                     ],
                     ),
                ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => model.onMovieTap(context, index),
                  ),
              ),
              ],
            ),
            
            );
          
        }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            onChanged: model.searchMovie,
            controller: null,
            decoration: InputDecoration(
              labelText: 'Search',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),

            ),
          ),
        ),
      ],
    );
  }
}
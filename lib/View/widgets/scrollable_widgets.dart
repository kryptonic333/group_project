import 'package:flutter/material.dart';
import 'package:group_project/Model/data.dart';


class ScrollableWidgets extends StatelessWidget {

  final double height;
  final double width;
  final bool showTiltle;
  final List<Game> gamesData;

   const ScrollableWidgets({super.key,required this.height, required this.width, required this.gamesData,required this.showTiltle});
  
  
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: gamesData.map((game) {
          return Padding(
            padding:  EdgeInsets.only(right: width * 0.03),
            child: SizedBox(
              height: height,
              width:  width*0.30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                Container(
                  height: height*0.80,
                  width: width*0.45,
                  decoration: 
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    
                    image: DecorationImage(
                      fit: BoxFit.cover,
            
                      image: NetworkImage(game.coverImage.url)),),),
                      showTiltle ? Text(game.title,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: height*0.05,
                        color: Colors.white),
                      ): Container(),
                ]
                 ),
            ),
          );
            
        }).toList(),

      ),
      );
  }
}
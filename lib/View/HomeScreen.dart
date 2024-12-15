import 'package:flutter/material.dart';
import 'package:group_project/View/widgets/scrollable_widgets.dart';
import '../Model/data.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  // These variables are use to store the device screen height and width
  var _deviceHeight;
  var _deviceWidth;

  // This variable is used to store the index of the currently selected page
  var _selectedGame = 0;

  @override
  void initState() {
   
    super.initState();
    _selectedGame = 0;
  }
  @override
  Widget build(BuildContext context) {
    // In Flutter, MediaQuery is a powerful widget used to retrieve 
    // information about the current screen size, device orientation, and other device-specific properties. 
    // It enables responsive design by adapting your app’s layout based on the device's characteristics.
     _deviceHeight = MediaQuery.of(context).size.height;
     _deviceWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Stack(
        children: [
          _featuredGameWidget(),
          _gradientBoxWidget(),
          _topLayerWidget(),
          
        
      ]),
    );
  }


  // This function is used to display the featured games
  Widget _featuredGameWidget(){
    return SizedBox(
      height:_deviceHeight*0.50
       ,width:_deviceWidth ,
       child: PageView(
          onPageChanged: (index) 
          {
            setState(() {
              _selectedGame = index;
            });
          },
          scrollDirection: Axis.horizontal,
          children: featuredGames.map((game){
            return  Container(
                // margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    
                    image: NetworkImage(game.coverImage.url)
                  )
                ),
              
            );
          }).toList(),
            
          
        )
    );
  }

  // This function is used to display the gradient box
  Widget _gradientBoxWidget(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
      height: _deviceHeight*0.80,
      width: _deviceWidth,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(35, 45, 59, 1.0),
            Colors.transparent
          ],
          stops: [0.65,0.80],
          begin: Alignment. bottomCenter,
          end: Alignment.topCenter
      )),
    ),
      );
  }

  Widget _topLayerWidget(){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: 
        [
          _topBarWidget(),
          SizedBox(
            height: _deviceHeight*0.14,
          ),
         
         _featuredGamesInfoWidget(),
         Padding(
           padding: EdgeInsets.symmetric(
            
            vertical: _deviceHeight*0.01
            ),
           child: ScrollableWidgets(
            height: _deviceHeight*0.24, 
            width: _deviceWidth, 
            gamesData: games, 
            showTiltle: true
            ),
         ),
         _featuredGamesBannerWidget(),
         ScrollableWidgets(height: 
         _deviceHeight*0.22, width: _deviceWidth, gamesData: games2, showTiltle: false)
      
      
      
        ],
        ),
    );
  }


  // This Function is going to return the top bar widget
  Widget _topBarWidget(){
    return  SizedBox(
      height: _deviceHeight*0.13,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.menu,
          color: Colors.white,
          size: 32,
          ),
          Row(children: [
            const Icon(Icons.search,
          color: Colors.white,
          size: 32,
          ),
          SizedBox(width: _deviceWidth*0.03,),
          const Icon(Icons.notifications_rounded,
          color: Colors.white,
          size: 32,
          ),
          ],)
          
        ],    
      ),
    );

      
}
Widget _featuredGamesInfoWidget()
    {
      return SizedBox(
        height: _deviceHeight*0.12,
        width: _deviceWidth,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          
          children:    [
            
            Text(featuredGames[_selectedGame].title,
            maxLines: 2,
            style: 
            TextStyle(color: Colors.white,
            fontSize: _deviceHeight*0.03,
            fontWeight: FontWeight.bold),),
            SizedBox(
            height: _deviceHeight*0.02,
          ),
             Row(
               
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children:
              featuredGames.map((game){
                bool isActive = game.title == featuredGames[_selectedGame].title;
                double circleRadius = _deviceHeight * 0.004;
                return Container(
                margin: EdgeInsets.only(right: _deviceWidth * 0.015),
                height: circleRadius *2,
                width:circleRadius *2 ,
                decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
              ); }).toList(), 
              
            )
          ],),
      );
    }

    Widget _featuredGamesBannerWidget(){
      return 
         Container(
          height: _deviceHeight*0.10,
          width: _deviceWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(featuredGames[3].coverImage.url)
            )
          ),
        
      );
    }
}
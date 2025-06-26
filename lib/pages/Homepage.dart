import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_state.dart';
import 'package:travel_app/ui/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/apptext.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
  

}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin  {
    static const String imgurBaseUrl = "https://i.imgur.com/";

  var images ={
    "balloning.png":"Balloning",
    "hiking.png":"Hiking",
    "kayaking.png":"Kayaking",
    "snorkling.png":"Snorkling"
  };
  

  
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitState>(
        builder: (context, state){
          if(state is LoadedState){
            var info = state.places;
            return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu
          Container(            
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Row(              
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black54,),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5)

                  ),
                ),
              ],
            ),
          ),
         SizedBox(height: 30,),
         // discover text
         Container(
          margin: const EdgeInsets.only(left: 20),
          child: AppLargeText(text: "Discover"),
         ),
         SizedBox(height: 20,),
         //tabbar
         Container(
          child: Align(
            // alignment: Alignment.centerLeft,
            child: TabBar(
              
              
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              dividerColor:Colors.white,            
              controller : _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
               isScrollable: true,
               indicatorSize: TabBarIndicatorSize.label,
               indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
              tabs: [            
              Tab(text:"Places"),
              Tab(text:"Inspiration"),
              Tab(text:"Emotions"),
            ]
            ),
          ),
         ),
         Container(
          padding: const EdgeInsets.only(left: 20),
          height: 280,
          width: double.maxFinite ,
          child: TabBarView(
            controller : _tabController,
            children: [
              ListView.builder(
                 itemCount: info.length,                
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) { 
                  return  GestureDetector(                    
                      onTap: () {
                        BlocProvider.of<AppCubits>(context).detailpage(info[index]);
                      },                     
                   
                    child: Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(image:  NetworkImage(imgurBaseUrl + info[index].img + ".jpg"),
                      // AssetImage("img/mountain.jpeg"),
                      fit: BoxFit.cover)
                    ),
                                    
                                    ),
                  );

                 },
                
              ),
              Text("data"),
              Text("bye")
            ]),),
          SizedBox(height: 23,),
           Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore more", size: 22,),
                Apptext(text: "see all", color: AppColors.textColor1,)
              ],
             ), 
           ),
           SizedBox(height: 10,),           
           Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(right: 30) ,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
              return Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Container( 
                      //  margin: const EdgeInsets.only(right: 50),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(image: AssetImage("img/"+images.keys.elementAt(index)),
                      fit: BoxFit.cover)
                    ),),
                    SizedBox(height: 10,),
                    Container(
                            child: Apptext(text: images.values.elementAt(index), color: AppColors.textColor2, size: 14,),
                           )
                  ],
                ),
              );
            }),
           ),
           
        ],
      );

          }       
        else{
          return Container();
        }
          
        })
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius:radius);
  }

}
class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, 
  ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color=color;
    _paint.isAntiAlias =true;
    final Offset circleOffset = Offset(configuration.size!.width/2 -radius/2, configuration.size!.height - radius/2);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
    // cTODO: implement paint
  }
}
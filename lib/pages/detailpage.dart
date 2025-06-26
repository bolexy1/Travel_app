import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_state.dart';
import 'package:travel_app/ui/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/appbuttons.dart';
import 'package:travel_app/widgets/apptext.dart';
import 'package:travel_app/widgets/responsivebutton.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  int SelectedIndex=-1;
  int gottenstars=4;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits,CubitState>(
      builder: (context, state){
        DetailState detail = state as DetailState;
        return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [

            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 320,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:AssetImage("img/mountain.jpeg"),
                  )
                ),
              ) ),
            Positioned(
              left: 20,
              top: 50,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    BlocProvider.of<AppCubits>(context).goHome();
                  }, icon: Icon(Icons.menu),
                  color: Colors.white ,),
                  
                  // Icon(Icons.do_not_step)
                ],
              )
              ),
            Positioned(
              top: 250,
              child: Container(
                padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(                      
                      children: [
                        AppLargeText(text:"Yosemite", size: 26, color: Colors.black.withOpacity(0.8),),
                        Expanded(child: Container()),
                        AppLargeText(text: "\$ 250", size: 26, color: AppColors.mainColor)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor,),
                        SizedBox(width: 5,),
                        Apptext(text: "USA, Califonia", color: AppColors.textColor1,),                       
                      ],                      
                    ),
                    SizedBox(height: 20,),
                   Row(
                    children: [
                       Wrap(                      
                      children: 
                        List.generate(5, (index){
                          return Icon(Icons.star, color:index<gottenstars? AppColors.starColor:AppColors.textColor2,);
                        }),                      
                    ),
                    SizedBox(width: 10,),
                    Apptext(text: "(4.0)", color: AppColors.textColor2,)

                    ],
                   ),
                   SizedBox(height: 25,),
                   AppLargeText(text: "People",color: Colors.black.withOpacity(0.8),size: 20,),
                   SizedBox(height: 5,),
                   Apptext(text: "Number of peopple in your group", color: AppColors.mainTextColor,),
                    SizedBox(height: 10,),
                   Wrap(
                    children: List.generate(5, (index){
                      return InkWell(
                        onTap: (){
                          setState(() {
                            SelectedIndex=index;
                          });

                        
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Appbuttons(
                            color: SelectedIndex==index?Colors.white:Colors.black, 
                            size: 50, 
                            backgroundcolor: SelectedIndex==index?Colors.black:AppColors.buttonBackground, 
                            borderColor: SelectedIndex==index?Colors.black:AppColors.buttonBackground,
                            text: (index+1).toString(),),
                        ),
                      );

                    }),
                   ),
                   SizedBox(height: 20,),
                   AppLargeText(text: "Description",size: 20,color: Colors.black.withOpacity(0.8),),
                   SizedBox(height: 10,),
                   Apptext(text: "You must go for a travel. Travelling helps get rid of pressure. Go to the mountains to see the nature",color: AppColors.mainTextColor,),

                  
                  ],
                ),
              ),
              ),
               Positioned(
                    bottom: 20,
                    left: 20,    
                    right: 20,                
                     child: Row(                      
                      children: [                      
                        Appbuttons(
                          color: AppColors.textColor2, 
                          size: 60, 
                          backgroundcolor: Colors.white, 
                          borderColor: AppColors.textColor2,
                          
                          isIcon: true,
                          icon: Icons.favorite_border,),
                          SizedBox(width: 20,),
                          Responsivebutton(isResponsive: true,),

                          
                                          
                      ],
                     ),
                   ),
             
            
          ],
          
        ),
      ),
    );
 
      }); }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_state.dart';
import 'package:travel_app/pages/Homepage.dart';
import 'package:travel_app/pages/detailpage.dart';
import 'package:travel_app/pages/welcomepage.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({super.key});

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitState>(
        builder: (context, state){
          
          if(state is WelcomeState){
            return Welcomepage();
          }
          if(state is Detailpage){
            return Detailpage();
          }
          if(state is LoadedState){
            return Homepage();
          }      
          if(state is LoadingState){
            return Center(child: CircularProgressIndicator(),);
          }
           
          else{
            return Container();
          }
        }
        ),
    );
  }
}
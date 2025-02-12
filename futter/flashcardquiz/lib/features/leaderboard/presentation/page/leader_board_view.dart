import 'package:flashcardquiz/features/leaderboard/presentation/bloc/leader_board_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/leader_board_bloc.dart';

class LeaderBoardView extends StatefulWidget {
  const LeaderBoardView({super.key});

  @override
  State<LeaderBoardView> createState() => _LeaderBoardViewState();
}

class _LeaderBoardViewState extends State<LeaderBoardView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leader Board",
          style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Color(0xff12CBC4),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
                color: Color(0xff12CBC4),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              Icons.person,
                              size: 50,
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Robiul Emon",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              "Total Score:222",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey),
                            ),
                            Text(
                              "Rank: ${index + 1}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey),
                            ),


                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child: BlocBuilder<LeaderBoardBloc, LeaderBoardState>(
                builder: (context, state) {

                  if(state is LeaderBoardLoaded){
                    return ListView.builder(
                      itemCount: state.leaderBoards.length,
                      itemBuilder: (context, index) {
                        final totalScore=state.leaderBoards[index].totalScore;
                        return Card(
                          child: ListTile(
                            title: Text("Name: Robiul Sunny Emon",
                              style: TextStyle(color: Color(0xff12CBC4)),),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Rank: ${index+1}"),
                                Text("Score: $totalScore"),
                                Text("Country: Bangladesh"),
                              ],
                            ),

                          ),
                        );
                      },
                    );
                  }else{
                    return Container(
                      child: Center(child: Text(" no leader board"),),
                    );
                  }
                },
              )
          )
        ],
      ),
    );
  }
}

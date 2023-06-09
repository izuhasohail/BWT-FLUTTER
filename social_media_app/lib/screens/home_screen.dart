import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:social_media_app/config/palette.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/widgets/circle_button.dart';
import 'package:social_media_app/widgets/create_post_container.dart';
import 'package:social_media_app/widgets/widgets.dart';
import 'package:social_media_app/models/post_model.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            //brightness: Brightness.white,
            title: Text(
              'facebook',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2
              ),

              
            ),
            centerTitle: false,
            floating: true,
            actions: [
             CircleButton(
              icon: Icons.search,
               iconSize: 30.0,
                onPressed: ()=>print('Search')
                ),
                CircleButton(
              icon: MdiIcons.facebookMessenger,
               iconSize: 30.0,
                onPressed: ()=>print('Messenger')
                ),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser:currentUser),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers:onlineUsers),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child:Stories(
                currentUser:currentUser,
                stories:stories,
                )),
            ),
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
              final Post post=posts[index];


              return PostContainer(post:post);
            } ))
          
          
        ],
      ),
    );
  }
}
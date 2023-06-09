
import 'package:flutter/material.dart';
import 'package:social_media_app/models/models.dart';
import 'package:social_media_app/widgets/widgets.dart';
export 'circle_button.dart';
export 'create_post_container.dart';
class CreatePostContainer extends StatelessWidget {
  
  final User currentUser;
  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
    
      //color: Colors.orange,
      child:Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl:currentUser.imageUrl),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(hintText: 'What\'s on your mind?'),
                ),
              )
            ],
          ),
          const Divider(
            height:10.0 ,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(onPressed: ()=>print('Live'), 
                 icon: const Icon(
                  Icons.videocam,
                 color: Colors.red,),
                 label: Text('Live'),),
          
                 const VerticalDivider(width: 8.0,),
                
                 TextButton.icon(onPressed: ()=>print('Photo'), 
                 icon: const Icon(
                  Icons.photo_library,
                 color: Colors.green,),
                 label: Text('Photo'),),
          
                 const VerticalDivider(width: 8.0,),
                 TextButton.icon(onPressed: ()=>print('Room'), 
                 icon: const Icon(
                  Icons.video_call,
                 color: Colors.purpleAccent,),
                 label: Text('Room'),),
                 const VerticalDivider(width: 8.0,),
          
              ],
            ),
          ),
        ],
      ) ,
    );
  }
}
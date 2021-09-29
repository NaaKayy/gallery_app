import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),
);
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.blue),
             titleTextStyle: TextStyle(color: Colors.blue, fontSize: 18),
             elevation: 0.5
        )
      ),
      home: Homeview(),
    );
  }
}

class Homeview extends StatelessWidget {
  Homeview({Key? key,}) : super(key: key);

  static const List<String> _images = [
    'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
    'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
    'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
    'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'
  ];

  final List<Map<String,String>> _posts =[{
   'name' :'Ayele',
   'profile_pic':'https://images.unsplash.com/photo-1598801702116-d363794e5976?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDN8dG93SlpGc2twR2d8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
   'post_image':'https://images.unsplash.com/photo-1631761320198-4bc79af9029b?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDMwfHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
   'location':'Kumasi, Ghana',
  },
  {
   'name' :'Patience',
   'profile_pic':'https://images.unsplash.com/photo-1632033526224-9fc8a4f76d6f?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDMzfHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
   'post_image':'https://images.unsplash.com/photo-1632090947779-9af3a457e6e1?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDMyfHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
   'location':'Accra, Ghana',
  },
  {
   'name' :'John',
   'profile_pic':'https://images.unsplash.com/photo-1631701119265-33ca2b80d00d?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM4fHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
   'post_image':'https://images.unsplash.com/photo-1623786191836-a4d671a6302b?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDQwfHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
   'location':'Cape Coast , Ghana',
  }];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: false,
        title: const Text("Gallery"),
        actions: [
          IconButton(onPressed: (){},
           icon: const Icon(CupertinoIcons.camera))
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left:16.0, bottom: 10),
            child: Text
            ('Today',style: TextStyle(fontSize:32,
            fontWeight: FontWeight.w600),),

          ))
          ),
      ),
    body: ListView.builder(itemBuilder: (context,index){
      return  CompletePostWidget(
        images: _images,
        name: _posts[index]['name']!,
        profilePic: _posts[index]['profile_pic']!,
        postImage:  _posts[index]['post_image']!,
        location:  _posts[index]['location']!,
      );
    },
    itemCount: _posts.length,),
    );

  }
}

class CompletePostWidget extends StatelessWidget {
  const CompletePostWidget({
    Key? key,
    required List<String> images, required this.name, required this.postImage, required this.profilePic, required this.location,
  }) : _images = images, super(key: key);

  final List<String> _images;
  final String name;
  final String postImage;
  final String profilePic;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      elevation: 0,
      child: Column(
        children:[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(profilePic),
            ),
            title: Text(name ,style:const TextStyle(fontSize:18,
            fontWeight: FontWeight.w600),), 
            subtitle: Row(children:  [
              const Icon(Icons.location_on,size: 14,color: Colors.blue),
              Text(location,
            style:const TextStyle(fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.grey),)
            ],),
          ),
          Image.network(postImage,height: 250,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           Row(
             children: [
               const  PostHelperWidget(icon: Icon(Icons.favorite,color: Colors.red,),
                countTxt: '123',),
                FlutterImageStack(
     imageList: _images,
     showTotalCount: true,
     totalCount: _images.length,
     itemRadius: 30, // Radius of each images
     itemCount: 3, // Maximum number of images to be shown in stack
     itemBorderWidth: 3, // Border width around the images
      ),
             ],
           ),
      const PostHelperWidget(icon: Icon(CupertinoIcons.chat_bubble, color: Colors.grey),countTxt: '123',),
          ],)
        ],)
      );
  }
}

class PostHelperWidget extends StatelessWidget {
  const PostHelperWidget({
    Key? key, required this.countTxt, required this.icon,
  }) : super(key: key);

final String countTxt;
final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade100,
      borderRadius:BorderRadius.circular(35),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
        icon,
        Text(countTxt, style: const TextStyle(color: Colors.grey))
        ],),
      ),
    );
  }
}

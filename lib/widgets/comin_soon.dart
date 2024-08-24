import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  final String imageURL;
  final String overView;
  final String logoURL;
  final String month;
  final String day;

  const ComingSoon({super.key,
    required this.imageURL,
    required this.overView,
    required this.logoURL,
    required this.month,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.only(left: 10.0,top: 100.0),
            child: Column(
              children: [
                Text(
                  month,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 5.0,),
                Text(
                  day,
                  style: const TextStyle(color: Colors.white,fontSize: 40),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: imageURL,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 350,
                    width: 310,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10),),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: SizedBox(
                      height: 100,
                      width: 150,
                      child: CachedNetworkImage(
                        imageUrl: logoURL,
                        alignment: Alignment.centerLeft,
                      ),
                    ),),
                    const SizedBox(width: 20.0,),
                    Column(
                     children: [
                       IconButton(onPressed: (){}, icon: const Icon(
                         Icons.notification_important,
                         color: Colors.white,
                       )),
                       const Text('Remind me',style: TextStyle(fontSize: 14),),
                     ],
                    ),
                    const SizedBox(width: 5.0,),
                    Column(
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(
                            Icons.info,
                            color: Colors.white,
                        )),
                        const Text('Info',style: TextStyle(fontSize: 14),),
                      ],
                    ),
                    const SizedBox(width: 20.0,),
                  ],
                ),
                const SizedBox(height: 20.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Coming on $month $day", style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 5.0,),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(overView,style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey
                      ),
                      textAlign: TextAlign.justify,),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

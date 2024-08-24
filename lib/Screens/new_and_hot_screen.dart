import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlix_clone/Common/utils.dart';
import 'package:netlix_clone/widgets/comin_soon.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Kbackgroundcolor,
            appBar: AppBar(
              title: const Text('New & Hot', style: TextStyle(color: Colors.white),),
              actions: [
                IconButton(onPressed: (){},
                    icon: const Icon(Icons.cast,color: Colors.white,)),
                const SizedBox(width: 20,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    color: Colors.blue,
                    height: 27,
                    width: 27,
                  ),
                ),
                const SizedBox(width: 20,)
              ],
              bottom:  TabBar(
                dividerColor: Colors.black,
                isScrollable: false,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white
                ),
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),
                  unselectedLabelColor: Colors.white,
                  tabs: const [
                Tab(
                  text: ' 🍿 Coming soon ',
                ),
                Tab(
                  text: " 🔥 Everyone's Watching ",
                )
              ]),
            ),
            body: const TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ComingSoon(
                          imageURL: 'https://i.pinimg.com/736x/7a/d1/f5/7ad1f5ebe6436197d2551e2a12202bb1.jpg',
                          overView: "In 1980s Indiana, a group of young friends witness supernatural forces and secret government exploits. As they search for answers, the children unravel a series of extraordinary mysteries.",
                          logoURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAPZtjzQdverRm37KEEPcMAKpuBMXGU-427A&s',
                          month: "July",
                          day: "20"),
                      ComingSoon(
                          imageURL: 'https://i.ytimg.com/vi/Lm8p5rlrSkY/maxresdefault.jpg',
                          overView: "In 1980s Indiana, a group of young friends witness supernatural forces and secret government exploits. As they search for answers, the children unravel a series of extraordinary mysteries.",
                          logoURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTIMA_8hXcYdAOTYx0uOSx8knGb8BVK2Vw8w&s',
                          month: "Oct",
                          day: "25")
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ComingSoon(
                          imageURL: 'https://i.ytimg.com/vi/Lm8p5rlrSkY/maxresdefault.jpg',
                          overView: "In 1980s Indiana, a group of young friends witness supernatural forces and secret government exploits. As they search for answers, the children unravel a series of extraordinary mysteries.",
                          logoURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTIMA_8hXcYdAOTYx0uOSx8knGb8BVK2Vw8w&s',
                          month: "Oct",
                          day: "25"),
                      ComingSoon(
                          imageURL: 'https://i.pinimg.com/736x/7a/d1/f5/7ad1f5ebe6436197d2551e2a12202bb1.jpg',
                          overView: "In 1980s Indiana, a group of young friends witness supernatural forces and secret government exploits. As they search for answers, the children unravel a series of extraordinary mysteries.",
                          logoURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAPZtjzQdverRm37KEEPcMAKpuBMXGU-427A&s',
                          month: "July",
                          day: "20"),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
       );
  }
}

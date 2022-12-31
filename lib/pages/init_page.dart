import 'package:flutter/material.dart';
import 'package:youtube_api/pages/home_page.dart';
import 'package:youtube_api/ui/general/colors.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _currendIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    const Center(
      child: Text('short'),
    ),
    const Center(
      child: Text('agregar'),
    ),
    const Center(
      child: Text('suscription'),
    ),
    const Center(
      child: Text('biblioteca'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbranprimarycolor,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kbranprimarycolor,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white60,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: _currendIndex,
          onTap: (value) {
            _currendIndex = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
                label: 'Principal', icon: Icon(Icons.home)),
            const BottomNavigationBarItem(
                label: 'short', icon: Icon(Icons.play_circle)),
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: const Icon(
                      Icons.add_circle_outline,
                      size: 35,
                    ))),
            const BottomNavigationBarItem(
                label: 'Suscrpciones', icon: Icon(Icons.subscriptions)),
            const BottomNavigationBarItem(
                label: 'Biblioteca',
                icon: Icon(Icons.video_collection_rounded)),
          ]),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: kbranprimarycolor,
        elevation: 0,
        title: Image.network(
            'http://verpeliculaslatino.com/wp-content/uploads/2018/02/Ver-Peliculas-Latino.png',
            height: 50,
            ),
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.cast)),
              IconButton(onPressed: (){}, icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(Icons.notifications_none),
                  Positioned(
                    top: -2,
                    right: -4,
                    child: Container(
                      padding: EdgeInsets.all(2.3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red
                      ),
                      child: Text('+9',style: TextStyle(fontSize: 10),),
                    ),
                  )
                ],
              )),
              IconButton(onPressed: (){}, icon: const Icon(Icons.search)),

              const CircleAvatar(
                backgroundColor: Colors.white12,
                radius: 15,
                backgroundImage: NetworkImage(
                  'https://www.caritas.org.mx/wp-content/uploads/2019/02/cualidades-persona-humanitaria.jpg'
                ),
              ),
              const SizedBox(width: 12,)
            ],
      ),
      body: _pages[_currendIndex],
    );
  }
}

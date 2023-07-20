import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const BottomNavigationBarApp());

class BottomNavigationBarApp extends StatelessWidget {
  const BottomNavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarHome(),
    );
  }
}

//하단 네비게이션 홈
class BottomNavigationBarHome extends StatefulWidget {
  const BottomNavigationBarHome({super.key});

  @override
  State<BottomNavigationBarHome> createState() =>
      _BottomNavigationBarState();
}

class _BottomNavigationBarState
    extends State<BottomNavigationBarHome> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeBody(),
    SearchBody(),
    ProgressListBody(),
    ChatBody(),
    MyInfoBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '탐색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.holiday_village_outlined),
            label: '진행목록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mark_unread_chat_alt_outlined),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind_outlined),
            label: '내 정보',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}


//홈
class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("홈"),
        ],
      ),
    );
  }
}

//탐색
class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("탐색"),
        ],
      ),
    );
  }
}

//진행목록
class ProgressListBody extends StatelessWidget {
  const ProgressListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Text("안전한 집 찾기 안전집사가 함께해요.", style: TextStyle(fontSize: 25),),
          ),
        ],
      ),
    );
  }
}

//채팅
class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
            child: Row(
              children: [
                Icon(Icons.forum, color: Color(0xFF088A85),),
                SizedBox(width: 10, height: 0,),
                Text("아직 중개사님이 작성한 댓글이 없어요", style : TextStyle(fontSize:19, color : Color(0xFF088A85))),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(4),
            ),
            width: double.infinity,
            child: const Text("작성한 댓글 없음", style: TextStyle(fontSize: 16, color: Colors.grey),  textAlign: TextAlign.center),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 10, 20, 30),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF8ECE0),
              borderRadius: BorderRadius.circular(4),
            ),
            width: double.infinity,
            child: const Text("문의한 매물 채팅도 현재 화면에서 가능하도록 곧 업데이트 할 예정입니다. 문의한 매물 채팅은 하단의 진행목록 탭을 통해 진행해주세요.", style: TextStyle(fontSize: 19, color: Color(0xFF886A08)),  textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

//내 정보
class MyInfoBody extends StatelessWidget {
  const MyInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['알림 리스트', '선호하는 집 조건', '고객센터', '계정관리', '로그아웃'];
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("내 정보", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                const SizedBox(height: 30,),
                const Text("내이름", style: TextStyle(fontSize: 22),),
                const SizedBox(height: 25,),
                GestureDetector(
                  onTap: (){
                    _launchURL();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black26),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.assignment_outlined, color: Colors.lightBlueAccent,),
                            SizedBox(width: 10,),
                            Text("안전집사 보증보험 리포트 신청하기", style: TextStyle(fontSize: 14),),
                            Icon(Icons.chevron_right,),
                          ],
                        ),
                        Text("보험 가능여부, 오늘 기준 알려드려요! (앱에 없는 집 가능)",style: TextStyle(fontSize: 12, color: Colors.grey),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),Container(width: double.infinity, height: 10, color: const Color(0XFFF2F2F2),),
          Expanded(child:
            ListView.separated(
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    if(index == entries.length-1) {

                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    child: Text(entries[index], style:const TextStyle(fontSize: 20),),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            )
          ),
        ],
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://safejibsa.com/?open=1';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

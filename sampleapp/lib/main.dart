import 'package:flutter/material.dart';

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
        children: [

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
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
            child: Row(
              children: [
                Icon(Icons.forum, color: Colors.teal,),
                SizedBox(width: 10, height: 0,),
                Text("아직 중개사님이 작성한 댓글이 없어요", style : TextStyle(color : Colors.teal)),
              ],
            ),
          ),
          TextButton(
            onPressed: (){},
            child: Text("작성한 댓글 없음", style: TextStyle(color: Color(0xffb2babb)),), style: TextButton.styleFrom(fixedSize:Size(300, 100) ,backgroundColor: Color(0xfff4f6f7),),
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
    return const Scaffold(
      body: Column(
          children: [
          Text("내 정보"),
      ],
    ),
    );
  }
}

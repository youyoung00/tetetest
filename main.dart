import 'package:flutter/material.dart';
import 'package:sh_selfstudy_ver0417/models/mainDataModel.dart';
import 'package:sh_selfstudy_ver0417/models/subModel.dart';
import 'pageTwo.dart';

void main(){runApp(new App());}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // Widget - Build
      home: MainPage(), // Build -> items()
    );
  }
}

// Widget
class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PartActions _partActions = new PartActions();

  List<Widget> _myActions = false ? Container() :[
    new IconButton(
      icon: Icon(Icons.settings),
      onPressed: (){
        // ...
        return;
        // print("asd"); // 동작 X
      },
    ),
  ];

  List<Widget> _myFuncActions(){
    return [
      new IconButton(
        icon: Icon(Icons.settings),
        onPressed: (){
          // ...
          return;
          // print("asd"); // 동작 X
        },
      ),
    ];
  }

  List<Map<String, dynamic>> sData = [
    // 장르1 - 장르 이름, 장르의 노래 '들'
    // -- 노래 : 노래 제목, 가수 이름, 가사, 앨범 자켓
    // 장르2 - 장르 이름, 장르의 노래 '들'
    {
      "title" : "댄스",
      "datas" : [
        {
          "title" : "댄스노래1",
          "name" : "댄스가수1",
          "des" : """뻔히 봐놓고 답장은 안 해
얼마나 바쁘시길래
끝나고 뭐해 얼굴 좀 볼까
오늘 우리 얘기 좀 해
언뜻 패턴은 비슷하지만
연애 초기 그것관 달라
모른 척 해도 이건 더 이상
밀고 당기기가 아냐
미묘한 신경전들이 더는 
필요치 않은 사이
늘어질 대로 늘어져가는 
Running time
눈칠 살피며 시간만 끌어
애태우는 저의가 뭐야
유통기한은 끝난 지 오래
상해도 한참 상했지
혀 끝을 지나기도 전에 벌써 
지루해져 버린 내 이름
애인스럽게 불려본 게 언제던가 짠해
다시 끓기도 푹 식히기도
뜻뜨미적지근한 온도
끝이 보이질 않는 이 눈치 게임
하루도 더 못해 그래 내가 졌어
에라이 비겁한 남자야

출처: https://soulmatt.tistory.com/entry/아이유-IU-Modern-Times-앨범-전곡-노래-가사 [몽대원의 자료창고]""",
          "image": "https://cdn.pixabay.com/photo/2020/09/20/14/08/woman-5587219__480.jpg"},
        {
          "title" : "댄스노래2",
          "name" : "댄스가수2",
          "des" : "가사2",
          "image": "https://cdn.pixabay.com/photo/2021/04/26/10/48/lake-6208614__480.jpg"}
      ]
    },
    {
      "title" : "발라드",
      "datas" : [
        {
          "title" : "발라드노래1",
          "name" : "발라드가수1",
          "des" : "...",
          "image": "https://cdn.pixabay.com/photo/2020/01/21/16/26/yorkshire-terrier-4783327__480.jpg"},
        {
          "title" : "발라드노래2",
          "name" : "발라드가수2",
          "des" : "...",
          "image": "https://cdn.pixabay.com/photo/2020/01/21/16/26/yorkshire-terrier-4783327__480.jpg"}
      ]
    }
  ];

  List<MainDataModel> vData;

  @override
  void initState() {
    setState(() {
      // * 가장 쉬운 -- >
      // 언제나 한번만 동작하는 것을 보장
      vData = this.sData.map<MainDataModel>((Map<String, dynamic> e){
        return new MainDataModel(
          title: e["title"].toString(),
          datas: List.from( e["datas"]).map<SubModel>(
              (v) => new SubModel(
                title: v['title'].toString(),
                name: v['name'].toString(),
                des: v['des'].toString(),
                image: v['image'].toString()
              )
          ).toList()
        );
      }).toList();
      // [ new MainDataMode(), new MainDataMode(), new MainDataMode(),  ]
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // ...
    // ---> Flutter Build 가 언제 시작되는지 정확히 제어 불가능
    // ---> Build 한번만 실행 된다는 보장이 없음

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        // leading: Container(),
        backgroundColor: Colors.green,
        title: Text("LOGO"),
        centerTitle: true,
        // (1)
        actions: [
          new IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
              // ...
              return;
              // print("asd"); // 동작 X
            },
          ),
        ],
        // (2) 변수
        // actions: this._myActions,
        // (3) 함수
        // actions: this._myFuncActions(),
        // (4 - 1) 클래스
        // actions: [ new MyIconSetting1() ],
        // (4 - 2) 리스트<클래스>
        // (4 - 2 - 1)
        // actions: new PartActions().actionsWidget(),
        // (4 - 2 - 2)
        // actions: this._partActions.actionsWidget(),
        // (4 - 2 - 3)
        // actions: this._partActions.actionsWidget2,
        // (4 - 2 - 4)
        // actions: PartActions.actionsWidget3,
        // (4 - 2 - 5)
        // actions: PartActions.actionsWidget4(),
      ),
      body: this.vData == null
        ? Center(child: Text("로딩중..."),)
        : new GridView.builder(
        padding: new EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        // scrollDirection: Axis.horizontal,
        // children: [
        //   this._items(), // new Containr(....)
        //   this._items(), // new Containr(....)
        //   this._items(), // new Containr(....)
        //   this._items(), // new Containr(....)
        //   this._items(), // new Containr(....)
        //   Container(color: Colors.blue,),
        //   Container(color: Colors.yellow,),
        // ],
        // children: [1,2,3,4,5].map<Widget>((int e) => this._items(e)).toList(),
        // [ new Container(...), ... , ... , ... , ]
        // itemCount: this.sData.length, // 6개 // 2개...+-
        itemCount: this.vData.length,
        itemBuilder: (BuildContext context, int i){ // 0번째,1번째,2..,3..,4..,5.., itemCount-1번째까지 반복 --> List
          // return Container();
          return this._items(i, context); // data[0]
        },
      ),
    );
  }

  List<int> data = [1,2,3,4,5,6];

  Widget _items(int i, BuildContext context){
    // InkWell
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context){
              // return Scaffold(appBar: AppBar(),);
              return new PageTwo(
                // title: this.sData[i]['title'].toString(),
                // datas: List.from(this.sData[i]['datas'])
                title: this.vData[i].title,
                datas: this.vData[i].datas,
              );
            }
          )
        );
        // push
        // pop

        return;
      },
      child: new Container(
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.orange,
              child: Icon(Icons.more_horiz),
              // width: (MediaQuery.of(context).size.width/2)-15.0,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 10.0),
            ),
            Container(
              width: 60.0,
              height: 60.0,
              // color: Colors.red,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(60.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://images.unsplash.com/photo-1611095965923-b8b19341cc29?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60")
                  )
              ),
            ),
            Container(
              child: Text(
                // this.sData[i]["title"].toString(), // dynamic
                this.vData[i].title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            ),
            Container(
              // alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.person),
                  Icon(Icons.access_alarm)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyIconSetting1 extends StatelessWidget {
  // 변수 및 함수를 사용 할 수 있음
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: (){
        print("CLASS MyIconSetting을 누름");
      },
    );
  }
}

class PartActions{
  List<Widget> actionsWidget(){
    return [ new MyIconSetting1() ];
  }

  List<Widget> actionsWidget2 = [ new MyIconSetting1() ];

  static List<Widget> actionsWidget3 = [ new MyIconSetting1() ];

  static List<Widget> actionsWidget4(){
    return [ new MyIconSetting1() ];
  }
}



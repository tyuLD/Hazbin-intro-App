import 'package:flutter/material.dart';
import 'package:flutter_application_2/character_card.dart';
import 'episode_story_widgets.dart';
import 'music.dart';
import 'nav.dart';
class Session1 extends StatelessWidget {
  const Session1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const NavBar(),
      backgroundColor: const Color(0xFF1A0D0D),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: screenHeight * 0.85, child: _buildScreenA()),
                const EpisodeStoryGrid(
                  episodes: _episodes,
                  enableInnerScroll: false,
                ),
                SizedBox(
                  height: screenHeight * 0.7,
                  child: _buildScreenB(),
                ),
                const HazbinPlaylistScreen(
                  showScaffold: false,
                  enableInnerScroll: false,
                ),
                // SizedBox(height: screenHeight * 0.6, child: const ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreenA() {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Image(
              image: AssetImage('assets/session1 full.jpeg'),
              height: 400,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                '故事描述地獄公主 Charlie 在地獄營運一間旅館，希望讓罪人改過自新，以免他們遭到清剿的過程',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      );
  }
  Widget _buildScreenB() {
    return const CharacterCard(characters: _characters);
  }

  static const List<CharacterInfo> _characters = <CharacterInfo>[
    CharacterInfo(
      name: 'Charlie',
      description: 'Charlotte Morningstar，人們更常稱她為 Charlie，是地獄的Hellborn公主、Happy Hotel的創辦人，也是Hazbin Hotel的主要主角。她是Lucifer的女兒，以及與Lilith（地獄疏遠的女王）的後代。Charlie希望為她的王國做正確的事，透過Hazbin Hotel的改造計畫，找到將Sinners救贖進入Heaven的方法。',
      imagePath: 'assets/characters/Charlie.png',
    ),
    CharacterInfo(
      name: 'Vaggi',
      description: 'Vaggi（原拼寫 Vaggie），是一位墮落的墮天使，擔任Hazbin Hotel的經理。她是Hazbin Hotel系列的deuteragonist（第二主角）。擅長戰鬥，對女友Charlie非常保護，Vaggi外表強悍但內心善良。',
      imagePath: 'assets/characters/Vaggi.png',
    ),
    CharacterInfo(
      name: 'Angel Dust',
      description: 'Anthony，更常被稱為Angel Dust，是地獄裡的一名成人電影明星。這位知名的色情片明星為Valentino工作，也是Hotel打算拯救的第一個罪人',
      imagePath: 'assets/characters/Angel Dust.png',
    ),
    CharacterInfo(
      name: 'Alastor',
      description: 'Alastor，綽號「Radio Demon」，是地獄裡的一位強大惡魔。Alastor以其無情的性格和強大的力量而聞名，他對Hazbin Hotel的改造計畫表示興趣，並提供了他的幫助，但他的真正動機仍然是個謎。',
      imagePath: 'assets/characters/Alastor.png',
    ),
    CharacterInfo(
      name: 'Husk', 
      description: 'Husk 是一名罪人惡魔，個性暴躁、以賭博和魔術為生，同時也是地獄過去的領主之一。在與Alastor賭博失敗，失去自己的靈魂與地位後，他和Niffty一同被召喚到Hazbin Hotel工作，擔任旅館的櫃檯接待員與調酒師。',
      imagePath: 'assets/characters/Husk.png'
    ),
    CharacterInfo(
      name: 'Niffty', 
      description: 'Niffty 是一名「罪人」惡魔，擔任 Hazbin Hotel 的女傭、廚師與害蟲防治人員。她與 Husk 一樣，是由兩人共同的夥伴 Alastor 召喚來為 Hotel 工作的。', 
      imagePath: 'assets/characters/Niffty.png'
    ),
    CharacterInfo(
      name: 'Sir Pentious', 
      description: 'Pendleton，更常被稱為 Sir Pentious，同時也是罪人惡魔，也是第一位成功獲得救贖的罪人。他曾是維多利亞時代的惡魔，一直想變得現代、酷炫，而且熱衷於打造各種蒸汽朋克風格的破壞機械。', 
      imagePath: 'assets/characters/SirPentious.png'
    ),
    CharacterInfo(
      name: 'Lucifer', 
      description: 'Lucifer Morningstar 是一名墮落天使，也是 Hazbin Hotel 中的重要角色，首次登場於〈Dad Beat Dad〉。他是 Charlie Morningstar 的父親，也是 Lilith 分居中的丈夫。他統治整個 Hell，同時是七宗罪的領袖，具現化了 Pride 這一罪，也是 Goetic 類地獄原生惡魔種族的創造者。', 
      imagePath: 'assets/characters/Lucifer.png'
    ),
    CharacterInfo(
      name: 'Cherri Bomb', 
      description: 'Cherri Bomb 是一名罪人惡魔。她是 Angel Dust 的親近好友與犯罪搭檔。', 
      imagePath: 'assets/characters/CherriBomb.png'
    ),
    CharacterInfo(
      name: 'Adam', 
      description: 'Adam 是一名勝利大天使，也是 Hazbin Hotel 第一季的主要反派。他的副官是 Lute。他是第一位被創造的人類男性，也是第一個進入 Heaven 的人類靈魂。成為天使後，他擔任被稱為 Exorcists 的天使軍隊指揮官，並作為 Extermination 運動的先鋒，為 Heaven 效命。', 
      imagePath: 'assets/characters/Adam.png'
    ),
    CharacterInfo(
      name: 'Lute', 
      description: 'Lute 是 Exorcists 的副指揮官，也是 Hazbin Hotel 中的一位主要反派', 
      imagePath: 'assets/characters/Lute.png'
    ),
    CharacterInfo(
      name: 'Sera', 
      description: 'Sera 是一名 Seraphim 天使，原本是反派。她是 Heaven 的高階 Seraphim，也是下令在 Hell 每年執行 Extermination 的決策者。', 
      imagePath: 'assets/characters/Sera.png'
    ),
    CharacterInfo(
      name: 'Emily', 
      description: 'Emily 是一名 Seraphim 天使。在得知「Extermination」後，她向 Charlie 承諾會協助她實現拯救罪人的夢想；之後可以看到她試圖找出方法，修正 Heaven 所犯下的錯誤，並避免 Heaven 與 Hell 之間爆發可能的戰爭。', 
      imagePath: 'assets/characters/Emily.png'
    ),
    CharacterInfo(
      name: 'Vox', 
      description: 'Vox 是一名「罪人」惡魔，也是 Hell 裡眾多強大 Overlords 之一。他是 VoxTek Enterprises 的創辦人、所有人與 CEO，同時是與 Valentino、Velvette 共同組成的 Overlord 三人組「Vees」的實際領袖與公眾代表。作為一位精通科技的商人，Vox 牢牢掌控 Hell 的新聞（666 News）與娛樂媒體。他致力於維持對 Pentagram City 居民的控制，並阻止被稱為「電台惡魔」的 Alastor——自己在影響力與科技方面的主要對手——搶走權力。', 
      imagePath: 'assets/characters/Vox.png'
    ),  
    CharacterInfo(
      name: 'Velvet', 
      description: 'Velvette 發音為「Velvet」，是一名「罪人」惡魔，是 Hell 裡眾多 Overlords 之一。她是 Hazbin Hotel 第一季的主要反派之一。她是 Vox 與 Valentino 的親密盟友，並自稱為 Vees 的「脊樑骨」（backbone of the Vees）。她專精於社群媒體與時尚設計，同時也負責 Love Potion 的創造與推廣。', 
      imagePath: 'assets/characters/Velvette.png'
    ),
    CharacterInfo(
      name: 'Valentino', 
      description: 'Valentino 是一名「罪人」惡魔，也是 Hell 裡眾多 Overlords 之一。他是主要反派之一。他是 V Tower 內「色情片工作室」的導演與管理者，同時也是 Vees 成員。他不僅是旗下電影頭牌明星 Angel Dust 的老闆，更透過靈魂契約，使 Angel Dust 處於對他負有靈魂義務的狀態。', 
      imagePath: 'assets/characters/Valentino.png'
    ),
  ];

  static const List<EpisodeInfo> _episodes = <EpisodeInfo>[
      EpisodeInfo(
        title: '第 1 集・序曲',
        summary:
            'Charlie向天堂提案讓罪人進入她的旅館改過向善，避免罪人慘遭天使清剿。Vaggi召集旅館員工製作廣告宣傳旅館。',
        imagePath: 'assets/session1/ep1.png',
        duration: '25 分鐘',
        releaseDate: '2024年1月19日',
        songs: [
          'Happy Day In Hell',
          'Hell Is Forever',
        ],
      ),
      EpisodeInfo(
        title: '第 2 集・廣播殺死電視明星',
        summary:
            'V 大頭三人組、Vox、Velvet與Valentino統治地獄一隅，久未遭人挑戰。但阿拉斯托的歸來可能撼動V大頭的位置。此時，新來的房客考驗著Angel Dust的耐心。',
        imagePath: 'assets/session1/ep2.png',
        duration: '25 分鐘',
        releaseDate: '2024年1月19日',
        songs: [
          'Stayed Gone',
          'It Starts With Sorry',
        ],
      ),
      EpisodeInfo(
        title: '第 3 集・炒蛋',
        summary:
            '旅館房客與員工花時間培養信任。領主會議上有新事證揭露，與會者劍拔弩張。',
        imagePath: 'assets/session1/ep3.png',
        duration: '24 分鐘',
        releaseDate: '2024年1月19日',
        songs: [
          'Respectless',
          'Whatever It Takes',
        ],
      ),
      EpisodeInfo(
        title: '第 4 集・掩飾',
        summary:
            'Angel Dust得在工作與綠館之間取得平衡。Charlie決定拿出公主的身分向Angel Dust的老闆施壓',
        imagePath: 'assets/session1/ep4.png',
        duration: '25 分鐘',
        releaseDate: '2024年1月19日',
        songs: [
          'Poison',
          'Loser, Baby',
        ],
      ),
      EpisodeInfo(
        title: '第 5 集・父親之爭',
        summary:
            'Charlie百般懇請父親Lucifer幫忙。與此同時，不速之客前來打擾旅館。',
        imagePath: 'assets/session1/ep5.png',
        duration: '25 分鐘',
        releaseDate: '2024年1月26日',
        songs: [
          'Hell’s Greatest Dad',
          'More Than Anything',
        ],
      ),
      EpisodeInfo(
        title: '第 6 集・歡迎來到天堂',
        summary:
            'Charlie與Vaggi到天堂找Adam的主管談話。Angel Dust與老友爆炸性的重逢，展現出他這段時間的蛻變。',
        imagePath: 'assets/session1/ep6.png',
        duration: '25 分鐘',
        releaseDate: '2024年1月26日',
        songs: [
          'Welcome to Heaven',
          'You Didn’t Know',
        ],
      ),
      EpisodeInfo(
        title: '第 7 集・結識蘿西',
        summary:
            '秘密曝光後，旅館面臨危急存亡之秋。Charlie與Vaggi得竭盡所能保護旅館。',
        imagePath: 'assets/session1/ep7.png',
        duration: '25 分鐘',
        releaseDate: '2024年2月2日',
        songs: [
          'Out For Love',
          'ready For This',
        ],

      ),
      EpisodeInfo(
        title: '第 8 集・堅持下去',
        summary:
          '本紀最終季，天使大軍與地獄的戰爭開打，結局由未可知。',
        imagePath: 'assets/session1/ep8.png',
        duration: '25 分鐘',
        releaseDate: '2024年2月2日',
        songs: [
          'Finale',
        ],
      ),
    ];

 
}

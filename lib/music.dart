import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Track{
  final String title;
  final String path;

  const Track({required this.title, required this.path});
}

class HazbinPlaylistScreen extends StatefulWidget {
  const HazbinPlaylistScreen({
    super.key,
    this.showScaffold = true,
    this.enableInnerScroll = true,
  });

  final bool showScaffold;
  final bool enableInnerScroll;

  @override
  State<HazbinPlaylistScreen> createState() => _HazbinPlaylistScreenState();
}

class _HazbinPlaylistScreenState extends State<HazbinPlaylistScreen>
  with SingleTickerProviderStateMixin {
    final _audioPlayer = AudioPlayer();
    final List<Track> tracks = const [
      Track(title: 'Happy Day In Hell', path: 'assets/audio/Happy Day In Hell.mp3'),
      Track(title: 'Hell Is Forever', path: 'assets/audio/Hell Is Forever.mp3'),
      Track(title: 'Stayed Gone', path: 'assets/audio/Stayed Gone.mp3'),
      Track(title: 'It Starts With Sorry', path: 'assets/audio/It Starts With Sorry.mp3'),
      Track(title: 'Respectless', path: 'assets/audio/Respectless.mp3'),
      Track(title: 'Whatever It Takes', path: 'assets/audio/Whatever It Takes.mp3'),
      Track(title: 'Poison', path: 'assets/audio/Poison.mp3'),
      Track(title: 'Loser, Baby', path: 'assets/audio/Loser, Baby.mp3'),
      Track(title: 'Hell’s Greatest Dad', path: 'assets/audio/Hell’s Greatest Dad.mp3'),
      Track(title: 'More Than Anything', path: 'assets/audio/More Than Anything.mp3'),
      Track(title: 'Welcome To Heaven', path: 'assets/audio/Welcome To Heaven.mp3'),
      Track(title: 'You Didn’t Know', path: 'assets/audio/You Didn’t Know.mp3'),
      Track(title: 'Out For Love', path: 'assets/audio/Out For Love.mp3'),
      Track(title: 'Ready For This', path: 'assets/audio/Ready For This.mp3'),
      Track(title: 'Finale', path: 'assets/audio/Finale.mp3'),
    ];

    int _currentIndex = 0;

    @override
    void initState() {
      _setupPlaylist();
      super.initState();
    }

    @override
    void dispose() {
      _audioPlayer.dispose();
      super.dispose();
    }

    Future<void> _setupPlaylist() async {
      final audioSources = tracks.map((track) {
        return AudioSource.uri(Uri.parse('asset:${track.path}'));
      }).toList();

      final playlist = ConcatenatingAudioSource(children: audioSources);
      await _audioPlayer.setAudioSource(playlist);

      _audioPlayer.currentIndexStream.listen((index) {
        if (index != null) {
          setState(() => _currentIndex = index);
        }
      });
    }

    @override
    Widget build(BuildContext context) {
      final currentTitle = tracks.elementAtOrNull(_currentIndex)?.title ?? '';
      final isPlaying = _audioPlayer.playerState.playing;

      final playlistListView = ListView.builder(
        primary: widget.enableInnerScroll,
        shrinkWrap: !widget.enableInnerScroll,
        physics: widget.enableInnerScroll
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemCount: tracks.length,
        itemBuilder: (context, index) {
          final selected = index == _currentIndex;
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            color: selected ? Colors.red : Colors.grey.shade900,
            elevation: 2,
            child: InkWell(
              onTap: () async {
                await _audioPlayer.seek(Duration.zero, index: index);
                if (!isPlaying) {
                  await _audioPlayer.play();
                }
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Text(
                      '#${index + 1}',
                      style: TextStyle(
                        color: Colors.red.shade300,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        tracks[index].title,
                        style: TextStyle(
                          color: selected ? Colors.white : Colors.grey.shade300,
                          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.queue_music,
                      color: Colors.red.shade400,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

      final content = Container(
        color: const Color(0xFF2A1616),
        child: Column(
          mainAxisSize: widget.enableInnerScroll ? MainAxisSize.max : MainAxisSize.min,
          children: [
            // 小控制面板（類似 Hazbin Hotel 感官）
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.red),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      currentTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(color: Colors.red, blurRadius: 4)],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () {
                      isPlaying ? _audioPlayer.pause() : _audioPlayer.play();
                    },
                  ),
                ],
              ),
            ),
            if (widget.enableInnerScroll)
              Expanded(child: playlistListView)
            else
              playlistListView,
          ],
        ),
      );

      if (!widget.showScaffold) {
        return content;
      }

      return Scaffold(
        backgroundColor: const Color(0xFF2A1616),
        appBar: AppBar(
          title: Text(
            'Hazbin Playlist',
            style: TextStyle(
              color: Colors.red.shade400,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 48, 24, 24),
          elevation: 0,
        ),
        body: content,
      );
  }
}
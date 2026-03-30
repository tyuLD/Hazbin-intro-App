import 'package:flutter/material.dart';

// 共用的集數資料模型。
class EpisodeInfo {
  const EpisodeInfo({
    required this.title,
    required this.summary,
    required this.imagePath,
    required this.duration,
    required this.releaseDate,
    this.songs,
  });

  final String title;
  final String summary;
  final String imagePath;
  final String duration;
  final String releaseDate;
  final List<String>? songs;
}


// 共用的劇情卡片區塊：可直接給 episodes 資料渲染卡片清單。
class EpisodeStoryGrid extends StatelessWidget {
  const EpisodeStoryGrid({
    super.key,
    required this.episodes,
    this.enableInnerScroll = true,
  });

  final List<EpisodeInfo> episodes;
  final bool enableInnerScroll;

  @override
  Widget build(BuildContext context) {
    // 依據可用寬度切換單欄/雙欄卡片排版，避免在窄螢幕過度擁擠。
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isWide = constraints.maxWidth >= 700;
        return GridView.builder(
          primary: enableInnerScroll,
          shrinkWrap: !enableInnerScroll,
          physics: enableInnerScroll
              ? const BouncingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemCount: episodes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isWide ? 2 : 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            // 比例越小卡片越高，這裡刻意保留較高卡片以降低 overflow 風險。
            childAspectRatio: isWide ? 1.30 : 1.10,
          ),
          itemBuilder: (BuildContext context, int index) {
            final EpisodeInfo episode = episodes[index];
            return _EpisodeCard(
              episode: episode,
              onTap: () => _showEpisodeDetail(context, episode),
            );
          },
        );
      },
    );
  }

  void _showEpisodeDetail(BuildContext context, EpisodeInfo episode) {
    // 點擊卡片後開啟底部彈窗，顯示完整圖片、標題與摘要資訊。
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF111827),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 24),
            // 內容可能超過可視高度，因此用滾動容器避免內容被截斷。
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 38,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        episode.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    spacing: 12,
                    children: [
                      Text(
                        episode.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      _MetaChip(label: episode.duration),
                      _MetaChip(label: episode.releaseDate),
                    ]
                  ),
                  if (episode.songs != null && episode.songs!.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: const Text(
                            '劇中歌曲',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          spacing: 8,
                          children: episode.songs!
                            .map((song) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: _MetaChip(label: song),
                                ))
                            .toList(),
                        ),
                    ],),
                  ],
                  const SizedBox(height: 14),
                  Text(
                    episode.summary,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EpisodeCard extends StatelessWidget {
  const _EpisodeCard({required this.episode, required this.onTap});

  final EpisodeInfo episode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // 每張集數卡片：封面圖 + 標題 + 簡介 + 底部資訊晶片。
    return Material(
      color: const Color(0xFF0B1220),
      borderRadius: BorderRadius.circular(14),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              // 封面高度固定，確保清單中的卡片視覺一致。
              height: 140,
              width: double.infinity,
              child: Image.asset(
                episode.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
              child: Text(
                episode.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                episode.summary,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  height: 1.35,
                ),
              ),
            ),
            // 把底部資訊列推到卡片底端，維持版面節奏一致。
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: _MetaChip(label: episode.duration),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _MetaChip(label: episode.releaseDate),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    // 通用資訊標籤：用於年齡分級、片長、上映日期等文字。
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

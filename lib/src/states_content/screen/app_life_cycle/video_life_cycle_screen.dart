import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoLifeCycleScreen extends StatefulWidget {
  const VideoLifeCycleScreen({super.key});

  @override
  State<VideoLifeCycleScreen> createState() => _VideoLifeCycleScreenState();
}

class _VideoLifeCycleScreenState extends State<VideoLifeCycleScreen> {
  late VideoPlayerController _videoPlayerController;
  final ValueNotifier<bool> _isPlaying = ValueNotifier<bool>(false);
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset("assets/videos/gym.mp4")
          ..addListener(
            () {
              if (_videoPlayerController.value.position ==
                  _videoPlayerController.value.duration) {
                _videoPlayerController.seekTo(const Duration(seconds: 0));
                _isPlaying.value = false;
                _videoPlayerController.pause();
              }
            },
          )
          ..initialize().then((_) {
            setState(() {});
          });
    _listener = AppLifecycleListener(
      onStateChange: _onVideoStateChanged,
    );
  }

  void _onVideoStateChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        _videoPlayerController.dispose();
        break;
      case AppLifecycleState.resumed:
        _videoPlayerController.play();
        _isPlaying.value = true;
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        _videoPlayerController.pause();
        _isPlaying.value = false;
        break;
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await _videoPlayerController.initialize();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: _isPlaying,
        builder: (context, isPlayingVideo, _) => _VideoPlayerWidget(
          videoPlayerController: _videoPlayerController,
          isPlaying: isPlayingVideo,
          onTapPlayOrPause: () {
            _isPlaying.value = !_videoPlayerController.value.isPlaying;
            if (_isPlaying.value) {
              _videoPlayerController.play();
            } else {
              _videoPlayerController.pause();
            }
          },
        ),
      ),
    );
  }
}

class _VideoPlayerWidget extends StatelessWidget {
  const _VideoPlayerWidget({
    required VideoPlayerController videoPlayerController,
    required this.onTapPlayOrPause,
    this.isPlaying = false,
  }) : _videoPlayerController = videoPlayerController;

  final VideoPlayerController _videoPlayerController;
  final VoidCallback onTapPlayOrPause;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController),
                  )
                : const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            ElevatedButton(
              onPressed: onTapPlayOrPause,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(!isPlaying ? Icons.play_arrow : Icons.pause),
                  const SizedBox(width: 4),
                  Text(
                    !isPlaying ? "Play" : "Pause",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
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

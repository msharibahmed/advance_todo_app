import 'package:advance_todo_app/provider/voice_recorder_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoiceRecordWidget extends StatefulWidget {
  const VoiceRecordWidget({Key? key}) : super(key: key);

  @override
  State<VoiceRecordWidget> createState() => _VoiceRecordWidgetState();
}

class _VoiceRecordWidgetState extends State<VoiceRecordWidget> {
  final recorder = VoiceRecorderProv();

  @override
  void initState() {
    super.initState();
    recorder.init();
    recorder.playerInit();
  }

  @override
  void dispose() {
    super.dispose();
    recorder.closeSession();
    recorder.playerCloseSession();
  }

  @override
  Widget build(BuildContext context) {
    final _recordProv = Provider.of<VoiceRecorderProv>(context);
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            await _recordProv.toggleRecording();
          },
          icon: Icon(_recordProv.isRecording
              ? Icons.ac_unit
              : Icons.mic_none),
        ),
        _recordProv.isRecording
            ? Container()
            : IconButton(
                onPressed: () async {
                  await _recordProv.togglePlayingAudio(whenFinished: () {});
                },
                icon: const Icon(Icons.play_arrow_rounded),
              ),
        const Text('1:27')
      ],
    );
  }
}

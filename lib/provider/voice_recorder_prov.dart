import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceRecorderProv with ChangeNotifier {
  final pathToSaveAudio = 'audio_example.aac';
  final pathToReadAudio = 'audio_example.aac';
  FlutterSoundRecorder? _voiceRecorder;
  FlutterSoundPlayer? _voicePlayer;
  bool _isRecorderInitialised = false;
  bool _isPlayerInitialised = false;
  bool get isRecording {
    if (_voiceRecorder == null) init();
    var result = _voiceRecorder!.isRecording;
    return result;
  }

  //
  //
  Future<void> init() async {
    _voiceRecorder = FlutterSoundRecorder();
    final status = await Permission.microphone.request();
    if (!status.isGranted) {
      throw RecordingPermissionException('Microphone Permission denied');
    }
    //TODO: i dont remmember i added the logic that if the user denied the permission then if he clicks record again then permisiion pop up appears
    await _voiceRecorder!.openAudioSession();
    _isRecorderInitialised = true;
  }

  Future<void> closeSession() async {
    if (!_isRecorderInitialised) return;
    _voiceRecorder!.closeAudioSession();
    _voiceRecorder = null;
    _isRecorderInitialised = false;
  }

  Future<void> _startRecording() async {
    if (!_isRecorderInitialised) return;
    await _voiceRecorder!.startRecorder(toFile: pathToSaveAudio);
  }

  // Future _pause() async {
  //   await _voiceRecorder!.pauseRecorder();
  // }

  Future<void> _stopRecording() async {
    if (!_isRecorderInitialised) return;

    await _voiceRecorder!.stopRecorder();
  }

  Future<void> toggleRecording() async {
    if (_voiceRecorder == null) {
      init();
      
    }
    if (_voiceRecorder!.isStopped) {
      await _startRecording();
    } else {
      await _stopRecording();
    }
    notifyListeners();
  }

//audio_player
  Future<void> playerInit() async {
    _voicePlayer = FlutterSoundPlayer();
    await _voicePlayer!.openAudioSession();
    _isPlayerInitialised = true;
    print(_isPlayerInitialised.toString() + 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
  }

  Future<void> playerCloseSession() async {
    _voicePlayer!.closeAudioSession();
    _voicePlayer = null;
    _isPlayerInitialised = false;
    print(_isPlayerInitialised.toString() + 'bbbbbbbbbbbbbbbbbbbbbbbbbbbb');
  }

  Future<void> _playAudio(VoidCallback whenFinished) async {
    if (!_isPlayerInitialised) return;
    await _voicePlayer!
        .startPlayer(fromURI: pathToReadAudio, whenFinished: whenFinished);
  }

  Future<void> _stopAudio() async {
    if (!_isPlayerInitialised) return;
    await _voiceRecorder!.stopRecorder();
  }

  Future<void> togglePlayingAudio({required VoidCallback whenFinished}) async {
    if (_voicePlayer == null) {
      playerInit();
    }
    if (_voicePlayer!.isStopped) {
      await _playAudio(whenFinished);
    } else {
      await _stopAudio();
    }
    notifyListeners();
  }
}

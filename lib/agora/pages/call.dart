import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:proj_ident/Homepage/Konsultasi/halaman_foto.dart';

import '../utils/settings.dart';

class CallPage extends StatefulWidget {
  /// non-modifiable channel name of the page
  final String? channelName;

  /// non-modifiable client role of the page
  final ClientRole? role;

  final String? app_id;
  final String? token;
  final String? antrian;

  /// Creates a call page with given channel name.
  const CallPage(
      {Key? key,
      this.channelName,
      this.role,
      this.app_id,
      this.token,
      this.antrian})
      : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  late int _remoteUid;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initForAgora();
  }

  Future<void> initForAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.createWithConfig(
        RtcEngineConfig(widget.app_id.toString()));

    await _engine.enableVideo();

    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          setState(() {
            _remoteUid = 0;
          });
        },
      ),
    );

    await _engine.joinChannel(
        widget.token, widget.channelName.toString(), null, 11);
  }

  bool muted = false;
  bool oncam = true;
  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: _renderRemoteVideo(),
              ),
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.only(left: 24, top: 50),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 108,
                  height: 192,
                  child: Center(
                    child: _renderLocalPreview(),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RawMaterialButton(
                  onPressed: () {
                    _onCallEnd(context);
                  },
                  child: Icon(
                    Icons.call_end,
                    color: Colors.white,
                    size: 35.0,
                  ),
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.redAccent,
                  padding: const EdgeInsets.all(15.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: _onToggleMute,
                      child: Icon(
                        muted ? Icons.mic_off : Icons.mic,
                        color: muted ? Colors.white : Colors.blueAccent,
                        size: 20.0,
                      ),
                      shape: CircleBorder(),
                      elevation: 2.0,
                      fillColor: muted ? Colors.blueAccent : Colors.white,
                      padding: const EdgeInsets.all(12.0),
                    ),
                    RawMaterialButton(
                      onPressed: _onTogglecam,
                      child: Icon(
                        oncam ? Icons.videocam : Icons.videocam_off,
                        color: oncam ? Colors.blueAccent : Colors.white,
                        size: 20.0,
                      ),
                      shape: CircleBorder(),
                      elevation: 2.0,
                      fillColor: oncam ? Colors.white : Colors.blueAccent,
                      padding: const EdgeInsets.all(12.0),
                    ),
                    RawMaterialButton(
                      onPressed: _onSwitchCamera,
                      child: Icon(
                        Icons.switch_camera,
                        color: Colors.blueAccent,
                        size: 20.0,
                      ),
                      shape: CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.white,
                      padding: const EdgeInsets.all(12.0),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // current user video
  Widget _renderLocalPreview() {
    return RtcLocalView.SurfaceView();
  }

  // remote user video
  Widget _renderRemoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(uid: _remoteUid);
    } else {
      return Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }

  void _onTogglecam() {
    setState(() {
      oncam = !oncam;
    });
    (oncam) ? _engine.enableLocalVideo(true) : _engine.enableLocalVideo(false);
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    _engine.switchCamera();
  }

  void _onCallEnd(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PageFoto()));
  }

  Widget _toolbar() {
    if (widget.role == ClientRole.Audience) return Container();
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RawMaterialButton(
            onPressed: () {
              _onCallEnd(context);
            },
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RawMaterialButton(
                onPressed: _onToggleMute,
                child: Icon(
                  muted ? Icons.mic_off : Icons.mic,
                  color: muted ? Colors.white : Colors.blueAccent,
                  size: 20.0,
                ),
                shape: CircleBorder(),
                elevation: 2.0,
                fillColor: muted ? Colors.blueAccent : Colors.white,
                padding: const EdgeInsets.all(12.0),
              ),
              RawMaterialButton(
                onPressed: _onTogglecam,
                child: Icon(
                  oncam ? Icons.videocam : Icons.videocam_off,
                  color: oncam ? Colors.blueAccent : Colors.white,
                  size: 20.0,
                ),
                shape: CircleBorder(),
                elevation: 2.0,
                fillColor: oncam ? Colors.white : Colors.blueAccent,
                padding: const EdgeInsets.all(12.0),
              ),
              RawMaterialButton(
                onPressed: _onSwitchCamera,
                child: Icon(
                  Icons.switch_camera,
                  color: Colors.blueAccent,
                  size: 20.0,
                ),
                shape: CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.white,
                padding: const EdgeInsets.all(12.0),
              )
            ],
          ),
        ],
      ),
    );
  }
}

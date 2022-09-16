import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:meeja/constants.dart';
import 'package:meeja/core/services/auth_services.dart';
import 'package:meeja/ui/locator.dart';

class MessageBubble extends StatelessWidget {
  final currentAppUser = locator<AuthServices>().appUser;
  late FlutterSoundPlayer? soundPlayer = FlutterSoundPlayer();

  late Timer timer;
  int durationCounter = 0;

  final doc;
  MessageBubble(this.doc);

  @override
  Widget build(BuildContext context){
    bool isPaused = false;
    bool isPlaying = false;

    Duration? totalDuration = Duration();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Align(
        alignment: doc["sender"] == currentAppUser.appUserId ? Alignment.topRight :  Alignment.topLeft,
        child: Container(
          constraints: BoxConstraints(
            minWidth: 80,
            maxWidth: MediaQuery.of(context).size.width * 0.8
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft:Radius.circular(20),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(doc["sender"] == currentAppUser.appUserId ? 0 : 20),
                topLeft: Radius.circular(doc["sender"] == currentAppUser.appUserId ? 20 : 0)
            ),
              color: doc["sender"] == currentAppUser.appUserId
                  ? kPrimaryColor
                  : Colors.orangeAccent),
          child: doc['type'] == 'text'

              /// Text Message

              ? Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                    "${doc['messageText']}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
              )


              : doc['type'] == 'audio'

                  /// Audio Message

                  ? StatefulBuilder(builder: (context, StateSetter setState) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              if (isPaused) {
                                await soundPlayer!.resumePlayer();
                                  timer = Timer.periodic(Duration(seconds: 1), (timer) => setState(() {
                                     durationCounter++;
                                  }));
                                print('Voice resumed');
                                setState(() {
                                  isPaused = false;
                                });
                              } else if (isPlaying) {
                                await soundPlayer!.pausePlayer();
                                timer.cancel();
                                print('Voice paused');
                                setState(() {
                                  isPaused = true;
                                });
                              } else {

                                soundPlayer = await FlutterSoundPlayer().openPlayer();

                                totalDuration = await soundPlayer!.startPlayer(
                                  fromURI: doc['messageText'],
                                  whenFinished: () {
                                    timer.cancel();
                                    setState((){durationCounter = 0;});
                                    print('Voice ended');
                                    setState(() {
                                      isPlaying = false;
                                      soundPlayer!.closePlayer();
                                    });
                                  },
                                );
                                  timer = Timer.periodic(Duration(seconds: 1), (timer) =>setState(() {
                                    durationCounter++;
                                    print(durationCounter);
                                  }));
                                print('>>>>>>>>>>>>>>>>>>>>>>>>>>> Duration === ${totalDuration} <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
                                setState(() {
                                  isPlaying = true;
                                });
                              }
                            },
                            child: Icon(
                              isPaused
                                  ? Icons.play_arrow
                                  : isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Slider(
                            value: durationCounter > totalDuration!.inSeconds ? totalDuration!.inSeconds.toDouble() : durationCounter.toDouble(),
                            min: 0.0,
                            max: (totalDuration?.inSeconds.toDouble()  ?? 10 ) + 1,
                            thumbColor: Colors.white,
                            activeColor: Colors.white,
                            inactiveColor: kGrey1Color,
                            onChanged: (value) {
                              soundPlayer!.seekToPlayer(Duration(seconds: value.floor()));
                              setState((){durationCounter = value.floor();});
                            },
                          ),
                        ],
                      );
                    })


                  : Text(
                      "${doc['messageText']}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
        ),
      ),
    );
  }
}


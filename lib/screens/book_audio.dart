import 'package:edu_project/widgets/audio_player.dart';
import 'package:edu_project/widgets/my_text.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

class BookAudio extends StatefulWidget {
  const BookAudio({super.key});

  @override
  State<BookAudio> createState() => _BookAudioState();
}

bool isPressed = false;

class _BookAudioState extends State<BookAudio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  toolbarHeight: 80, 
          title: isPressed == false
              ? Column(
                  children: [
                    Gap(15),
                    Row(
                      children: [
                        BookAudioButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.chevron_left)),
                        Spacer(),
                        MyText(title: "Däckbyte"),
                        Spacer(),
                        BookAudioButton(
                            onPressed: () {
                              setState(() {
                                isPressed = true;
                              });
                            },
                            icon: Icon(Icons.headphones))
                      ],
                    ),
                  ],
                )
              : Column(
                  children: [
                    Gap(10),
                    Container(
                      child: AudioPlayerWidget(audioUrl: "assets/lets-get-loud-and-dance-1.mp3"),
                    ),
                  ],
                )),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20,top: 20 ),
        child: Column(
          children: [
            MyRow(
              image: Image.asset("assets/images/Vector (1).png"),
              myText: MyText(title: "Maecenas convallis orci id elit"),
            ),
            Gap(20),
            Image.asset("assets/images/Asset 2 1.png"),
            Gap(10),
            MyText(
              title:
                  "Vivamus convallis, mi id rutrum scelerisque, mi mauris pretium elit, quis viverra urna nibh a ante. Duis accumsan viverra efficitur.Integer id vehicula tellus, suscipit semper augue. Mauris nulla lectus, faucibus eget est non, accumsan wake up condimentum risus. Integer ac venenatis felis. Nulla mattis laoreet mattis. Proin at laoreet sem.",
              fontSize: 12,
              color: Color(0xff5A6981),
            ),
            Gap(10),
            MyRow(
              image: Image.asset("assets/images/Group 162564.png"),
              myText: MyText(title: "Maecenas convallis orci id elit"),
            ),
            Gap(5),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 5,
                  color: Color(0xff5A6981),
                ),
                Gap(5),
                MyText(
                  title: "Class aptent taciti sociosqu ad litora torquent",
                  fontSize: 12,
                  color: Color(0xff5A6981),
                )
              ],
            ),
            Gap(3),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 5,
                  color: Color(0xff5A6981),
                ),
                Gap(5),
                MyText(
                  title: "accumsan wake up",
                  fontSize: 12,
                  color: Color(0xff5A6981),
                )
              ],
            ),
            Gap(3),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 5,
                  color: Color(0xff5A6981),
                ),
                Gap(5),
                MyText(
                  title: "Nulla mattis laoreet",
                  fontSize: 12,
                  color: Color(0xff5A6981),
                )
              ],
            ),
            Gap(3),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 5,
                  color: Color(0xff5A6981),
                ),
                Gap(3),
                MyText(
                  title: "Proin at laoreet sem",
                  fontSize: 12,
                  color: Color(0xff5A6981),
                )
              ],
            ),
            Gap(10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                      color:isPressed?  Color.fromARGB(249, 209, 88, 197).withAlpha(50):Color(0xffFFEDBA)),
              child: MyText(
                title:
                    "Vivamus convallis, mi id rutrum scelerisque, mi mauris pretium elit, quis viverra urna nibh a ante. Duis accumsan viverra efficitur.Integer id vehicula tellus, suscipit semper augue.",
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyRow extends StatelessWidget {
  final Image image;
  final MyText myText;
  const MyRow({
    super.key,
    required this.image,
    required this.myText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image,
        Gap(9),
        myText,
      ],
    );
  }
}

class BookAudioButton extends StatelessWidget {
  final Icon icon;
  final Function()? onPressed;
  const BookAudioButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Color(0xff94D073).withAlpha(83)),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon.icon,
        color: Color(0xff94D073),
      ),
    );
  }
}

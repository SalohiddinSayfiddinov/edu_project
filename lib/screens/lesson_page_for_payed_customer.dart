import 'package:edu_project/screens/book_audio.dart';
import 'package:edu_project/screens/report_page.dart';
import 'package:edu_project/widgets/expandble_panel.dart';
import 'package:edu_project/widgets/my_text.dart';
import 'package:edu_project/widgets/video_player.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

class LessonPageForPayedCustomer extends StatefulWidget {
  const LessonPageForPayedCustomer({super.key});

  @override
  State<LessonPageForPayedCustomer> createState() =>
      _LessonPageForPayedCustomerState();
}

class _LessonPageForPayedCustomerState extends State<LessonPageForPayedCustomer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            BookAudioButton(icon: const Icon(Icons.close)),
            const Spacer(flex: 2),
            const MyText(title: "Träningsprov"),
            const Spacer(flex: 1),
            BookAudioButton(icon: const Icon(Icons.error_outline)),
            BookAudioButton(icon: const Icon(Icons.copy)),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            VideoPlayerWidget(
              url:
                  "https://archive.org/download/ShrekTrailer/ShrekTrailer_512kb.mp4",
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const MyText(
                      title: "Vägen till körkort för personbil",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const Gap(10),
                    const MyText(
                      title:
                          "Join UserTesting's Mr. Braun for an insightful dive into usability — what it means, why it matters, and how you can optimize your product, service, or business. what it means, why it matters, and how you can optimize your product, service, or business ...läs mer",
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    const Gap(20),
                    TabBar(
                      indicatorColor: Colors.green,
                      labelColor: Colors.green,
                      controller: _tabController,
                      labelStyle:
                          const TextStyle(fontWeight: FontWeight.normal),
                      unselectedLabelStyle:
                          const TextStyle(fontWeight: FontWeight.bold),
                      tabs: const [
                        Tab(text: "Lektioner"),
                        Tab(text: "Ordlista"),
                        Tab(text: "Resurs"),
                      ],
                    ),
                    const Gap(10),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey.shade300),
                                      right: BorderSide(
                                          color: Colors.grey.shade300),
                                      left: BorderSide(
                                          color: Colors.grey.shade300)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  title: const MyText(title: "What is UX/UI?"),
                                  subtitle: const MyText(
                                    title: "12 Minutes",
                                    fontSize: 14,
                                  ),
                                  leading: const MyText(
                                    title: "01",
                                    fontSize: 24,
                                  ),
                                  trailing: const CircleAvatar(
                                    radius: 16,
                                    child: Icon(Icons.play_arrow, size: 18),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Gap(5);
                            },
                            itemCount: 10,
                          ),
                          SingleChildScrollView(
                            child: ExpandablePanel(
                              header: const Text(
                                'Заголовок раздела',
                              ),
                              content: const Text(
                                'Здесь находится скрытое содержимое, которое появляется при нажатии. '
                                'Можно разместить любой виджет: текст, изображения, кнопки и т.д.',
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                          ),
                          ListView.builder(
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16.0),
                                      ),
                                    ),
                                    scrollControlDisabledMaxHeightRatio: .75 ,
                                    builder: (context) => ReportBottomSheet(),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.black.withAlpha(20),
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: Row(
                                    children: [
                                      MyText(title: "Grocery Shopping App"),
                                      Spacer(),
                                      Image.asset("assets/icons/Vector (7).png")
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

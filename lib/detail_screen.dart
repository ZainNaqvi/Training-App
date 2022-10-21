import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/home_page.dart';
import 'package:video_player/video_player.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // INITIALIZING - THE - DATA
  @override
  void initState() {
    getJsonProverb();
    super.initState();
  }

  // PLAY - AREA - FUNCTION
  Widget playArea(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  // DICLARING - VIDEO - PLAYER - CONTROLLER - GLOBALLY
  VideoPlayerController? _controller;
  // CREATING - THE - LIST - HERE
  List videoInfo = [];
  // BOOLEAN - FOR - CHANGING - CONTROLLER -
  bool isShowVideo = false;
  //GET JSON
  Future<void> getJsonProverb() async {
    final String rawJson = await rootBundle.loadString('assets/json/data.json');
    setState(() {
      videoInfo = jsonDecode(rawJson);
    });
  }

  tapVidio(int index) {
    final controller =
        VideoPlayerController.network(videoInfo[index]['videoUrl']);
    _controller = controller;
    setState(() {});
    // ignore: avoid_single_cascade_in_expression_statements
    controller
      ..initialize().then((_) {
        controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: !isShowVideo
            ? BoxDecoration(
                gradient: LinearGradient(
                  begin: const FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                  colors: [
                    Colors.teal.withOpacity(0.7),
                    Colors.teal.withOpacity(0.2),
                  ],
                ),
              )
            : BoxDecoration(
                color: Colors.teal.withOpacity(0.7),
              ),
        child: Column(
          children: [
            !isShowVideo
                ? Container(
                    padding:
                        EdgeInsets.only(top: 54.h, left: 22.w, right: 22.w),
                    width: MediaQuery.of(context).size.width,
                    height: 250.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // CUSTOM - APP - BAR - OF - APPLICATION
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.info,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        // TITLE - TEXT - OF - THE - APPLICATION
                        SizedBox(height: 18.h),
                        Text(
                          'Legs Toning',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'and Glutes Workout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // BOXES - VIDEO - TIME - AND - TITLE
                        SizedBox(height: 34.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.teal.withOpacity(0.3),
                                    Colors.teal.withOpacity(0.1),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.alarm,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 4.w),
                                  const Text(
                                    "68 min",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.teal.withOpacity(0.3),
                                    Colors.teal.withOpacity(0.1),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.alarm,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 4.w),
                                  const Text(
                                    "Resistent band , KetteBell",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                // VIDEO - PLAYER - CONTAINER
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 64.h, left: 18.w, right: 18.r, bottom: 12.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20.sp,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.info,
                                  size: 20.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        playArea(context),
                      ],
                    ),
                  ),

            // BOTTOM - CONTAINER - BOTTOM - WHITE - SHEET
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(65.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 28.h),
                      // LIST - VIEW - BUILDER - TITLE
                      Row(
                        children: [
                          Text(
                            "Circuit 1 : Legs Toning",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          const Icon(
                            Icons.loop,
                            color: Colors.teal,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "3 sets",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(width: 8.w),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      // LIST - VIEW - BUILDER - FOR - API - VIDEOS
                      Expanded(
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                // SETTING - THE - STATE
                                setState(() {
                                  if (isShowVideo == false) {
                                    isShowVideo = true;
                                  }
                                });
                                debugPrint(index.toString());
                                tapVidio(index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 8.h),
                                width: MediaQuery.of(context).size.width,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        // IMAGE - THUMBNAIL - BOX
                                        Container(
                                          padding: EdgeInsets.all(8.r),
                                          width: 100.w,
                                          height: 100.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            color:
                                                Colors.black.withOpacity(0.02),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                videoInfo[index]["thumbnail"],
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        // IMAGE - TITLE - BOX
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              videoInfo[index]["title"],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                            SizedBox(height: 8.h),
                                            Text(
                                              videoInfo[index]["time"],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

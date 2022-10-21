import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final list = [
  {
    "title": "Soft skills training",
    "img": "assets/images/banner.png",
  },
  {
    "title": "Product or service training",
    "img": "assets/images/banner.png",
  },
  {
    "title": "Franchise training",
    "img": "assets/images/banner.png",
  },
  {
    "title": "Managerial and leadership training",
    "img": "assets/images/banner.png",
  }
];

class _HomePageState extends State<HomePage> {
  // CUSTOM - LIST - OF - THE - TRAINING

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            // HEADER - OF - THE - APP
            Row(
              children: [
                // TEXT - TITLE
                Text(
                  'Training',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Expanded(child: SizedBox()),
                // HEADER - ICONS
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 22.h),
            // YOUR - PROGRAM - DETAIL
            Row(
              children: [
                // YOUR - PROGRAM
                Text(
                  'Your program',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Expanded(child: SizedBox()),
                // DETAIL - BUTTON
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DetailScreen(),
                          ));
                        },
                        child: const Text(
                          "Details",
                          style: TextStyle(color: Colors.blueAccent),
                        )),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.arrow_forward,
                      size: 20.sp,
                      color: Colors.grey[800],
                    ),
                  ],
                ),
              ],
            ),
            // CUSTOM - WIDGET - CARD
            Container(
              padding: EdgeInsets.only(
                  left: 16.w, right: 16.w, top: 22.h, bottom: 8.h),
              margin: EdgeInsets.only(top: 16.h),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.teal,
                    Colors.teal.withOpacity(0.4),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  topRight: Radius.circular(70.r),
                  bottomRight: Radius.circular(8.r),
                  topLeft: Radius.circular(8.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next workout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Legs Toning',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'and Glutes Workout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.alarm,
                            color: Colors.white,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            '60 min',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.teal[900]!,
                              offset: const Offset(8, 10),
                              blurRadius: 10,
                            ),
                            const BoxShadow(
                              color: Colors.teal,
                              offset: Offset(-5, -2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.play_arrow,
                            size: 34.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // STACK - WIDGET - WITH - TEXT - NO - SLEEP
            Container(
              margin: EdgeInsets.only(top: 16.h, bottom: 24.h),
              width: MediaQuery.of(context).size.width,
              height: 110.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.6, 0.6),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/vector_1.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    padding: EdgeInsets.only(left: 120.w),
                    width: MediaQuery.of(context).size.width,
                    height: 24.h,
                    child: Text(
                      "NoSleep",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    width: 58.w,
                    height: 54.h,
                    margin: EdgeInsets.only(left: 133.w, top: 24.h),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/vector_2.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // CUSTOM - GRID - VIEW
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) => Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.black.withOpacity(0.02),
                      image: DecorationImage(
                        image: AssetImage(list[index]['img'].toString()),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 112.h),
                          child: Text(
                            list[index]['title'].toString(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_mansion/constant/theme.dart';

import '../widgets/category_list.dart';

class MembershipRegistration extends StatefulWidget {
  const MembershipRegistration({super.key});

  @override
  State<MembershipRegistration> createState() => _MembershipRegistrationState();
}

class _MembershipRegistrationState extends State<MembershipRegistration> {
  List<Map<String, dynamic>> propertyType = [
    {
      "title": "Lodging",
      "value": "lodge",
      "thumbnail": "assets/icons/lodge.svg",
    },
    {
      "title": "Apartment",
      "value": "apartment",
      "thumbnail": "assets/icons/residence.svg",
    },
    {
      "title": "Resort",
      "value": "resort",
      "thumbnail": "assets/icons/beach.svg",
    },
  ];
  var currentProperty = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close_rounded,
            color: Theme.of(context).colorScheme.surface,
          ),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Register your Property',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'Please provide required details to register your property.',
              style: GoogleFonts.oxygen(
                color: AppTheme.textHint.withOpacity(0.75),
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What would you like to list?',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: GridView.count(
                shrinkWrap: true,
                mainAxisSpacing: 8.w,
                crossAxisSpacing: 8.w,
                crossAxisCount: 3,
                physics: const BouncingScrollPhysics(),
                children: List.generate(
                  propertyType.length,
                  (int index) {
                    return Obx(
                      () {
                        return InkWell(
                          onTap: () {
                            currentProperty.value = index;
                          },
                          child: CategoryList(
                            isSelected: (currentProperty.value == index).obs,
                            thumbnail: SvgPicture.asset(
                              propertyType[index]['thumbnail'],
                              width: 40.w,
                              height: 40.w,
                            ),
                            title: propertyType[index]['title'],
                            value: propertyType[index]['value'],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
             Text(
              'What would you like to list?',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}

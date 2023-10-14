import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_mansion/constant/functions.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/widgets/button.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../widgets/category_list.dart';
import '../widgets/upload_images/images_list.dart';

class MembershipRegistration extends StatefulWidget {
  const MembershipRegistration({super.key});

  @override
  State<MembershipRegistration> createState() => _MembershipRegistrationState();
}

class _MembershipRegistrationState extends State<MembershipRegistration> {
  List<DropdownMenuEntry> currencies = [];
  List<DropdownMenuItem> countries = [];
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
  var accommodateValue = 1.obs;
  var bathroomValue = 1.obs;
  var bedroomValue = 1.obs;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Functions.loadCountries().then((value) {
        for (var element in value) {
          countries.add(
            DropdownMenuItem(
              value: element.toLowerCase(),
              child: Text(element),
            ),
          );
        }
      });
      await Functions.loadCurrencies().then((value) {
        for (var element in value) {
          currencies.add(
            DropdownMenuEntry(
              label: element,
              value: element.toLowerCase(),
            ),
          );
        }
      });
      setState(() {});
    });
    super.initState();
  }

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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Center(
                  child: Text(
                    'Rooms and details',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
              Text(
                'Accommodates',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'The maximum number of people who can sleep comfortably given the total bed space and sofas.',
                style: GoogleFonts.oxygen(
                  color: AppTheme.textHint.withOpacity(0.75),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '01',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Expanded(
                      child: Obx(() {
                        return Slider(
                          value: accommodateValue.value.toDouble(),
                          min: 1,
                          max: 15,
                          divisions: 15,
                          activeColor: AppTheme.primary,
                          inactiveColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          label: '${accommodateValue.value.round()}',
                          onChanged: (double newValue) {
                            accommodateValue.value = newValue.toInt();
                          },
                          semanticFormatterCallback: (double newValue) {
                            return '$newValue';
                          },
                        );
                      }),
                    ),
                    Text(
                      '15',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Text(
                'Bathrooms',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Count only bathrooms on your property, not shared or common bathrooms in your building or complex.',
                style: GoogleFonts.oxygen(
                  color: AppTheme.textHint.withOpacity(0.75),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '01',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Expanded(
                      child: Obx(() {
                        return Slider(
                          value: bathroomValue.value.toDouble(),
                          min: 1,
                          max: 15,
                          divisions: 15,
                          activeColor: AppTheme.primary,
                          inactiveColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          label: '${bathroomValue.value.round()}',
                          onChanged: (double newValue) {
                            bathroomValue.value = newValue.toInt();
                          },
                          semanticFormatterCallback: (double newValue) {
                            return '$newValue';
                          },
                        );
                      }),
                    ),
                    Text(
                      '15',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Text(
                'Bedrooms',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'If your property is a loft or studio, the number of bedrooms is zero.',
                style: GoogleFonts.oxygen(
                  color: AppTheme.textHint.withOpacity(0.75),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '01',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Expanded(
                      child: Obx(() {
                        return Slider(
                          value: bedroomValue.value.toDouble(),
                          min: 0,
                          max: 15,
                          divisions: 15,
                          activeColor: AppTheme.primary,
                          inactiveColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          label: '${bedroomValue.value.round()}',
                          onChanged: (double newValue) {
                            bedroomValue.value = newValue.toInt();
                          },
                          semanticFormatterCallback: (double newValue) {
                            return '$newValue';
                          },
                        );
                      }),
                    ),
                    Text(
                      '15',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Where is your property located?',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'Please provide your address using Latin or Roman characters. The Latin or Roman alphabet uses characters like a, b, and c.',
                    style: GoogleFonts.oxygen(
                      color: AppTheme.textHint.withOpacity(0.75),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: TextFormField(
                  cursorColor: AppTheme.primary,
                  keyboardType: TextInputType.name,
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    label: const Text('Street Address'),
                    isDense: true,
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.titleSmall,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: DropdownButtonFormField(
                  padding: EdgeInsets.zero,
                  items: countries,
                  isDense: true,
                  onChanged: (value) {},
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    label: const Text('Country'),
                    isDense: true,
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.titleSmall,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: TextFormField(
                  cursorColor: AppTheme.primary,
                  keyboardType: TextInputType.name,
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    label: const Text('City'),
                    isDense: true,
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.titleSmall,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: TextFormField(
                        cursorColor: AppTheme.primary,
                        keyboardType: TextInputType.name,
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          label: const Text('State'),
                          isDense: true,
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                          labelStyle: Theme.of(context).textTheme.titleSmall,
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.textHint,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.textHint,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: TextFormField(
                        cursorColor: AppTheme.primary,
                        keyboardType: TextInputType.number,
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          label: const Text('Zip Code'),
                          isDense: true,
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                          labelStyle: Theme.of(context).textTheme.titleSmall,
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.textHint,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.textHint,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'What’s unique and wonderful about your property?',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'Make it count, and make it sound inviting! Don’t worry, we’ll generate other languages using a standard translation template.',
                    style: GoogleFonts.oxygen(
                      color: AppTheme.textHint.withOpacity(0.75),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: TextFormField(
                  cursorColor: AppTheme.primary,
                  keyboardType: TextInputType.name,
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    label: const Text('Owner Name'),
                    isDense: true,
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.titleSmall,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: TextFormField(
                  cursorColor: AppTheme.primary,
                  keyboardType: TextInputType.name,
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    label: const Text('Name your property'),
                    isDense: true,
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.titleSmall,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: TextFormField(
                  cursorColor: AppTheme.primary,
                  minLines: 5,
                  maxLines: 6,
                  style: Theme.of(context).textTheme.bodySmall,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: const Text('Describe your place'),
                    isDense: true,
                    hintText:
                        'Why should a traveler choose to stay at your property?',
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.titleSmall,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'When arriving, how can guests get to your property?',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'Help your guests easily find your place and decrease the likelihood of cancellations and issues on day of check-in. We will send these directions to your guests after booking confirmation along with your address and a link to a Google map. You can also create check-in instructions for your property and share your contact information through our chat, so please do not add those here.',
                    style: GoogleFonts.oxygen(
                      color: AppTheme.textHint.withOpacity(0.75),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: TextFormField(
                  cursorColor: AppTheme.primary,
                  minLines: 5,
                  maxLines: 6,
                  style: Theme.of(context).textTheme.bodySmall,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText:
                        'Example:Take Airport link to [destination] (airport to city) Transfer trains heading towards [stop] (urban transportation) Send me a message after transferring trains (personal instruction)',
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    labelStyle: Theme.of(context).textTheme.titleSmall,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What comes with your property?',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'All the little things (and big things) you provide',
                    style: GoogleFonts.oxygen(
                      color: AppTheme.textHint.withOpacity(0.75),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recommended',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'Travelers prefer these amenities when booking homes.',
                      style: GoogleFonts.oxygen(
                        color: AppTheme.textHint.withOpacity(0.75),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              MultiSelectChipField(
                decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.none),
                ),
                showHeader: false,
                textStyle: Theme.of(context).textTheme.titleSmall,
                scroll: false,
                chipShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: const BorderSide(
                    color: AppTheme.primary,
                    width: 1,
                  ),
                ),
                items: <MultiSelectItem>[
                  MultiSelectItem('Towels', 'Towels'),
                  MultiSelectItem('Air conditioning', 'Air conditioning'),
                  MultiSelectItem('TV', 'TV'),
                  MultiSelectItem('Balcony or terrace', 'Balcony or terrace'),
                  MultiSelectItem('Desk/workspace', 'Desk/workspace'),
                  MultiSelectItem('Keyless access', 'Keyless access'),
                  MultiSelectItem('Beachfront', 'Beachfront'),
                  MultiSelectItem('Free parking', 'Free parking'),
                  MultiSelectItem('Free WiFi', 'Free WiFi'),
                  MultiSelectItem('Heating', 'Heating'),
                  MultiSelectItem('Private entrance', 'Private entrance'),
                  MultiSelectItem('Kitchen basics', 'Kitchen basics'),
                ],
                selectedChipColor: AppTheme.primary,
                selectedTextStyle: GoogleFonts.oxygen(
                  color: AppTheme.textLight,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                onTap: (values) {},
              ),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Standard',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'These amenities are found in most of our successful properties.',
                      style: GoogleFonts.oxygen(
                        color: AppTheme.textHint.withOpacity(0.75),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              MultiSelectChipField(
                decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.none),
                ),
                showHeader: false,
                textStyle: Theme.of(context).textTheme.titleSmall,
                scroll: false,
                chipShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: const BorderSide(
                    color: AppTheme.primary,
                    width: 1,
                  ),
                ),
                items: <MultiSelectItem>[
                  MultiSelectItem('Closet', 'Closet'),
                  MultiSelectItem('Dryer', 'Dryer'),
                  MultiSelectItem('Fans', 'Fans'),
                  MultiSelectItem('Linens', 'Linens'),
                  MultiSelectItem('Laundromat nearby', 'Laundromat nearby'),
                  MultiSelectItem('Washer', 'Washer'),
                  MultiSelectItem('Iron', 'Iron'),
                ],
                selectedChipColor: AppTheme.primary,
                selectedTextStyle: GoogleFonts.oxygen(
                  color: AppTheme.textLight,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                onTap: (values) {},
              ),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kitchen',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'Guests often book homes because of the kitchen, make sure you let travelers know what to expect in your kitchen spaces.',
                      style: GoogleFonts.oxygen(
                        color: AppTheme.textHint.withOpacity(0.75),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              MultiSelectChipField(
                decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.none),
                ),
                showHeader: false,
                textStyle: Theme.of(context).textTheme.titleSmall,
                scroll: false,
                chipShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: const BorderSide(
                    color: AppTheme.primary,
                    width: 1,
                  ),
                ),
                items: <MultiSelectItem>[
                  MultiSelectItem('Coffee/Tea maker', 'Coffee/Tea maker'),
                  MultiSelectItem('Dishwasher', 'Dishwasher'),
                  MultiSelectItem('Freezer', 'Freezer'),
                  MultiSelectItem('Microwave', 'Microwave'),
                  MultiSelectItem('Stove', 'Stove'),
                ],
                selectedChipColor: AppTheme.primary,
                selectedTextStyle: GoogleFonts.oxygen(
                  color: AppTheme.textLight,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                onTap: (values) {},
              ),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bathroom',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'Let guests know what features your bathroom(s) have.',
                      style: GoogleFonts.oxygen(
                        color: AppTheme.textHint.withOpacity(0.75),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              MultiSelectChipField(
                decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.none),
                ),
                showHeader: false,
                textStyle: Theme.of(context).textTheme.titleSmall,
                scroll: false,
                chipShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: const BorderSide(
                    color: AppTheme.primary,
                    width: 1,
                  ),
                ),
                items: <MultiSelectItem>[
                  MultiSelectItem('Hair Dryer', 'Hair Dryer'),
                  MultiSelectItem('Shampoo', 'Shampoo'),
                  MultiSelectItem('Body Wash', 'Body Wash'),
                  MultiSelectItem('Bathtub', 'Bathtub'),
                  MultiSelectItem('Hand sanitizer', 'Hand sanitizer'),
                ],
                selectedChipColor: AppTheme.primary,
                selectedTextStyle: GoogleFonts.oxygen(
                  color: AppTheme.textLight,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                onTap: (values) {},
              ),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Safety and Cleanliness',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'Show guests that you take their safety and health seriously with these amenities.',
                      style: GoogleFonts.oxygen(
                        color: AppTheme.textHint.withOpacity(0.75),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              MultiSelectChipField(
                decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.none),
                ),
                showHeader: false,
                textStyle: Theme.of(context).textTheme.titleSmall,
                scroll: false,
                chipShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: const BorderSide(
                    color: AppTheme.primary,
                    width: 1,
                  ),
                ),
                items: <MultiSelectItem>[
                  MultiSelectItem('Security [24-hour]', 'Security [24-hour]'),
                  MultiSelectItem('First Aid Kit', 'First Aid Kit'),
                  MultiSelectItem('Smoke detector', 'Smoke detector'),
                  MultiSelectItem('Fire extinguisher', 'Fire extinguisher'),
                  MultiSelectItem('Contactless check-in/check-out',
                      'Contactless check-in/check-out'),
                ],
                selectedChipColor: AppTheme.primary,
                selectedTextStyle: GoogleFonts.oxygen(
                  color: AppTheme.textLight,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                onTap: (values) {},
              ),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Other',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'Other offerings that may accommodate certain traveler needs.',
                      style: GoogleFonts.oxygen(
                        color: AppTheme.textHint.withOpacity(0.75),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              MultiSelectChipField(
                decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.none),
                ),
                textStyle: Theme.of(context).textTheme.titleSmall,
                showHeader: false,
                scroll: false,
                chipShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: const BorderSide(
                    color: AppTheme.primary,
                    width: 1,
                  ),
                ),
                items: <MultiSelectItem>[
                  MultiSelectItem('Gym', 'Gym'),
                  MultiSelectItem('Hot tub', 'Hot tub'),
                  MultiSelectItem('Indoor pool', 'Indoor pool'),
                  MultiSelectItem('Pets allowed', 'Pets allowed'),
                  MultiSelectItem('Smoking Area', 'Smoking Area'),
                  MultiSelectItem('Indoor fireplace', 'Indoor fireplace'),
                ],
                selectedChipColor: AppTheme.primary,
                selectedTextStyle: GoogleFonts.oxygen(
                  color: AppTheme.textLight,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                onTap: (values) {},
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set your prices.',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'Choose your nightly room rates based on guests and other conditions.',
                    style: GoogleFonts.oxygen(
                      color: AppTheme.textHint.withOpacity(0.75),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: TextFormField(
                        cursorColor: AppTheme.primary,
                        style: Theme.of(context).textTheme.bodySmall,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          isDense: true,
                          label: const Text('Nightly Price'),
                          hintText: '0.00',
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                          labelStyle: Theme.of(context).textTheme.titleSmall,
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.textHint,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.textHint,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Flexible(
                    //   flex: 1,
                    //   child: DropdownMenu(
                    //     width: 90.w,
                    //     hintText: 'USD',
                    //     textStyle: Theme.of(context).textTheme.bodySmall,
                    //     inputDecorationTheme: InputDecorationTheme(
                    //       isDense: true,
                    //       isCollapsed: true,
                    //       hintStyle: Theme.of(context).textTheme.titleSmall,
                    //       border: InputBorder.none,
                    //     ),
                    //     menuStyle: MenuStyle(
                    //       side: const MaterialStatePropertyAll(BorderSide.none),
                    //       backgroundColor: MaterialStatePropertyAll(
                    //         Theme.of(context).scaffoldBackgroundColor,
                    //       ),
                    //     ),
                    //     dropdownMenuEntries: currencies,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Weekly Rate',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'The following discount will apply to bookings which are for 7 or more nights.',
                      style: GoogleFonts.oxygen(
                        color: AppTheme.textHint.withOpacity(0.75),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: TextFormField(
                        cursorColor: AppTheme.primary,
                        keyboardType: TextInputType.name,
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          label: const Text('%Off'),
                          isDense: true,
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                          labelStyle: Theme.of(context).textTheme.titleSmall,
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.textHint,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.textHint,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: TextFormField(
                        cursorColor: AppTheme.primary,
                        keyboardType: TextInputType.number,
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          label: const Text('Per Night'),
                          isDense: true,
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                          labelStyle: Theme.of(context).textTheme.titleSmall,
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.textHint,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.textHint,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Monthly Rate',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'The following discount will apply to bookings which are for 28 or more nights.',
                      style: GoogleFonts.oxygen(
                        color: AppTheme.textHint.withOpacity(0.75),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: TextFormField(
                        cursorColor: AppTheme.primary,
                        keyboardType: TextInputType.name,
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          label: const Text('%Off'),
                          isDense: true,
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                          labelStyle: Theme.of(context).textTheme.titleSmall,
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.textHint,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.textHint,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: TextFormField(
                        cursorColor: AppTheme.primary,
                        keyboardType: TextInputType.number,
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          label: const Text('Per Night'),
                          isDense: true,
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                          labelStyle: Theme.of(context).textTheme.titleSmall,
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.textHint,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.textHint,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: AppTheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Show them what they’re missing.',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'Pictures matter to travelers. Upload as many high-quality images as you have. You can add more later. Want some tips on how to upload quality photos that generate more bookings?',
                    style: GoogleFonts.oxygen(
                      color: AppTheme.textHint.withOpacity(0.75),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const ImagesList(),
              Center(
                child: Button(
                  width: 230.w,
                  height: 50.h,
                  borderRadius: 8.r,
                  color: AppTheme.primary,
                  onPressed: () {},
                  widget: Text(
                    'Submit Details',
                    style: GoogleFonts.oxygen(
                      color: AppTheme.textLight,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

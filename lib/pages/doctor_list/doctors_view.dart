import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter_g4/model/doctor_tile_model.dart';
import 'package:flutter_g4/pages/doctor/widget/app_text_widget.dart';
import 'package:flutter_g4/utils/constants/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class DoctorsListView extends StatefulWidget {
  const DoctorsListView({super.key});

  @override
  State<DoctorsListView> createState() => _DoctorsListViewState();
}

class _DoctorsListViewState extends State<DoctorsListView> {
  final List<DoctorTileModel?> _doctorList = [
    const DoctorTileModel(
        image: AppImages.doctor1,
        isOnline: true,
        isFavourite: true,
        name: 'Dr. Rodger Struck',
        profession: 'Heart Surgeon, London, England',
        rating: 4.8),
    const DoctorTileModel(
        image: AppImages.doctor1,
        isOnline: true,
        isFavourite: true,
        name: 'Dr. Rodger Struck',
        profession: 'Heart Surgeon, London, England',
        rating: 3),
    const DoctorTileModel(
        image: AppImages.doctor2,
        isOnline: false,
        isFavourite: false,
        name: 'Dr. Kathy Pacheco',
        profession: 'Heart Surgeon, London, England',
        rating: 4.8),
    const DoctorTileModel(
        image: AppImages.doctor1,
        isOnline: true,
        isFavourite: true,
        name: 'Dr. Rodger Struck',
        profession: 'Heart Surgeon, London, England',
        rating: 2),
    const DoctorTileModel(
        image: AppImages.doctor1,
        isOnline: true,
        isFavourite: true,
        name: 'Dr. Rodger Struck',
        profession: 'Heart Surgeon, London, England',
        rating: 4.8),
    const DoctorTileModel(
        image: AppImages.doctor1,
        isOnline: true,
        isFavourite: true,
        name: 'Dr. Rodger Struck',
        profession: 'Heart Surgeon, London, England',
        rating: 4.8),
  ];

  final ScrollController _scrollController = ScrollController();
  double _searchPosition = 0;

  @override
  void initState() {
    _scrollController.addListener(listenScroll);
    super.initState();
  }

  listenScroll() {
    if (_scrollController.position.pixels > 20) {
      _searchPosition = -100;
      setState(() {});
    } else {
      _searchPosition = 0;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void showInfoDialog(DoctorTileModel doctor, int index) {
    double rating = 0;
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text('Rate'),
              content: Center(
                child: RatingBar.builder(
                  initialRating: doctor.rating.toDouble(),
                  minRating: 1,
                  wrapAlignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: AppColors.badgeColor,
                  ),
                  onRatingUpdate: (newRating) {
                    debugPrint('$rating');
                    rating = newRating;
                  },
                ),
              ),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      DoctorTileModel newDoctor =
                          _doctorList[index]!.copyWith(rating: rating);
                      _doctorList.removeAt(index);
                      _doctorList.insert(index, newDoctor);
                      setState(() {});
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('save'),
                )
              ],
            ),
        barrierDismissible: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: .0,
        title: const AppTextWidget('Top Doctor'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          //*-------------Body
          AnimationLimiter(
            child: ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 80),
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  final DoctorTileModel doctorTileModel = _doctorList[index]!;
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 600),
                    child: ScaleAnimation(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26),
                          child: Slidable(
                            key: ValueKey<int>(index),
                            endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              children: [
                                SlidableAction(
                                  flex: 2,
                                  onPressed: (context) {
                                    showInfoDialog(doctorTileModel, index);
                                  },
                                  backgroundColor: AppColors.badgeColor,
                                  foregroundColor: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  icon: Icons.star,
                                  label: 'Rate',
                                ),
                              ],
                            ),
                            child: _CustomDoctorTile(
                                onTap: () {}, doctorTileModel: doctorTileModel),
                          )),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: _doctorList.length),
          ),

          //*-------------Search field
          AnimatedPositioned(
            top: _searchPosition,
            left: 0,
            right: 0,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeIn,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: SizedBox(
                  height: 54,
                  width: double.infinity,
                  child: TextField(
                      decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(CupertinoIcons.search),
                    hintText: 'Search doctor',
                    hintStyle: AppTextStyles.mediumText.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 4,
                        color: const Color(0xff8a96bc)),
                    prefixIconColor: const Color(0xff8a96bc),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2.5, color: Color(0xffF7F8F8))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2.5, color: Color(0xffF7F8F8))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2.5, color: Color(0xffF7F8F8))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2.5, color: Color(0xffF7F8F8))),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2.5, color: Color(0xffF7F8F8))),
                  )),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}

class _CustomDoctorTile extends StatelessWidget {
  final DoctorTileModel? doctorTileModel;
  final VoidCallback onTap;
  const _CustomDoctorTile({required this.doctorTileModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .0,
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.5,
            color: const Color(0xffF7F8F8),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    badge.Badge(
                      position: badge.BadgePosition.topEnd(end: -1, top: -1),
                      badgeStyle: badge.BadgeStyle(
                          badgeColor: doctorTileModel!.isOnline
                              ? AppColors.badgeColor
                              : Colors.red,
                          padding: const EdgeInsets.all(8),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white)),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.avatarColor,
                            image: DecorationImage(
                                image: AssetImage(doctorTileModel!.image))),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star_half,
                          size: 18,
                          color: AppColors.badgeColor,
                        ),
                        Text(
                          doctorTileModel!.rating.toString(),
                          style: AppTextStyles.mediumText.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color(0x66080C2F)),
                        )
                      ],
                    )
                  ],
                )),
            const Spacer(
              flex: 1,
            ),
            Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorTileModel!.name,
                      style: AppTextStyles.mediumText
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      doctorTileModel!.profession,
                      style: AppTextStyles.mediumText.copyWith(
                          color: const Color(0xff8a96bc),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 34,
                          child: CupertinoButton(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            onPressed: () {},
                            color: const Color(0xffF7F8F8),
                            child: Text(
                              'Appointment',
                              style: AppTextStyles.mediumText.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 34,
                          width: 34,
                          child: CupertinoButton(
                            padding: const EdgeInsets.all(10),
                            onPressed: () {},
                            color: const Color(0xffF7F8F8),
                            child: const Icon(
                              Icons.message,
                              color: AppColors.statisticsColor,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 34,
                          width: 34,
                          child: CupertinoButton(
                            padding: const EdgeInsets.all(10),
                            onPressed: () {},
                            color: const Color(0xffF7F8F8),
                            child: Icon(
                              Icons.favorite,
                              color: doctorTileModel!.isFavourite
                                  ? AppColors.statisticsColor
                                  : Colors.grey,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

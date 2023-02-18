import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_g4/pages/doctor/day_model.dart';
import 'package:flutter_g4/pages/doctor/widget/app_text_widget.dart';
import 'package:flutter_g4/utils/constants/constants.dart';
import 'package:badges/badges.dart' as badge;

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  final List<Day?> _dayList = [
    Day(isSelected: false, number: 7, text: 'sun'),
    Day(isSelected: false, number: 8, text: 'mon'),
    Day(isSelected: true, number: 9, text: 'tue'),
    Day(isSelected: false, number: 10, text: 'wed'),
    Day(isSelected: false, number: 11, text: 'thu'),
    Day(isSelected: false, number: 12, text: 'fri')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointment',
          style: AppTextStyles.mediumText,
        ),
        elevation: .0,
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //*-------------Avatar Widget
                  const _DoctorAvatar(
                    name: 'Dr. Maria Waston',
                    profession: 'Cardio Specialist',
                  ),

                  const SizedBox(
                    height: 17,
                  ),

                  //*-------------Statistics widget
                  const _StatisticsWidget(),
                  const SizedBox(
                    height: 28,
                  ),

                  //*-------------descriptions
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 41),
                    child: SizedBox(
                        width: double.infinity,
                        child: AppTextWidget('About Doctor')),
                  ),

                  const SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 41),
                    child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Dr. Maria Waston is the top most Cardiologist specialist in Nanyang Hospotalat London. She is available for private consultation.',
                          textAlign: TextAlign.justify,
                          style: AppTextStyles.mediumText.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.professionColor),
                        )),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  //*-------------schedules
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 41),
                    child: CupertinoListTile(
                      title: const AppTextWidget('Schedules'),
                      padding: EdgeInsets.zero,
                      trailing: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'August',
                              textAlign: TextAlign.justify,
                              style: AppTextStyles.mediumText.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.professionColor),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  //*-------------days
                  SizedBox(
                      height: 65,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 41),
                        itemCount: _dayList.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 14,
                        ),
                        itemBuilder: (context, index) {
                          final Day? day = _dayList[index];
                          return _DayWidget(
                            day: day!,
                          );
                        },
                      )),
                  const SizedBox(
                    height: 18,
                  ),
                  //*-------------visit hour
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 41),
                    child: CupertinoListTile(
                      title: AppTextWidget('Visit Hours'),
                      padding: EdgeInsets.zero,
                    ),
                  ),

                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            //*-------------button
            Positioned(
                left: 41,
                right: 41,
                bottom: 28,
                child: _Button(
                  onTap: () {},
                  title: 'Book Appointment',
                ))
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _Button({required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: AppColors.statisticsColor),
        onPressed: onTap,
        child: Text(
          title,
          style: AppTextStyles.mediumText.copyWith(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}

class _DoctorAvatar extends StatelessWidget {
  final String name;
  final String profession;
  const _DoctorAvatar({required this.name, required this.profession});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        badge.Badge(
          position: badge.BadgePosition.topEnd(end: -1, top: -1),
          badgeStyle: const badge.BadgeStyle(
              badgeColor: AppColors.badgeColor,
              padding: EdgeInsets.all(8),
              borderSide: BorderSide(width: 2, color: Colors.white)),
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.avatarColor,
                image:
                    const DecorationImage(image: AssetImage(AppImages.doctor))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //*-------------Doctor name
        AppTextWidget(name),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite_rounded,
              size: 12,
              color: Colors.red,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              profession,
              style: AppTextStyles.mediumText
                  .copyWith(fontSize: 12, color: AppColors.professionColor),
            )
          ],
        )
      ],
    );
  }
}

class _StatisticsWidget extends StatelessWidget {
  const _StatisticsWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 26),
      height: 106,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: AppColors.statisticsColor,
          borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Expanded(
              child: _StatisticsTextWidget(
            count: 350,
            type: 'Patient',
            color: AppColors.statisticsColor,
          )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: _StatisticsTextWidget(
            count: 15,
            type: 'Exp.years',
            color: AppColors.badgeColor,
          )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: _StatisticsTextWidget(
            count: 284,
            type: 'Reviews',
            color: AppColors.reviewColor,
          )),
        ],
      ),
    );
  }
}

class _StatisticsTextWidget extends StatelessWidget {
  final int count;
  final String type;
  final Color color;
  const _StatisticsTextWidget(
      {required this.color, required this.count, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$count+',
            style: AppTextStyles.mediumText.copyWith(
                fontSize: 26, fontWeight: FontWeight.w600, color: color),
          ),
          Text(
            type,
            style: AppTextStyles.mediumText.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.professionColor),
          )
        ],
      ),
    );
  }
}

class _DayWidget extends StatelessWidget {
  final Day day;
  const _DayWidget({required this.day});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        height: 64,
        width: 60,
        decoration: BoxDecoration(
            color: day.isSelected ? AppColors.statisticsColor : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: day.isSelected
                ? null
                : Border.all(width: 2, color: AppColors.professionColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              day.number.toString(),
              style: AppTextStyles.mediumText.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: day.isSelected ? Colors.white : Colors.black),
            ),
            Text(
              day.text,
              style: AppTextStyles.mediumText.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: day.isSelected
                      ? Colors.white
                      : AppColors.professionColor),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_g4/utils/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  int _currentMenu = 0;

  int _currentTileMenu = 0;

  @override
  void didChangeDependencies() {
    ScreenUtil.init(context, designSize: AppConstants.desktopDesignSize);
    super.didChangeDependencies();
  }

  void onSelectMenu(int index) {
    _currentMenu = index;
    setState(() {});
  }

  void onSelectMenuTile(int index) {
    _currentTileMenu = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //*-------------header
          SizedBox(
            height: 64.h,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 16.w,
                    ),
                    SizedBox.square(
                      dimension: 40,
                      child: MaterialButton(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10).r),
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        color: Colors.white,
                        child: Text(
                          'D',
                          style: AppTextStyles.racingMediumItalic,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Dashboard',
                      style: AppTextStyles.racingMediumItalic
                          .copyWith(color: const Color(0xFF5e6366)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 72.w,
                      height: 40.h,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10).r),
                            side: BorderSide(width: 1.w, color: Colors.grey)),
                        icon: const Icon(Icons.menu),
                        onPressed: () {},
                        label: const Text('13'),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 15.h,
                    ),
                    Text(
                      'MyWorkspace',
                      style: AppTextStyles.robotoMedium.copyWith(
                          fontStyle: FontStyle.normal,
                          fontSize: 16.sp,
                          color: Colors.grey.withOpacity(.5)),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 15.h,
                    ),
                    Text(
                      'Drafts',
                      style: AppTextStyles.robotoMedium.copyWith(
                          fontStyle: FontStyle.normal,
                          fontSize: 16.sp,
                          color: Colors.grey.withOpacity(.5)),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 15.h,
                    ),
                    Text(
                      'Analytika_dashboard_kit',
                      style: AppTextStyles.robotoMedium.copyWith(
                          fontStyle: FontStyle.normal,
                          fontSize: 16.sp,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: 96.w,
                      child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          color: const Color(0xFFf7f9fa),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Help',
                                style: AppTextStyles.robotoMedium.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: const Color(0xff5e6366)),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const Icon(
                                Icons.help,
                                color: Colors.grey,
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    SizedBox(
                      height: 40.h,
                      width: 96.w,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.blue,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10).r)),
                          child: Text(
                            'Upgrade'.toUpperCase(),
                            style: AppTextStyles.robotoMedium.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: const Color(0xFF367bf5)),
                          )),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    const CircleAvatar(
                      backgroundImage: AssetImage(AppImages.desktopAvatar),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                  ],
                )
              ],
            ),
          ),
          //*-------------header 2
          SizedBox(
            height: 64.h,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 184.w,
                      height: 32.h,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {},
                        label: const Text('Back to previous'),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    _ButtonWidget(
                      text: 'Analyze',
                      isEnabled: _currentMenu == 0,
                      onPressed: () => onSelectMenu(0),
                    ),
                    _ButtonWidget(
                      text: 'My Compaign',
                      isEnabled: _currentMenu == 1,
                      onPressed: () => onSelectMenu(1),
                    ),
                    _ButtonWidget(
                      text: 'Configure',
                      isEnabled: _currentMenu == 2,
                      onPressed: () => onSelectMenu(2),
                    ),
                    _ButtonWidget(
                      text: 'Customized',
                      isEnabled: _currentMenu == 3,
                      onPressed: () => onSelectMenu(3),
                    ),
                    _ButtonWidget(
                      text: 'Research',
                      isEnabled: _currentMenu == 4,
                      onPressed: () => onSelectMenu(4),
                    ),
                    _ButtonWidget(
                      text: 'Inspect',
                      isEnabled: _currentMenu == 5,
                      onPressed: () => onSelectMenu(5),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 232.w,
                      height: 32.h,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              side: const BorderSide(
                                  width: 1, color: Colors.grey)),
                          onPressed: () {},
                          child: const Text('Aug 21, 2016 · Sep 21 2016')),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                  ],
                )
              ],
            ),
          ),
          //*-------------body

          Expanded(
            child: Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //*-------------menus
                          Column(
                            children: [
                              SizedBox(
                                height: 32.h,
                              ),
                              SizedBox(
                                height: 56.h,
                                width: 213.w,
                                child: ElevatedButton.icon(
                                    icon: const Icon(
                                      CupertinoIcons.add_circled,
                                      color: Color(0xFF367bf5),
                                    ),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      elevation: 10.h,
                                      shadowColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(99).r),
                                      backgroundColor: Colors.white,
                                    ),
                                    label: Text(
                                      'Create New',
                                      style: AppTextStyles.quickSandStyle,
                                    )),
                              ),
                              SizedBox(
                                height: 31.h,
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 64.w),
                                  child: _CustomMenuTile(
                                    subtitle: 'Track your apps across devices',
                                    title: 'Metrics',
                                    isSelected: _currentTileMenu == 0,
                                    onTap: () => onSelectMenuTile(0),
                                    child: const Icon(
                                      Icons.donut_large,
                                      color: Colors.black38,
                                    ),
                                  )),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 64.w),
                                  child: _CustomMenuTile(
                                    subtitle: 'View your results as Excel file',
                                    title: 'Results',
                                    isSelected: _currentTileMenu == 1,
                                    onTap: () => onSelectMenuTile(1),
                                    child: const Icon(
                                      Icons.done_outlined,
                                      color: Colors.black38,
                                    ),
                                  )),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 64.w),
                                  child: _CustomMenuTile(
                                    subtitle: 'Track visits to your sites',
                                    title: 'Google Analytics',
                                    isSelected: _currentTileMenu == 2,
                                    onTap: () => onSelectMenuTile(2),
                                    child: const Icon(
                                      Icons.chat_sharp,
                                      color: Colors.black38,
                                    ),
                                  )),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 64.w),
                                  child: _CustomMenuTile(
                                    subtitle: 'Get insights into the big data',
                                    title: 'Reports',
                                    isSelected: _currentTileMenu == 3,
                                    onTap: () => onSelectMenuTile(3),
                                    child: const Icon(
                                      Icons.print,
                                      color: Colors.black38,
                                    ),
                                  )),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 64.w),
                                  child: _CustomMenuTile(
                                    subtitle: 'upgrade your plan to pro',
                                    isSelected: _currentTileMenu == 4,
                                    onTap: () => onSelectMenuTile(4),
                                    title: 'More tools',
                                    child: const Icon(
                                      Icons.settings,
                                      color: Colors.black38,
                                    ),
                                  )),
                            ],
                          ), //*-------------menus
                          Column(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 64.w),
                                  child: SizedBox(
                                    height: 30.h,
                                    child: Card(
                                      elevation: .0,
                                      color: Colors.transparent,
                                      child: ListTile(
                                        dense: true,
                                        horizontalTitleGap: .0,
                                        leading: const Icon(
                                          Icons.settings,
                                          color: Colors.black38,
                                        ),
                                        title: Text(
                                          'Settings',
                                          style: AppTextStyles.robotoMedium
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 8.h,
                              ),
                              Divider(
                                thickness: 1.h,
                                indent: 64.w,
                                endIndent: 64.w,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 64.w),
                                child: SizedBox(
                                  height: 30.h,
                                  child: Card(
                                    elevation: .0,
                                    color: Colors.transparent,
                                    child: ListTile(
                                      dense: true,
                                      horizontalTitleGap: .0,
                                      leading: const Icon(
                                        Icons.refresh,
                                        color: Colors.black38,
                                      ),
                                      title: Text(
                                        'Previous Version',
                                        style: AppTextStyles.robotoMedium
                                            .copyWith(
                                                fontSize: 14.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Divider(
                                thickness: 1.h,
                                indent: 64.w,
                                endIndent: 64.w,
                                color: Colors.grey,
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 64.w),
                                  child: SizedBox(
                                    height: 30.h,
                                    child: Card(
                                      elevation: .0,
                                      color: Colors.transparent,
                                      child: ListTile(
                                        dense: true,
                                        horizontalTitleGap: .0,
                                        leading: const Icon(
                                          Icons.info_outlined,
                                          color: Colors.black38,
                                        ),
                                        title: Text(
                                          'What’s new?',
                                          style: AppTextStyles.robotoMedium
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 8.h,
                              ),
                              Divider(
                                thickness: 1.h,
                                indent: 64.w,
                                endIndent: 64.w,
                                color: Colors.grey,
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 64.w),
                                  child: SizedBox(
                                    height: 30.h,
                                    child: Card(
                                      elevation: .0,
                                      color: Colors.transparent,
                                      child: ListTile(
                                        dense: true,
                                        horizontalTitleGap: .0,
                                        leading: const Icon(
                                          Icons.help_outline,
                                          color: Colors.black38,
                                        ),
                                        title: Text(
                                          'Customers Support',
                                          style: AppTextStyles.robotoMedium
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 8.h,
                              ),
                              Divider(
                                thickness: 1.h,
                                indent: 64.w,
                                endIndent: 64.w,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 24.h,
                                    width: 70.w,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                          Color(0xFFD1FDFF),
                                          Color(0xFFFFECBC)
                                        ])),
                                    child: Center(
                                      child: Text(
                                        'privacy',
                                        style: AppTextStyles.robotoMedium
                                            .copyWith(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                    width: 70.w,
                                    child: Center(
                                      child: Text(
                                        'TERMS',
                                        style: AppTextStyles.robotoMedium
                                            .copyWith(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                    width: 70.w,
                                    child: Center(
                                      child: Text(
                                        'Status',
                                        style: AppTextStyles.robotoMedium
                                            .copyWith(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                            ],
                          )
                        ])),
                Expanded(
                    flex: 9,
                    child: Column(
                      children: [
                        //*-------------dashboard
                        SizedBox(
                          height: 43.h,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Dashboard',
                                style: AppTextStyles.quickSandStyle.copyWith(
                                    fontSize: 34.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 40.h,
                                    width: 132.w,
                                    child: CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        color: const Color(0xFFf7f9fa),
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Past month',
                                              style: AppTextStyles.robotoMedium
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16.sp,
                                                      color: const Color(
                                                          0xff5e6366)),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        )),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  SizedBox(
                                      height: 32.h,
                                      width: 32.w,
                                      child: CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        color: const Color(0xFFf7f9fa),
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.print,
                                          size: 11.w,
                                          color: Colors.grey,
                                        ),
                                      )),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  SizedBox(
                                      height: 32.h,
                                      width: 32.w,
                                      child: CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        color: const Color(0xFFf7f9fa),
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.download,
                                          size: 11.w,
                                          color: Colors.grey,
                                        ),
                                      )),
                                  SizedBox(
                                    width: 64.w,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        //*-------------Statistics
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const _CustomStatistics(
                                color: Color(0xFFea3d2f),
                                name: 'Played',
                                number: 1254),
                            const _CustomStatistics(
                                color: Color(0xFf367bf5),
                                name: 'Finished',
                                number: 809),
                            const _CustomStatistics(
                                color: Color(0xFF2fa84f),
                                name: 'Likes',
                                number: 114),
                            const _CustomStatistics(
                                color: Color(0xFFf3aa18),
                                name: 'Comments',
                                number: 27),
                            SizedBox(
                              width: 46.w,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 64),
                          child: SizedBox(
                            width: double.infinity,
                            height: 304.h,
                            child: DataTableTheme(
                                data: DataTableThemeData(
                                    headingTextStyle:
                                        AppTextStyles.quickSandStyle.copyWith(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF919699)),
                                    dataTextStyle: AppTextStyles.robotoMedium
                                        .copyWith(
                                            fontSize: 14.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400)),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    child: DataTable(
                                        onSelectAll: (value) {},
                                        dividerThickness: 2.h,
                                        border: const TableBorder(
                                            horizontalInside: BorderSide(
                                                width: 2,
                                                color: Color(0xFFE3E5E5))),
                                        columns: const [
                                          DataColumn(label: Text('Campaigns')),
                                          DataColumn(label: Text('Efficiency')),
                                          DataColumn(label: Text('Plays')),
                                          DataColumn(label: Text('Finished')),
                                          DataColumn(label: Text('Likes')),
                                          DataColumn(label: Text('Comments')),
                                        ],
                                        rows: [
                                          DataRow(
                                              selected: true,
                                              onSelectChanged: (newValue) {},
                                              cells: [
                                                DataCell(ListTile(
                                                  dense: true,
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  title: Text(
                                                      'Instagram stories marketing',
                                                      style: AppTextStyles
                                                          .robotoMedium
                                                          .copyWith(
                                                              fontSize: 14.sp,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                  subtitle: Text(
                                                      'Draft · Customize · Edit · Referrers',
                                                      style: AppTextStyles
                                                          .robotoMedium
                                                          .copyWith(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: const Color(
                                                                  0xFF919699))),
                                                )),
                                                const DataCell(SizedBox(
                                                  width: double.infinity,
                                                  child: Text(
                                                    '186',
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                )),
                                                const DataCell(SizedBox(
                                                    width: double.infinity,
                                                    child: Text(
                                                      '186',
                                                      textAlign: TextAlign.end,
                                                    ))),
                                                const DataCell(SizedBox(
                                                    width: double.infinity,
                                                    child: Text(
                                                      '186',
                                                      textAlign: TextAlign.end,
                                                    ))),
                                                const DataCell(SizedBox(
                                                    width: double.infinity,
                                                    child: Text(
                                                      '186',
                                                      textAlign: TextAlign.end,
                                                    ))),
                                                const DataCell(SizedBox(
                                                    width: double.infinity,
                                                    child: Text(
                                                      '186',
                                                      textAlign: TextAlign.end,
                                                    ))),
                                              ]),
                                          DataRow(cells: [
                                            DataCell(ListTile(
                                              dense: true,
                                              contentPadding: EdgeInsets.zero,
                                              title: Text(
                                                  'Social Networks traffic',
                                                  style: AppTextStyles
                                                      .robotoMedium
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                              subtitle: Text(
                                                  'Paused · Customize · Settings',
                                                  style: AppTextStyles
                                                      .robotoMedium
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color(
                                                              0xFF919699))),
                                            )),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(ListTile(
                                              dense: true,
                                              contentPadding: EdgeInsets.zero,
                                              title: Text(
                                                  'Visitors from video sources',
                                                  style: AppTextStyles
                                                      .robotoMedium
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                              subtitle: Text(
                                                  'Active · Customize · Settings',
                                                  style: AppTextStyles
                                                      .robotoMedium
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color(
                                                              0xFF919699))),
                                            )),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(ListTile(
                                              dense: true,
                                              contentPadding: EdgeInsets.zero,
                                              title: Text('Other Referrers',
                                                  style: AppTextStyles
                                                      .robotoMedium
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                              subtitle: Text(
                                                  'Active · Customize · Settings',
                                                  style: AppTextStyles
                                                      .robotoMedium
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color(
                                                              0xFF919699))),
                                            )),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                            const DataCell(SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '186',
                                                  textAlign: TextAlign.end,
                                                ))),
                                          ]),
                                        ]),
                                  ),
                                )),
                          ),
                        ),
                        Expanded(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(right: 64),
                              child: SizedBox(
                                width: double.infinity,
                                height: 304.h,
                                child: DataTableTheme(
                                    data: DataTableThemeData(
                                        headingTextStyle:
                                            AppTextStyles.robotoMedium.copyWith(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF919699)),
                                        dataTextStyle:
                                            AppTextStyles.robotoMedium.copyWith(
                                                fontSize: 14.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400)),
                                    child: DataTable(
                                        onSelectAll: (value) {},
                                        dividerThickness: 2.h,
                                        border: const TableBorder(
                                            horizontalInside: BorderSide(
                                                width: 2,
                                                color: Color(0xFFE3E5E5))),
                                        columns: const [
                                          DataColumn(
                                              label: Text('Type of Action')),
                                          DataColumn(label: Text('Value Two')),
                                          DataColumn(label: Text('Value One')),
                                        ],
                                        rows: [
                                          DataRow(cells: [
                                            DataCell(Text('Video Played',
                                                style: AppTextStyles
                                                    .robotoMedium
                                                    .copyWith(
                                                        fontSize: 14.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400))),
                                            const DataCell(Text('10')),
                                            const DataCell(Text('10')),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(
                                              Text('Finished Watches',
                                                  style: AppTextStyles
                                                      .robotoMedium
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            ),
                                            const DataCell(Text('1000')),
                                            const DataCell(Text('1000')),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(
                                              Text('Comments posted',
                                                  style: AppTextStyles
                                                      .robotoMedium
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            ),
                                            const DataCell(Text('100')),
                                            const DataCell(Text('100')),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(
                                              Text('Likes Gained',
                                                  style: AppTextStyles
                                                      .robotoMedium
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            ),
                                            const DataCell(Text('1000')),
                                            const DataCell(Text('10000')),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(
                                              Text('Total',
                                                  style: AppTextStyles
                                                      .robotoMedium
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            ),
                                            const DataCell(Text('2100')),
                                            const DataCell(Text('12210')),
                                          ]),
                                        ])),
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(right: 64),
                              child: SizedBox(
                                width: double.infinity,
                                height: 304.h,
                                child: DataTableTheme(
                                    data: DataTableThemeData(
                                        headingTextStyle:
                                            AppTextStyles.robotoMedium.copyWith(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF919699)),
                                        dataTextStyle:
                                            AppTextStyles.robotoMedium.copyWith(
                                                fontSize: 14.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400)),
                                    child: DataTable(
                                        onSelectAll: (value) {},
                                        dividerThickness: 2.h,
                                        border: const TableBorder(
                                            horizontalInside: BorderSide(
                                                width: 2,
                                                color: Color(0xFFE3E5E5))),
                                        columns: const [
                                          DataColumn(
                                              label: Text('Last Purchase')),
                                          DataColumn(label: Text('Value Two')),
                                          DataColumn(label: Text('Value One')),
                                        ],
                                        rows: [
                                          DataRow(cells: [
                                            DataCell(Text('Video Played',
                                                style: AppTextStyles
                                                    .robotoMedium
                                                    .copyWith(
                                                        fontSize: 14.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400))),
                                            const DataCell(Text('10')),
                                            const DataCell(Text('10')),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(
                                              Text('Finished Watches',
                                                  style: AppTextStyles
                                                      .robotoMedium
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            ),
                                            const DataCell(Text('1000')),
                                            const DataCell(Text('1000')),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(
                                              Text('Comments posted',
                                                  style: AppTextStyles
                                                      .robotoMedium
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            ),
                                            const DataCell(Text('100')),
                                            const DataCell(Text('100')),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(
                                              Text('Likes Gained',
                                                  style: AppTextStyles
                                                      .robotoMedium
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            ),
                                            const DataCell(Text('1000')),
                                            const DataCell(Text('10000')),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(
                                              Text('Total',
                                                  style: AppTextStyles
                                                      .robotoMedium
                                                      .copyWith(
                                                          fontSize: 14.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            ),
                                            const DataCell(Text('2100')),
                                            const DataCell(Text('12210')),
                                          ]),
                                        ])),
                              ),
                            )),
                          ],
                        ))
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomMenuTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final bool isSelected;
  final VoidCallback onTap;
  const _CustomMenuTile(
      {required this.subtitle,
      required this.title,
      required this.child,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: ListTile(
        horizontalTitleGap: .0,
        onTap: onTap,
        dense: true,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
        tileColor: isSelected ? const Color(0xFFe5efff) : Colors.transparent,
        minVerticalPadding: .0,
        leading: SizedBox(
          width: 56.h,
          child: Center(
            child: child,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.quickSandStyle.copyWith(
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.robotoMedium.copyWith(
              fontSize: 12.sp,
              color: Colors.black38,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final VoidCallback onPressed;
  const _ButtonWidget(
      {required this.text, required this.isEnabled, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(16).r,
          topRight: const Radius.circular(16).r),
      onTap: onPressed,
      child: CustomPaint(
        painter: isEnabled ? MyPainter() : null,
        child: Container(
          height: 56.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          alignment: Alignment.center,
          child: Text(
            text,
            style: AppTextStyles.robotoMedium.copyWith(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class _CustomStatistics extends StatelessWidget {
  final String name;
  final num number;
  final Color color;
  const _CustomStatistics(
      {required this.color, required this.name, required this.number});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .0,
      color: Colors.transparent,
      child: Container(
        height: 136.h,
        width: 212.w,
        padding: const EdgeInsets.all(16).r,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16).r,
            color: const Color(0xFFf7f9fa)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyles.quickSandStyle.copyWith(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              '$number',
              style: AppTextStyles.quickSandStyle.copyWith(
                  fontSize: 48.sp, color: color, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..color = Colors.grey;

    canvas.drawLine(Offset(0, size.height), Offset(0, size.height * .1), paint);
    canvas.drawArc(
        Rect.fromPoints(
            Offset(0, size.height * .2), Offset(size.width * .2, 0)),
        pi,
        pi / 2,
        false,
        paint);
    canvas.drawLine(
        Offset(size.width * .1, 0), Offset(size.width * .9, 0), paint);

    canvas.drawArc(
        Rect.fromPoints(
            Offset(size.width * .8, 0), Offset(size.width, size.height * .2)),
        3 / 2 * pi,
        pi / 2,
        false,
        paint);
    canvas.drawLine(Offset(size.width, size.height * .1),
        Offset(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    return false;
  }
}

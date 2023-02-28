import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_g4/model/chat_service_types.dart';
import 'package:flutter_g4/model/chat_user_model.dart';
import 'package:flutter_g4/utils/constants/constants.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter_slidable/flutter_slidable.dart';

class AllChatView extends StatefulWidget {
  const AllChatView({super.key});

  @override
  State<AllChatView> createState() => _AllChatViewState();
}

class _AllChatViewState extends State<AllChatView> {
  final globalKey = GlobalKey<ScaffoldState>();
  final List<ChatServiceModel?> _list = [
    const ChatServiceModel(isSelected: false, name: 'All'),
    const ChatServiceModel(isSelected: true, name: 'Important'),
    const ChatServiceModel(isSelected: false, name: 'Unread'),
    const ChatServiceModel(isSelected: false, name: 'Read'),
  ];

  final List<ChatUserModel?> _listChat = [
    ChatUserModel(
        count: 2,
        hasNewMessage: true,
        image: AppImages.telegramUser,
        isOnline: false,
        lastMessage: 'Why did you do that?',
        lastTime: DateTime.now(),
        username: 'Theresa Webb'),
    ChatUserModel(
        count: 1,
        hasNewMessage: true,
        image: AppImages.telegramUser1,
        isOnline: true,
        lastMessage: ' Hi, bro! Come to my house!',
        lastTime: DateTime.now(),
        username: 'Calvin Flores'),
    ChatUserModel(
        count: 0,
        hasNewMessage: false,
        image: AppImages.telegramUser2,
        isOnline: false,
        lastMessage: 'Me: Bro, just off',
        lastTime: DateTime.now(),
        username: 'Soham Henry'),
    ChatUserModel(
        count: 1,
        hasNewMessage: true,
        image: AppImages.telegramUser,
        isOnline: true,
        lastMessage: ' Hi, bro! Come to my house!',
        lastTime: DateTime.now(),
        username: 'Calvin Flores'),
    ChatUserModel(
        count: 0,
        hasNewMessage: false,
        image: AppImages.telegramUser2,
        isOnline: false,
        lastMessage: 'Me: Bro, just off',
        lastTime: DateTime.now(),
        username: 'Soham Henry'),
    ChatUserModel(
        count: 0,
        hasNewMessage: false,
        image: AppImages.telegramUser2,
        isOnline: false,
        lastMessage: 'Me: Bro, just off',
        lastTime: DateTime.now(),
        username: 'Soham Henry'),
    ChatUserModel(
        count: 1,
        hasNewMessage: true,
        image: AppImages.telegramUser,
        isOnline: true,
        lastMessage: ' Hi, bro! Come to my house!',
        lastTime: DateTime.now(),
        username: 'Calvin Flores'),
    ChatUserModel(
        count: 0,
        hasNewMessage: false,
        image: AppImages.telegramUser2,
        isOnline: false,
        lastMessage: 'Me: Bro, just off',
        lastTime: DateTime.now(),
        username: 'Soham Henry'),
    ChatUserModel(
        count: 0,
        hasNewMessage: false,
        image: AppImages.telegramUser2,
        isOnline: false,
        lastMessage: 'Me: Bro, just off',
        lastTime: DateTime.now(),
        username: 'Soham Henry'),
    ChatUserModel(
        count: 1,
        hasNewMessage: true,
        image: AppImages.telegramUser,
        isOnline: true,
        lastMessage: ' Hi, bro! Come to my house!',
        lastTime: DateTime.now(),
        username: 'Calvin Flores'),
    ChatUserModel(
        count: 0,
        hasNewMessage: false,
        image: AppImages.telegramUser2,
        isOnline: false,
        lastMessage: 'Me: Bro, just off',
        lastTime: DateTime.now(),
        username: 'Soham Henry'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: AppColors.chatBackColor,
      drawerScrimColor: Colors.transparent,
      endDrawer: Drawer(
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(35))),
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          globalKey.currentState!.closeEndDrawer();
                        },
                        icon: const RotatedBox(
                          quarterTurns: 2,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.chatColor,
                          ),
                        )),
                    const Icon(
                      Icons.settings,
                      color: AppColors.chatColor,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 39),
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                            alignment: Alignment.center,
                            child: Container(
                                height: 82,
                                width: 82,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: const DecorationImage(
                                      image: AssetImage(AppImages.telegramUser),
                                    ))))),
                    Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    'Gloria\nMckinney',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: AppTextStyles.gilroy.copyWith(
                                        color: AppColors.chatColor,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 49,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 39),
                dense: true,
                leading: const Icon(
                  Icons.person,
                  color: AppColors.chatColor,
                ),
                title: Text(
                  'Contacts',
                  style: AppTextStyles.gilroy.copyWith(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: AppColors.chatColor),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 39),
                dense: true,
                leading: const Icon(
                  Icons.phone,
                  color: AppColors.chatColor,
                ),
                title: Text(
                  'Calls',
                  style: AppTextStyles.gilroy.copyWith(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: AppColors.chatColor),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 39),
                dense: true,
                leading: const Icon(
                  Icons.bookmark,
                  color: AppColors.chatColor,
                ),
                title: Text(
                  'Save Messages',
                  style: AppTextStyles.gilroy.copyWith(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: AppColors.chatColor),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 39),
                dense: true,
                leading: const Icon(
                  Icons.person_add_alt,
                  color: AppColors.chatColor,
                ),
                title: Text(
                  'Invite Friends',
                  style: AppTextStyles.gilroy.copyWith(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: AppColors.chatColor),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 39),
                dense: true,
                leading: const Icon(
                  Icons.help,
                  color: AppColors.chatColor,
                ),
                title: Text(
                  'Telegram FAQ',
                  style: AppTextStyles.gilroy.copyWith(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: AppColors.chatColor),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        primary: true,
        child: Column(
          children: [
            //*-------------app bar
            Padding(
              padding: const EdgeInsets.only(left: 27, right: 27, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.chatColor,
                          Colors.red,
                        ]).createShader(bounds),
                    child: Text(
                      'Telegram',
                      style: AppTextStyles.gilroy.copyWith(
                          color: AppColors.chatColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppImages.add,
                        width: 22,
                        color: AppColors.chatColor,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Image.asset(
                        AppImages.search,
                        width: 22,
                        color: AppColors.chatColor,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                        onPressed: () {
                          if (!globalKey.currentState!.isEndDrawerOpen) {
                            globalKey.currentState!.openEndDrawer();
                          } else {
                            globalKey.currentState!.closeEndDrawer();
                          }
                        },
                        icon: Image.asset(
                          AppImages.chatMenu,
                          width: 22,
                          color: AppColors.chatColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 47,
            ),
            //*-------------check

            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.only(left: 20),
                  shrinkWrap: true,
                  itemCount: _list.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _ChatServiceWidget(chatServiceModel: _list[index]);
                  }),
            ),

            const SizedBox(
              height: 44,
            ),
            //*-------------check

            ListView.separated(
                primary: false,
                shrinkWrap: true,
                itemCount: _listChat.length,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemBuilder: (context, index) {
                  return Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: AppColors.chatColor,
                            foregroundColor: Colors.white,
                            icon: Icons.bookmark,
                          ),
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: AppColors.chatColor,
                            foregroundColor: Colors.white,
                            icon: Icons.check,
                          ),
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: AppColors.chatColor,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 27),
                        child: _ChatUserWidget(
                          chatUserModel: _listChat[index]!,
                        ),
                      ));
                })
          ],
        ),
      )),
    );
  }
}

class _ChatUserWidget extends StatelessWidget {
  final ChatUserModel chatUserModel;
  const _ChatUserWidget({required this.chatUserModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: .0,
      margin: EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: chatUserModel.isOnline
                  ? badge.Badge(
                      position:
                          badge.BadgePosition.bottomEnd(bottom: 3, end: 3),
                      badgeStyle: const badge.BadgeStyle(
                          badgeColor: AppColors.chatColor,
                          borderSide:
                              BorderSide(width: 5, color: Colors.white)),
                      badgeContent: const SizedBox.square(
                        dimension: 15,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Container(
                          height: 82,
                          width: 82,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                  image: AssetImage(AppImages.telegramUser))),
                        ),
                      ),
                    )
                  : Container(
                      alignment: Alignment.center,
                      child: Container(
                          height: 82,
                          width: 82,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(chatUserModel.image),
                              ))))),
          Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          chatUserModel.username,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppTextStyles.gilroy.copyWith(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.bell_fill,
                        color: AppColors.chatColor,
                      )
                    ],
                  ),
                  Text(
                    chatUserModel.lastMessage,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyles.gilroy.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.chatColor),
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '15:20',
                    style: AppTextStyles.gilroy.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                  if (chatUserModel.hasNewMessage)
                    badge.Badge(
                      position: badge.BadgePosition.center(),
                      badgeStyle: const badge.BadgeStyle(
                          badgeColor: AppColors.chatColor,
                          padding: EdgeInsets.all(10)),
                      badgeContent: Text(
                        chatUserModel.count.toString(),
                        style: AppTextStyles.gilroy.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    )
                ],
              ))
        ],
      ),
    );
  }
}

class _ChatServiceWidget extends StatelessWidget {
  final ChatServiceModel? chatServiceModel;
  const _ChatServiceWidget({required this.chatServiceModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        elevation: .0,
        margin: EdgeInsets.zero,
        color: chatServiceModel!.isSelected
            ? AppColors.chatColor
            : AppColors.chatBackColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              chatServiceModel!.name,
              style: AppTextStyles.gilroy.copyWith(
                  color: chatServiceModel!.isSelected
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

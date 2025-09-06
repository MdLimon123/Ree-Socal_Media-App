
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ree_social_media_app/helpers/route.dart';
import 'package:ree_social_media_app/utils/app_icons.dart';

class BottomMenu extends StatelessWidget {
  final int menuIndex;
  final int messageCount; // badge count

  const BottomMenu(this.menuIndex, {this.messageCount = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE5F2E4),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 5),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildMenuItemWithBadge(AppIcons.messageIcon, 0, menuIndex, () {
            Get.offAndToNamed(AppRoutes.messageScreen);
          }, badgeCount: messageCount), //
          _buildMenuItem(AppIcons.cameraIcon, 1, menuIndex, () {
            Get.offAndToNamed(AppRoutes.cameraScreen);
          }),
          _buildMenuItem(AppIcons.contactIcon, 2, menuIndex, () {
            Get.offAndToNamed(AppRoutes.contactScreen);
          }),
          _buildMenuItem(AppIcons.profileIcon, 3, menuIndex, () {
            Get.offAndToNamed(AppRoutes.profileScreen);
          }),
        ],
      ),
    );
  }


  Widget _buildMenuItemWithBadge(
      String iconPath, int index, int selectedIndex, VoidCallback onTap,
      {int badgeCount = 0}) {
    bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF9CC198) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
              color: isSelected ? Colors.white : Color(0xFF413E3E),
            ),
          ),
          if (badgeCount > 0)
            Positioned(
              right: -2,
              top: -2,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    badgeCount.toString(),
                    style: const TextStyle(
                      color: Color(0xFF799777),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }


  Widget _buildMenuItem(
      String iconPath, int index, int selectedIndex, VoidCallback onTap) {
    bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF9CC198) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(
          iconPath,
          height: 24,
          width: 24,
          color: isSelected ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}

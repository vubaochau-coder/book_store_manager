import 'package:book_store_manager/models/notification_model.dart';
import 'package:book_store_manager/screens/notification/views/notification_item.dart';
import 'package:book_store_manager/themes/colors.dart';
import 'package:book_store_manager/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Thông báo',
        color: Colors.orangeAccent[700]!,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 4),
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('Tất cả'),
                  labelStyle: TextStyle(color: Colors.blue[900]!),
                  selected: true,
                  selectedColor: Colors.blue[100],
                  checkmarkColor: Colors.blue,
                  side: BorderSide.none,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const Gap(4),
                ChoiceChip(
                  label: const Text('Chưa đọc'),
                  labelStyle: const TextStyle(color: Colors.black),
                  selected: false,
                  selectedColor: Colors.blue[100],
                  checkmarkColor: Colors.blue,
                  side: BorderSide.none,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mới',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.check, size: 16, color: Colors.blue),
                      Gap(2),
                      Text(
                        'Đánh dấu tất cả là đã đọc',
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.background,
                  height: 4,
                );
              },
              itemBuilder: (context, index) {
                return NotificationItem(
                  notiModel: NotificationModel(
                    id: 'id noti',
                    userId: 'idUser',
                    userName: 'Vu Bao Chau',
                    userAvatar:
                        'https://e0.pxfuel.com/wallpapers/480/654/desktop-wallpaper-gwen-league-of-legends.jpg',
                    content: 'Đã tạo một đơn hàng',
                    type: 'order',
                    code: 'order_0',
                    date: DateTime.now(),
                    isRead: index % 3 == 1,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

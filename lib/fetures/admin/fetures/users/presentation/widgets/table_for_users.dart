import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/constants/app_text_styles.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/core/widgets/text_app.dart';
import 'package:shopi/fetures/admin/fetures/users/data/models/get_all_users_response.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/widgets/delete_user_icon.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/widgets/table_cell_title_widget.dart';

class TableForUsers extends StatelessWidget {
  const TableForUsers({required this.userList, super.key});

  final List<UserModel> userList;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: ColorsDark.blueLight),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FixedColumnWidth(100.w),
        1: const FlexColumnWidth(),
        2: FixedColumnWidth(110.w),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: context.color.navBarbg!.withOpacity(.9),
          ),
          children: [
            //Name
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(icon: Icons.person, title: 'Name'),
            ),
            //Email
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.email_outlined,
                title: 'Email',
              ),
            ),
            //Delete
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.delete_forever,
                title: 'Delete',
              ),
            ),
          ],
        ),
        ...List.generate(
          userList.length,
          (index) => TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextApp(
                    text: userList[index].name,
                    style: AppTextStyles.text12w700.copyWith(
                      color: context.color.textColor,
                    ),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextApp(
                    text: userList[index].email,
                    style: AppTextStyles.text12w700.copyWith(
                      color: context.color.textColor,
                    ),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: DeleteUserIcon(userId: userList[index].id),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

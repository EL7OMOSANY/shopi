import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/widgets/custom_text_field.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/users_cubit/cubit/users_cubit.dart';

class SearchForUsers extends StatefulWidget {
  const SearchForUsers({super.key});

  @override
  State<SearchForUsers> createState() => _SearchForUsersState();
}

class _SearchForUsersState extends State<SearchForUsers> {
  bool _isExpanded = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        final cubit = context.read<UsersCubit>();

        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          height: _isExpanded ? 60.h : 30.h,
          width: _isExpanded ? MediaQuery.of(context).size.width : 310.w,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: [
              if (_isExpanded)
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6.r,
                  offset: const Offset(0, 3),
                ),
            ],
          ),
          child: _isExpanded
              ? CustomTextField(
                  controller: cubit.searchController,
                  focusNode: _focusNode, // ربط الفيلد بالفوكس نود
                  keyboardType: TextInputType.name,
                  hintText: 'Search for users',
                  textInputAction: TextInputAction.search,
                  onChanged: (searchName) {
                    cubit.searchUser(searchName ?? "");
                    return null;
                  },
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close, color: ColorsDark.blueLight),
                    onPressed: () {
                      cubit.searchController.clear();
                      setState(() {
                        _isExpanded = false;
                      });
                    },
                  ),
                )
              : SizedBox(
                  height: 30.h,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: ColorsDark.blueLight,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            _isExpanded = true;
                          });
                          // بعد ما يتفتح ندي فوكس للتيكست فيلد
                          Future.delayed(const Duration(milliseconds: 300), () {
                            _focusNode.requestFocus();
                          });
                        },
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

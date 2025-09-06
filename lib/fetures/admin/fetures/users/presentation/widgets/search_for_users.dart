import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/style/colors/dark_colors.dart';
import 'package:shopi/core/widgets/custom_text_field.dart';
import 'package:shopi/fetures/admin/fetures/users/presentation/users_cubit/cubit/users_cubit.dart';

class SearchForUsers extends StatefulWidget {
  const SearchForUsers({super.key});

  @override
  State<SearchForUsers> createState() => _SearchForUsersState();
}

class _SearchForUsersState extends State<SearchForUsers> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        final cubit = context.read<UsersCubit>();
        return CustomTextField(
          controller: cubit.searchController,
          keyboardType: TextInputType.name,
          hintText: 'Search for users',
          onChanged: (searchName) {
            cubit.searchUser(searchName!);
            return null;
          },
          textInputAction: TextInputAction.search,
          suffixIcon: IconButton(
            // ignore: deprecated_member_use
            color: context.color.textFormBorder!.withOpacity(.5),
            onPressed: () {
              cubit.searchController.clear();
              setState(() {});
            },
            icon: cubit.searchController.text.isEmpty
                ? const SizedBox.shrink()
                : const Icon(Icons.clear, color: ColorsDark.blueLight),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/enums/filter_button_enum.dart';
import 'package:shopi/core/widgets/custom_text_field.dart';
import 'package:shopi/fetures/customer/fetures/search/data/models/customer_search_request_body.dart';
import 'package:shopi/fetures/customer/fetures/search/presentation/cubit/customer_search_cubit.dart';
import 'package:shopi/fetures/customer/fetures/search/presentation/widgets/save_filter_button.dart';
import 'package:shopi/fetures/customer/fetures/search/presentation/widgets/search_for_data_icon.dart';
import 'package:shopi/fetures/customer/fetures/search/presentation/widgets/search_name_price_button.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  FilterButtonsEnum searchEnum = FilterButtonsEnum.non;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceMaxController = TextEditingController();
  final TextEditingController priceMinController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    priceMaxController.dispose();
    priceMinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Column(
        children: [
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFadeInRight(
                duration: 200,
                child: SearchNamePriceButton(
                  title: 'Search Name',
                  isSelected: searchEnum == FilterButtonsEnum.name,
                  onTap: nameSearchTap,
                ),
              ),
              CustomFadeInLeft(
                duration: 200,
                child: SearchNamePriceButton(
                  title: 'Search Price',
                  isSelected: searchEnum == FilterButtonsEnum.price,
                  onTap: priceSearchTap,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),

          // Search by Name
          if (searchEnum == FilterButtonsEnum.name) ...[
            CustomFadeInDown(
              duration: 200,
              child: CustomTextField(
                controller: nameController,
                hintText: 'Search For Product Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Search Name Cant be empty';
                  }
                  return null;
                },
                onChanged: (value) {
                  if (value!.isNotEmpty) {
                    context.read<CustomerSearchCubit>().searchProduct(
                      body: CustomerSearchRequestBody(
                        searchName: value.trim(),
                        priceMin: null,
                        priceMax: null,
                      ),
                    );
                  }
                  return null;
                },
              ),
            ),
          ]
          // Search by Price
          else if (searchEnum == FilterButtonsEnum.price) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFadeInDown(
                  duration: 200,
                  child: SizedBox(
                    width: 160.w,
                    child: CustomTextField(
                      controller: priceMinController,
                      keyboardType: TextInputType.number,
                      hintText: 'Price Min',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price Min Empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                CustomFadeInDown(
                  duration: 200,
                  child: SizedBox(
                    width: 160.w,
                    child: CustomTextField(
                      controller: priceMaxController,
                      keyboardType: TextInputType.number,
                      hintText: 'Price Max',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price Max Empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),

            SaveFilterButton(
              onTap: () {
                if (fromKey.currentState!.validate()) {
                  context.read<CustomerSearchCubit>().searchProduct(
                    body: CustomerSearchRequestBody(
                      searchName: null,
                      priceMin: double.parse(priceMinController.text.trim()),
                      priceMax: double.parse(priceMaxController.text.trim()),
                    ),
                  );
                  setState(() {
                    searchEnum = FilterButtonsEnum.saved;
                  });
                }
              },
            ),
          ],

          if (searchEnum == FilterButtonsEnum.non) ...[
            SizedBox(height: 100.h),
            const SearchFormDataIcon(),
          ],
        ],
      ),
    );
  }

  void nameSearchTap() {
    setState(() {
      searchEnum = searchEnum == FilterButtonsEnum.name
          ? FilterButtonsEnum.saved
          : FilterButtonsEnum.name;
    });
    nameController.clear();
  }

  void priceSearchTap() {
    setState(() {
      searchEnum = searchEnum == FilterButtonsEnum.price
          ? FilterButtonsEnum.saved
          : FilterButtonsEnum.price;
    });
    priceMinController.clear();
    priceMaxController.clear();
  }
}

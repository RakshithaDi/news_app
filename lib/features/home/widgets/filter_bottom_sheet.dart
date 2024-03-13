import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/common/utils/assets_paths.dart';
import 'package:news_app/features/home/widgets/custom_category_button.dart';
import 'package:news_app/features/home/widgets/custom_save_button.dart';

class FilterBottomSheet {
  static void show(BuildContext context,
      {required List<String> filters,
      required List<String> selectedFilters,
      required void Function() onFilterPressed,
      required void Function() onSaveButtonPressed}) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      useSafeArea: true,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (contextd) => StatefulBuilder(builder: (context, setState) {
        return IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      height: 4,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: Color(0xFFC5C5C5),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, right: 20, left: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Filter",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 32,
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    selectedFilters.clear();
                                  });
                                },
                                style: const ButtonStyle(
                                    visualDensity: VisualDensity.comfortable,
                                    padding: MaterialStatePropertyAll<
                                            EdgeInsetsGeometry>(
                                        EdgeInsets.only(left: 20, right: 20)),
                                    side: MaterialStatePropertyAll<BorderSide>(
                                        BorderSide(
                                            width: 1,
                                            color: Color(0xFF041E2F)))),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      REMOVE_BIN_IC,
                                      height: 12,
                                      width: 10,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Reset',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF041E2F),
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                "Sort By",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF041E2F),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              children: [
                                for (int i = 0; i < filters.length; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: CustomCategoryButton(
                                      buttonTitle: filters[i],
                                      isSelected:
                                          selectedFilters.contains(filters[i]),
                                      onPressed: () {
                                        setState(() {
                                          selectedFilters.clear();
                                          selectedFilters.add(filters[i]);
                                        });
                                      },
                                    ),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomSaveButton(
                        buttonTitle: "SAVE",
                        onPressed: () {
                          onSaveButtonPressed();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

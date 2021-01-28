import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:service_app/app/modules/Model/categoryModel.dart';
import 'package:service_app/app/widgets/category_card_all.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class CustomListTitle extends StatelessWidget {
  final String title;
  CustomListTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          InkWell(
            child: Text(
              'Todas',
              style: new TextStyle(color: Colors.blue),
            ),
            onTap: () async {
              await showBottomSheetDialogAllCategories(context);
            },
          )
        ],
      ),
    );
  }

  Future<void> showBottomSheetDialogAllCategories(BuildContext context) async {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final controller = SheetController();
    bool isDismissable = false;

    await showSlidingBottomSheet(
      context,
      // The parentBuilder can be used to wrap the sheet inside a parent.
      // This can be for example a Theme or an AnnotatedRegion.
      parentBuilder: (context, sheet) {
        return Theme(
          data: ThemeData.dark(),
          child: sheet,
        );
      },
      // The builder to build the dialog. Calling rebuilder on the dialogController
      // will call the builder, allowing react to state changes while the sheet is shown.
      builder: (context) {
        return SlidingSheetDialog(
          controller: controller,
          duration: const Duration(milliseconds: 500),
          snapSpec: const SnapSpec(
            snap: true,
            initialSnap: 0.7,
            snappings: [
              0.3,
              0.7,
            ],
          ),
          scrollSpec: const ScrollSpec(
            showScrollbar: true,
          ),
          color: Colors.white,
          maxWidth: 500,
          minHeight: 500,
          isDismissable: true,
          dismissOnBackdropTap: true,
          isBackdropInteractable: true,
          builder: (context, state) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(32),
              child: GridView.count(
                crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(categories.length, (index) {
                  return Center(
                    child: CategoryCardAll(category: categories[index]),
                  );
                }),
              ),
            );
          },
        );
      },
    );
  }

  Widget expandList() {
    return ListView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      itemBuilder: (buildContext, index) {
        var category = categories[index];
        return CategoryCardAll(category: category);
      },
    );
  }

  Widget grid() {
    GridView.count(
      crossAxisCount: 4,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(categories.length, (index) {
        return Center(
          child: CategoryCardAll(category: categories[index]),
        );
      }),
    );
  }
}

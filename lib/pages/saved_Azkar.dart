import 'package:finalproject/model/loadAzkar.dart';
import 'package:finalproject/pages/azkarDetailsPage.dart';
import 'package:finalproject/shared/cubit/azkarCubit.dart';
import 'package:finalproject/shared/cubit/azkarStates.dart';
import 'package:finalproject/widgets/constsnts.dart';
import 'package:finalproject/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedAzkar extends StatelessWidget {
  SavedAzkar({super.key, required this.cubit });

  final AzkarCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit(LoadAzkarData())..loadJsonData(),
      child: BlocConsumer<AzkarCubit,AzkarStates>(builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widthR(14, context),
                    vertical: heightR(17, context)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back_ios),),
                        Text(
                          'Saved Azkar',
                          style: TextStyle(fontSize: sizeR(24, context)),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cubit.savedData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>  AzkarDetailsPage(title: cubit.savedData[index].category,azkar: cubit.savedData[index]),));
                              },
                              child: AzkarWidget(cubit.savedData[index].category,index,cubit.savedData[index].isBookmarked, context,onBookmarkToggle: () {
                               cubit.toggleBookmark(index);
                              },));
                        },),
                    )

                  ],
                ),
              ),
            ));
      }, listener: (context, state) {},),
    );
  }
}

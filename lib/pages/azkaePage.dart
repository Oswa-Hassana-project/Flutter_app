import 'package:finalproject/model/azkarOpen.dart';
import 'package:finalproject/model/loadAzkar.dart';
import 'package:finalproject/shared/cubit/azkarCubit.dart';
import 'package:finalproject/shared/cubit/azkarStates.dart';
import 'package:finalproject/widgets/constsnts.dart';
import 'package:finalproject/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>
      AzkarCubit(LoadAzkarData())
        ..loadJsonData(),
      child: BlocConsumer<AzkarCubit, AzkarStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AzkarCubit cubit = AzkarCubit.get(context);
          if (state is AppInitalState ) {
            return Scaffold(body: Center(child: CircularProgressIndicator()),);
          } else if (state is LoadAzkarState) {
            final Azkar = state.GetAzkar;
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
                              'Azkar',
                              style: TextStyle(fontSize: sizeR(24, context)),
                            ),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.search)),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: Azkar.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AzkarOpen() ,));
                                    },
                                    child: AzkarWidget(Azkar[index].category,index, context));
                              },),
                        )

                      ],
                    ),
                  ),
                ));
          } else if (state is ErrorAppState) {
            return Text("Error: ${state.massage}");
          }
          return Text(" ");
        },
      ),
    );
  }
}

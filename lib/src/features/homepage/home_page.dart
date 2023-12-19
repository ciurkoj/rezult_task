import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rezult_test/src/extensions/build_context.dart';
import 'package:rezult_test/src/features/homepage/home_page_cubit.dart';
import 'package:rezult_test/src/features/widgets/custom_scaffold.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final HomePageCubit cubit = HomePageCubit();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: context.localizations.homePageAppBarTitle,
      action: cubit.fetchPhotos,
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<HomePageCubit, HomePageState>(
          bloc: cubit..fetchPhotos(),
          builder: (context, state) {
            return switch (state.status) {
              HomePageStatus.loading =>
                const Center(child: CircularProgressIndicator()),
              HomePageStatus.loaded => getLoadedBody(state),
              HomePageStatus.error => Container(),
              HomePageStatus.initial => Container(),
            };
          },
        ),
      ),
    );
  }

  Widget getLoadedBody(HomePageState state) {
    return GridView.builder(
      itemCount: state.photos?.length ?? 0,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: GestureDetector(
            onTap: () => onPhotoTapped(context, state.photos![index].urlPhoto!),
            child: Container(
              decoration: state.photos![index].thumnailPhoto != null
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          state.photos![index].thumnailPhoto!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }

  void onPhotoTapped(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (builder) {
        return Dialog(
          shape: const ContinuousRectangleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 300,
              child: CachedNetworkImage(
                imageUrl: url,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                    ),
                  ),
                ),
                placeholder: (context, url) => const Center(
                  child: SizedBox(
                    height: 32,
                    width: 32,
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:untitled05/core/extras/constants/app_constants.dart';
import 'package:untitled05/core/layers/domain/entities/movie-model/movie.dart';
import 'package:untitled05/core/layers/presentation/pages/movies-page/movies_page_view_model.dart';
import 'package:untitled05/core/layers/presentation/pages/movies-page/sub-views/most_popular_movies_section.dart';
import 'package:untitled05/core/layers/presentation/pages/movies-page/sub-views/now_playing_movies_section.dart';
import 'package:untitled05/core/layers/presentation/pages/movies-page/sub-views/top_rated_movies_section.dart';
import 'package:untitled05/core/layers/presentation/shared-view-components/generic_state_wrapper_on_view_model_widget.dart';

class MoviesPageView extends StatelessWidget {
  const MoviesPageView({Key? key,}) : super(key: key,);

  @override
  Widget build(BuildContext context,) {
    return ViewModelBuilder<MoviesPageViewModel>.reactive(
      key: key,
      fireOnViewModelReadyOnce: true,
      disposeViewModel: true,
      viewModelBuilder: () => MoviesPageViewModel(),
      onViewModelReady: (viewModel,) => viewModel.onModelReady(),
      onDispose: (viewModel,) => viewModel.onDispose(),
      builder: (_, viewModel, __,) => WillPopScope(
        onWillPop: () async {
          viewModel.onClose();
          return true;
        },
        child: Scaffold(
          appBar: null,
          body: GenericStateWrapperOnViewModel<MoviesPageViewModel>(
            payloadWidget: SingleChildScrollView(
              key: const Key('movie-scroll-view',),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NowPlayingMoviesSection(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Popular",
                        ),
                        InkWell(
                          onTap: () => {
                            ///TODO : NAVIGATION TO POPULAR SCREEN
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0,),
                            child: Row(
                              children: const [
                                Text('See More', style: TextStyle(color: Colors.black),),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const MostPopularMoviesWidget(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Top Rated",
                        ),
                        InkWell(
                          onTap: () => {
                            /// TODO : NAVIGATION TO Top Rated Movies Screen
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0,),
                            child: Row(
                              children: const [
                                Text('See More', style: TextStyle(color: Colors.black,),),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const TopRatedMoviesSection(),
                  const SizedBox(height: 50.0,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


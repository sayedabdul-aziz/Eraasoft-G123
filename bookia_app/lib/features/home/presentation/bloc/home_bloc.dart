import 'package:bookia_app/features/home/data/models/get_arrivals_books_response/product.dart';
import 'package:bookia_app/features/home/data/models/get_sliders_reponse/slider.dart';
import 'package:bookia_app/features/home/data/repo/home_repo.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_event.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<GetNewArrivalsBooksEvent>(getNewArrivals);
    on<GetSlidersEvent>(getSliders);
  }
  List<Product> newArrivalsBooks = [];
  List<Slider> sliders = [];
  Future<void> getNewArrivals(
      GetNewArrivalsBooksEvent event, Emitter<HomeState> emit) async {
    emit(NewArrivalsBooksLoadingState());

    try {
      await HomeRepo.getNewArrivalsBooks().then((value) {
        if (value != null) {
          newArrivalsBooks = value.data?.products ?? [];
          emit(NewArrivalsBooksLoadedState());
        } else {
          emit(HomeErrorState(
              message: 'Unexpected Error occur, please try again'));
        }
      });
    } on Exception {
      emit(HomeErrorState(message: 'Unexpected Error occur, please try again'));
    }
  }

  Future<void> getSliders(
      GetSlidersEvent event, Emitter<HomeState> emit) async {
    emit(GetSlidersLoadingState());

    try {
      await HomeRepo.getSliders().then((value) {
        if (value != null) {
          sliders = value.data?.sliders ?? [];
          emit(GetSlidersLoadedState());
        } else {
          emit(HomeErrorState(
              message: 'Unexpected Error occur, please try again'));
        }
      });
    } on Exception {
      emit(HomeErrorState(message: 'Unexpected Error occur, please try again'));
    }
  }
}

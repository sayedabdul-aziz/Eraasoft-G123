class HomeState {}

class HomeInitialState extends HomeState {}

// new arrivals
class GetSlidersLoadingState extends HomeState {}

class GetSlidersLoadedState extends HomeState {}

class NewArrivalsBooksLoadingState extends HomeState {}

class NewArrivalsBooksLoadedState extends HomeState {}

class HomeErrorState extends HomeState {
  String message;
  HomeErrorState({required this.message});
}

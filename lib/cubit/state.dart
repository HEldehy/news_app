abstract class NewsAppState {}
class NewsInitialState extends NewsAppState{}
class NewsBottomNavChangeState extends NewsAppState{}
class NewsGetBusinessLoadingState extends NewsAppState{}
class NewsGetBusinessSuccessState extends NewsAppState{}
class NewsGetBusinessErrorState extends NewsAppState{
  final String error;
  NewsGetBusinessErrorState(this.error);
}
class NewsGetSportsLoadingState extends NewsAppState{}
class NewsGetSportsSuccessState extends NewsAppState{}
class NewsGetSportsErrorState extends NewsAppState{
  final String error;
  NewsGetSportsErrorState(this.error);
}
class NewsGetScienceLoadingState extends NewsAppState{}
class NewsGetScienceSuccessState extends NewsAppState{}
class NewsGetScienceErrorState extends NewsAppState{
  final String error;
  NewsGetScienceErrorState(this.error);
}
class NewsGetSearchLoadingState extends NewsAppState{}
class NewsGetSearchSuccessState extends NewsAppState{}
class NewsGetSearchErrorState extends NewsAppState{
  final String error;
  NewsGetSearchErrorState(this.error);
}

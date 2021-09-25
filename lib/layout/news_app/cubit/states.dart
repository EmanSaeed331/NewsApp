abstract class NewsStates{}
class NewsIntialState extends NewsStates{}
class NewsBottomNavigationBar extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  final String error ;
  NewsGetBusinessErrorState(this.error);
}
class NewsLoadingBusinessState extends NewsStates{}
class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
  final String error ;
  NewsGetSportsErrorState(this.error);
}
class NewsLoadingSportsState extends NewsStates{}
class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
  final String error ;
  NewsGetScienceErrorState(this.error);
}
class NewsLoadingScienceState extends NewsStates{}
class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearcheErrorState extends NewsStates{
  final String error ;
  NewsGetSearcheErrorState(this.error);
}
class NewsLoadingSearcheState extends NewsStates{}
class AppChangeModeState extends NewsStates{}

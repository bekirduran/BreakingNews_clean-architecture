
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app_clean_architecture/src/core/bloc/bloc_with_state.dart';
import 'package:news_app_clean_architecture/src/domain/entities/article.dart';
import 'package:news_app_clean_architecture/src/presentation/blocs/remote_articles_bloc.dart';
import 'package:news_app_clean_architecture/src/presentation/widgets/article_widget.dart';

class BreakingNewsView extends HookWidget{


  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();


    useEffect( () {
      //init()scroll
      scrollController.addListener(() => _onScrollListener(context,scrollController));
      //dispose()scroll
      return scrollController.dispose;
    }, [scrollController]);

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(scrollController),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text("Daily Breaking News",style: TextStyle(color: Colors.black87),),
       actions: [
         Builder(builder: (context) => GestureDetector(
           onTap: ()=> _onShowSavedArticlesViewTapped(context),
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 14.0),
             child: Icon(Ionicons.bookmark,color: Colors.black87,),
           ),
         ),)
       ],
    );
 }

  Widget _buildBody(ScrollController scrollController) {
    return BlocBuilder<RemoteArticlesBloc,RemoteArticlesState>(builder: (context, state) {
      if(state is RemoteArticlesLoading){
        print("object0");
        return Center(child: CupertinoActivityIndicator());
      }
      if(state is RemoteArticlesError){
        print("object1");
        return Center(child: Icon(Ionicons.refresh));
      }
      if(state is RemoteArticlesDone){
        print("object2");
        return _buildArticle(scrollController,state.articles!, state.noMoreData!);
      }
      return Center(child: Text("Error"));
    },);
  }

  Widget _buildArticle(ScrollController scrollController, List<Article> articles, bool noMoreData) {

    return ListView(
      controller: scrollController,
      children: [
        ...List<Widget>.from(articles.map((e) => Builder(builder: (context) => ArticleWidget(
          article: e,
          onArticlePressed: (e)=>_onArticlePressed(context,e)
        ),))),
      if(noMoreData)...[
        Container()
      ]else...[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: CupertinoActivityIndicator(),
        )
      ]
      ],
    );
  }


  void _onScrollListener(BuildContext context, ScrollController scrollController) {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
 //   final remoteArticleBloc = context.read<RemoteArticlesBloc>();
 //   final state = remoteArticleBloc.blocProcessState;
      print("TEst"+context.read<RemoteArticlesBloc>().toString());
    if(currentScroll == maxScroll ){
      context.read<RemoteArticlesBloc>().add(GetArticles());
    }
  }


  void _onArticlePressed(BuildContext context, Article article) {
  print(" Navigator.pushNamed(context, '/ArticleDetailsView',arguments: article)")
   ;
  }


  void _onShowSavedArticlesViewTapped(BuildContext context) {
    print(" Navigator.pushNamed(context, '/SavedArticlesView')")
   ;
  }









}
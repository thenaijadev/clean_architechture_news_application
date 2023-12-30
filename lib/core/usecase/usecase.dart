import 'package:clean_news_application/core/utils/typedef.dart';

abstract class UseCase<Type, Params> {
  FutureEitherArticleOrException call({Params params});
}

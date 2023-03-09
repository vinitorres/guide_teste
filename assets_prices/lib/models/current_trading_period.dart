import 'package:assets_prices/models/post.dart';

class CurrentTradingPeriod {
  CurrentTradingPeriod({
    required this.pre,
    required this.regular,
    required this.post,
  });

  Post pre;
  Post regular;
  Post post;

  factory CurrentTradingPeriod.fromJson(Map<String, dynamic> json) =>
      CurrentTradingPeriod(
        pre: Post.fromJson(json["pre"]),
        regular: Post.fromJson(json["regular"]),
        post: Post.fromJson(json["post"]),
      );
}
import 'package:flutter/material.dart';
import 'package:harpy/components/widgets/tweet/tweet_tile_content.dart';
import 'package:harpy/models/tweet_model.dart';
import 'package:provider/provider.dart';

/// Builds the quoted [Tweet] inside the [TweetTile] if it exists.
class TweetQuote extends StatelessWidget {
  const TweetQuote(this.model);

  final TweetModel model;

  @override
  Widget build(BuildContext context) {
    if (!model.isQuote) {
      return Container();
    }

    final quoteTweetModel = TweetModel(
      originalTweet: model.quote,
      homeTimelineModel: model.homeTimelineModel,
      userTimelineModel: model.userTimelineModel,
    )
      ..quoted = true
      ..reduceText();

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ChangeNotifierProvider<TweetModel>(
        builder: (_) => quoteTweetModel,
        child: _QuoteContent(model),
      ),
    );
  }
}

class _QuoteContent extends StatelessWidget {
  const _QuoteContent(this.model);

  final TweetModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TweetNameColumn(model),
        TweetText(model),
      ],
    );
  }
}

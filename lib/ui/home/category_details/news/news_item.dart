
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/utils/app_colors.dart';

class NewsItem extends StatelessWidget {
  NewsItem({super.key, required this.news});
  News news;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width*0.03),
      padding: EdgeInsets.symmetric(horizontal: width*0.02, vertical: height*0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).indicatorColor,
          width: 1,
        )
      ),
      child: Column(
        children: [
          
          ClipRRect(
  borderRadius: BorderRadius.circular(8),
  child: (news.urlToImage != null && news.urlToImage!.isNotEmpty)
      ?CachedNetworkImage(
  imageUrl: news.urlToImage ?? '',
  placeholder: (context, url) => Center(
    child: CircularProgressIndicator(
      backgroundColor: AppColors.greyColor,
    ),
  ),
  errorWidget: (context, url, error) => Image.asset(
    'assets/images/Rectangle 2.png',
    fit: BoxFit.cover,
  ),
)
      : Container(
          height: height * 0.25, // أو أي ارتفاع مناسب
          color: Colors.grey.shade200,
          child: Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
        ),
),
   SizedBox(height: height*0.02,),
           Text(news.title??'',
           style: Theme.of(context).textTheme.labelLarge,
           ),
           SizedBox(height: height*0.02,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text('By : ${news.author?.substring(0,8)??''}',
                style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
               Expanded(
                 child: Text('By : ${news.publishedAt??''}',
                               style: Theme.of(context).textTheme.labelSmall,
                               ),
               )
            ],
           )
        ],
      ),
    );
  }
}

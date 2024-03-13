import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsThumbnailItem extends StatefulWidget {
  String imagePath;
  String content;
  String publishDate;
  String title;
  String publishedBy;
  NewsThumbnailItem({
    super.key,
    required this.publishDate,
    required this.content,
    required this.imagePath,
    required this.title,
    required this.publishedBy,
  });

  @override
  State<NewsThumbnailItem> createState() => _NewsThumbnailItemState();
}

class _NewsThumbnailItemState extends State<NewsThumbnailItem> {
  bool _showAll = false;

  bool _shouldShowSeeMore() {
    if (_showAll) {
      return false;
    }
    return widget.content.length > 120;
  }

  String _truncateFirstText() {
    if (_showAll) {
      return widget.content;
    }
    if (widget.content.length <= 120) {
      return widget.content;
    }
    return widget.content.substring(0, 120) + '...';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 128,
            width: double.maxFinite,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Image.network(
                width: double.maxFinite,
                fit: BoxFit.cover,
                cacheHeight: 300,
                cacheWidth: 300,
                widget.imagePath,
                errorBuilder: (context, error, stackTrace) => Container(
                    height: 128,
                    width: double.maxFinite,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(child: Icon(Icons.error))),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.publishDate,
            style: TextStyle(fontSize: 12, color: Color(0xFF2E0505)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 14,
                color: Color(0xFF121212),
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(height: 1.4),
              children: [
                TextSpan(
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w300),
                  text: _truncateFirstText(),
                ),
                TextSpan(
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0080FF),
                      fontWeight: FontWeight.w400),
                  text: _shouldShowSeeMore() ? "  Read More" : "",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        _showAll = !_showAll;
                      });
                    },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.publishedBy,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xFF121212),
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

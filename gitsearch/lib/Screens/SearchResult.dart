import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/search_item.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key, required this.items}) : super(key: key);

  final List<SearchResultItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return _SearchResultItem(item: items[index]);
      },
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  const _SearchResultItem({Key? key, required this.item}) : super(key: key);

  final SearchResultItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xEE424242),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0x83FFEB3B))),
              width: 150,
              margin: EdgeInsets.all(5),
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: NetworkImage(item.owner.avatarUrl),
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      child: Icon(color: Colors.black, Icons.bookmark),
                    ))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: GestureDetector(
                      onTap: () async {
                        // if (await canLaunchUrl()) {
                        //   await launchUrl(item.htmlUrl);
                        // }
                      },
                      child: Text(
                        item.fullName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            item.visible,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      (item.dec).toString(),
                      style: const TextStyle(
                          color: Color(0x8BFFFFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// leading: CircleAvatar(
//         child: Image.network(item.owner.avatarUrl),
//       ),
//       title: Text(item.fullName),
//       // onTap: () async {
//       //   if (await canLaunchUrl(item.htmlUrl)) {
//       //     await launchUrl(item.htmlUrl);
//       //   }
//       // },

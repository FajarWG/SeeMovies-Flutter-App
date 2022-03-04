import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/description.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({Key? key, required this.toprated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Top Rated Movies',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            )),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
              itemCount: toprated.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: toprated[index]['title'].toString(),
                                  description:
                                      toprated[index]['overview'].toString(),
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      toprated[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      toprated[index]['poster_path'],
                                  vote: toprated[index]['vote_average']
                                      .toString(),
                                  launchon: toprated[index]['release_date']
                                      .toString(),
                                  popularity: toprated[index]['popularity']
                                      .toString())));
                    },
                    child: SizedBox(
                      width: 140,
                      child: Column(children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          toprated[index]['poster_path']))),
                        ),
                        Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(toprated[index]['title'] ?? 'Loading',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ))),
                        Text('⭐' + toprated[index]['vote_average'].toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            )),
                      ]),
                    ));
              }),
        )
      ]),
    );
  }
}

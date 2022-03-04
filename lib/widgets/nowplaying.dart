import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/description.dart';

class NowPlaying extends StatelessWidget {
  final List nowplaying;

  const NowPlaying({Key? key, required this.nowplaying}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Now Playing',
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
              itemCount: nowplaying.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: nowplaying[index]['title'].toString(),
                                  description:
                                      nowplaying[index]['overview'].toString(),
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      nowplaying[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      nowplaying[index]['poster_path'],
                                  vote: nowplaying[index]['vote_average']
                                      .toString(),
                                  launchon: nowplaying[index]['release_date']
                                      .toString(),
                                  popularity: nowplaying[index]['popularity']
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
                                          nowplaying[index]['poster_path']))),
                        ),
                        Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(nowplaying[index]['title'] ?? 'Loading',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ))),
                        Text('⭐' + nowplaying[index]['vote_average'].toString(),
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

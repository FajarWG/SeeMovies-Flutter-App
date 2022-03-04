import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  final String name,
      description,
      bannerurl,
      posterurl,
      vote,
      launchon,
      popularity;

  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launchon,
      required this.popularity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF01061A),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text('SeeMovies',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              )),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: Text(name,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ))),
            Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text('❤️ : ' + popularity,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ))),
            Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text('📅 : ' + launchon,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ))),
            Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text('⭐ : ' + vote,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ))),
            Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(description,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ))),
          ],
        ));
  }
}

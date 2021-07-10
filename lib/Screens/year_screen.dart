import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_movie_app/Screens/popular_list.dart';
import 'package:the_movie_app/Services/getting_movies.dart';
import 'package:the_movie_app/components_and_constants/constants.dart';
import 'package:the_movie_app/components_and_constants/modified_text.dart';
import 'package:the_movie_app/components_and_constants/rounded_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class YearScreen extends StatefulWidget {
  @override
  _YearScreenState createState() => _YearScreenState();
}

int? year;

class _YearScreenState extends State<YearScreen> {
  final fieldText = TextEditingController();
  bool showSpinner = false;
  List? moviedatalist;
  List? genrelist;
  GetMovies getmovies = GetMovies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Center(
                child: ModifiedText(
              text: 'The Movie App',
              size: 50,
              colour: Colors.white,
            )),
          )),
      body: ModalProgressHUD(
        opacity: 0.2,
        inAsyncCall: showSpinner,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 70,
                width: 300,
                child: TextField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  maxLength: 4,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  textAlign: TextAlign.left,
                  controller: fieldText,
                  decoration: kTextFieldDecoration.copyWith(hintText: 'YYYY'),
                ),
              ),
              RoundedButton(
                  colour: Colors.lightBlueAccent,
                  buttontitle: 'Get Movies',
                  onPressed: () async {
                    setState(
                      () {
                        showSpinner = true;
                      },
                    );
                    moviedatalist =
                        await getmovies.gettingMovies(fieldText.text);
                    genrelist = await getmovies.gettingGenre();
                    year = int.parse(fieldText.text);

                    if (fieldText.text == '' || year! > 2021 || year! < 1915) {
                      setState(() {
                        showSpinner = false;
                      });
                      fieldText.clear();
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Something Went Wrong!'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const <Widget>[
                                  Text('No Movies.'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Okay'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      setState(() {
                        showSpinner = false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PopularList(
                              year: fieldText.text,
                              listofmovies: moviedatalist,
                              genrelist: genrelist),
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

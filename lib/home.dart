import 'package:cvdTracker/constante.dart';
import 'package:cvdTracker/widgets/compteur.dart';
import 'package:cvdTracker/widgets/header.dart';
import 'package:cvdTracker/models/Country.dart';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';


//Future<Country> fetchCountry({String cntry:'Morocco'}) async {
Future<Country> fetchCountry({String cntry:'Morocco'}) async {

  final response =
      await http.get('https://coronavirus-19-api.herokuapp.com/countries/$cntry');

  if (response.statusCode == 200) {
    return Country.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}


class Home extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  Future<Country> futureCountry;
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
    futureCountry = fetchCountry();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  String dropdownValue = 'Morocco';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/woman.svg",
              textTop: "#STAY HOME \n ",
              textBottom: " Covid-19 \n tracker",
              offset: offset,
            ),
            
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      value: dropdownValue,
                      items: [
                        'World',
                        'USA',
                        'Afghanistan',
                        'Albania',
                        'Algeria',
                        'Andorra',
                        'Angola',
                        'Argentina',
                        'Armenia',
                        'Australia',
                        'Austria',
                        'Azerbaijan',
                        'Baden',
                        'Bahrain',
                        'Bangladesh',
                        'Barbados',
                        'Belarus',
                        'Belgium',
                        'Belize',
                        'Bolivia',
                        'Botswana',
                        'Brazil',
                        'Brunei',
                        'Bulgaria',
                        'Burma',
                        'Burundi',
                        'Cambodia',
                        'Cameroon',
                        'Canada',
                        'Chad',
                        'Chile',
                        'China',
                        'Colombia',
                        'Comoros',
                        'Croatia',
                        'Cuba',
                        'Cyprus',
                        'Czechia',
                        'Czechoslovakia',
                        'Denmark',
                        'Djibouti',
                        'Dominica',
                        'Ecuador',
                        'Egypt',
                        'Eritrea',
                        'Estonia',
                        'Eswatini',
                        'Ethiopia',
                        'Fiji',
                        'Finland',
                        'France',
                        'Gabon',
                        'Georgia',
                        'Germany',
                        'Ghana',
                        'Greece',
                        'Grenada',
                        'Guatemala',
                        'Guinea',
                        'Guyana',
                        'Haiti',
                        'Hanover',
                        'Hawaii',
                        'Hesse',
                        'Honduras',
                        'Hungary',
                        'Iceland',
                        'India',
                        'Indonesia',
                        'Iran',
                        'Iraq',
                        'Ireland',
                        'Israel',
                        'Italy',
                        'Jamaica',
                        'Japan',
                        'Jordan',
                        'Kazakhstan',
                        'Kenya',
                        'Kiribati',
                        'Korea',
                        'Kosovo',
                        'Kuwait',
                        'Kyrgyzstan',
                        'Laos',
                        'Latvia',
                        'Lebanon',
                        'Lesotho',
                        'Liberia',
                        'Libya',
                        'Liechtenstein',
                        'Lithuania',
                        'Luxembourg',
                        'Madagascar',
                        'Malawi',
                        'Malaysia',
                        'Maldives',
                        'Mali',
                        'Malta',
                        'Mauritania',
                        'Mauritius',
                        'Mexico',
                        'Micronesia',
                        'Moldova',
                        'Monaco',
                        'Mongolia',
                        'Montenegro',
                        'Morocco',
                        'Mozambique',
                        'Namibia',
                        'Nassau',
                        'Nauru',
                        'Nepal',
                        'Nicaragua',
                        'Niger',
                        'Nigeria',
                        'Norway',
                        'Oldenburg',
                        'Oman',
                        'Pakistan',
                        'Palau',
                        'Panama',
                        'Paraguay',
                        'Peru',
                        'Philippines',
                        'Poland',
                        'Portugal',
                        'Qatar',
                        'Romania',
                        'Russia',
                        'Rwanda',
                        'Samoa',
                        'Saudi Arabia',
                        'Senegal',
                        'Serbia',
                        'Seychelles',
                        'Singapore',
                        'Slovakia',
                        'Slovenia',
                        'Somalia',
                        'South Africa',
                        'Spain',
                        'Sudan',
                        'Suriname',
                        'Sweden',
                        'Switzerland',
                        'Syria',
                        'Tajikistan',
                        'Tanzania',
                        'Texas',
                        'Thailand',
                        'Timor-Leste',
                        'Togo',
                        'Tonga',
                        'Tunisia',
                        'Turkey',
                        'Turkmenistan',
                        'Tuvalu',
                        'Uganda',
                        'Ukraine',
                        'Uruguay',
                        'Uzbekistan',
                        'Vanuatu',
                        'Venezuela',
                        'Vietnam',
                        'Yemen',
                        'Zambia',
                        'Zimbabwe'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child:new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                          futureCountry = fetchCountry(cntry: newValue);

                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child :AdmobBanner(
                       adUnitId: getBannerAdUnitId(),
                       adSize: AdmobBannerSize.BANNER  ,
                     ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: shadowColor,
                        ),
                      ],
                    ),
                       
                    child: FutureBuilder<Country>(
                          future: futureCountry,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:<Widget>[
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "Global Status",
                                            style: kTitleTextstyle,
                                          ),
                                          Text(
                                            "${snapshot.data.country}",
                                            style: TextStyle(
                                              color: primaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      
                                       SizedBox(height: 20),

                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                           Compteur(
                                              color: infectedColor,
                                              number: snapshot.data.cases,
                                              title: "Infected",
                                            ),
                                            Compteur(
                                              color: deathColor,
                                              number: snapshot.data.deaths,
                                              title: "Deaths",
                                            ),
                                            Compteur(
                                              color: recovercolor,
                                              number: snapshot.data.recovered,
                                              title: "Recovered",
                                            ),
                                        ],
                                      ),
                                      
                                      SizedBox(height: 20),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "Other",
                                            style: kTitleTextstyle,
                                          ),
                                        ],
                                      ),
                                      
                                      SizedBox(height: 20),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Compteur(
                                            color: infectedColor,
                                            number: snapshot.data.active,
                                            title: "active",
                                          ),
                                          
                                          Compteur(
                                            color: infected2Color,
                                            number: snapshot.data.todayCases,
                                            title: "today Cases",
                                          ),
                                          Compteur(
                                            color: deathColor,
                                            number: snapshot.data.todayDeaths,
                                            title: "today Deaths",
                                          ),
                                        ],
                                      ),
                                       SizedBox(height: 20),

                                        Container(
                                          child :AdmobBanner(
                                                  adUnitId: getBannerAdUnitId(),
                                                  adSize: AdmobBannerSize.FULL_BANNER  ,
                                          ),
                                        ),
                                        
                                    ],
                                  );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }

                            // By default, show a loading spinner.
                            return CircularProgressIndicator();
                          },
                        
                      ),
                   
                  ),
                ],
              ),
            ),
           
        ],
        ),
      ),
    );
  }
}



String getBannerAdUnitId() {
  if (Platform.isIOS) {
   // return 'ca-app-pub-3940256099942544/2934735716';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3374897745386892/7254479072';
  }
  return null;
}

String getInterstitialAdUnitId() {
  if (Platform.isIOS) {
   // return 'ca-app-pub-3940256099942544/4411468910';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3374897745386892/4628315737';
  }
  return null;
}
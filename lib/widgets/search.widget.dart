import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paises/services/countryes.services.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool loading = true;
  List countryes = [
    {
      "name": {
        "common": "",
        "official": "",
        "nativeName": {
          "eng": {"official": "", "common": ""}
        }
      },
      "tld": [""],
      "cca2": "",
      "ccn3": "",
      "cca3": "",
      "independent": false,
      "status": "",
      "unMember": false,
      "currencies": {
        "AUD": {
          "name": "",
          "symbol": "",
        }
      },
      "idd": {
        "root": "",
        "suffixes": [""]
      },
      "capital": [""],
      "altSpellings": ["", ""],
      "region": "",
      "subregion": "",
      "languages": {"": ""},
      "translations": {
        "ara": {"": "", "": ""},
        "ces": {"": "", "": ""},
        "cym": {"official": "", "common": ""},
        "deu": {"official": "", "common": ""},
        "est": {"official": "", "": ""},
        "fin": {"official": "", "": ""},
        "fra": {"official": "", "common": ""},
        "hrv": {"official": "", "common": ""},
        "hun": {"": "", "": ""},
        "ita": {"official": "", "common": ""},
        "jpn": {"official": "", "": ""},
        "kor": {"official": "", "": ""},
        "nld": {"official": "", "common": ""},
        "per": {"": "", "": ""},
        "pol": {"": "", "": ""},
        "por": {"official": "", "common": ""},
        "rus": {"official": "", "common": ""},
        "slk": {"": "", "": ""},
        "spa": {"official": "", "common": ""},
        "swe": {"": "", "": ""},
        "urd": {"": "", "": ""},
        "zho": {"": "", "": ""}
      },
      "latlng": [],
      "landlocked": false,
      "area": 0,
      "demonyms": {
        "eng": {"f": "", "m": ""}
      },
      "flag": "",
      "maps": {"googleMaps": "", "openStreetMaps": ""},
      "population": 0,
      "car": {
        "signs": [""],
        "side": ""
      },
      "timezones": [""],
      "continents": [""],
      "flags": {"png": "", "svg": ""},
      "coatOfArms": {},
      "startOfWeek": "",
      "capitalInfo": {
        "latlng": [0, 0]
      }
    },
  ];
  @override
  Widget build(BuildContext context) {
    final String tipoSearch =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'Sin';

    if (countryes[0]['status'] == '') {
      searchAll();
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Buscar por $tipoSearch",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onSubmitted: (value) {
              if (value.isEmpty) {
                searchAll();
              }

              switch (tipoSearch) {
                case 'pais':
                  loading = true;
                  countryes = countryes;
                  RestClientServer.getCountries(value).then((value) {
                    setState(() {
                      countryes = (value);
                      loading = false;
                    });
                  });
                  break;
                case 'region':
                  loading = true;
                  RestClientServer.getCountriesByRegion(value).then((value) {
                    setState(() {
                      countryes = (value);
                      loading = false;
                    });
                  });
                  break;
                case 'capital':
                  loading = true;
                  RestClientServer.getCountriesByCapital(value).then((value) {
                    setState(() {
                      countryes = (value);
                      loading = false;
                    });
                  });
                  break;
              }
            },
          ),
        ),
        if (loading) Center(child: CircularProgressIndicator()),
        if (countryes[0]["status"] == "error" && loading == false)
          Card(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 105, right: 105, top: 25.0, bottom: 25.0),
              child: Text(
                countryes[0]["message"],
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        if (countryes[0]["status"] != "error" && loading == false)
          if (countryes[0]["name"]["common"] != "")
            Container(
              height: MediaQuery.of(context).size.height * 0.78,
              margin: EdgeInsets.only(left: 20, right: 50, top: 14),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: countryes.length,
                itemBuilder: (context, index) => ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage(
                        image: NetworkImage(countryes[index]["flags"]["png"]),
                        placeholder: AssetImage("assets/loading.gif"),
                        width: 50,
                        height: 50,
                      )),
                  title: Text(countryes[index]["name"]["common"]),
                  subtitle: Text(countryes[index]["capital"]
                          .toString()
                          .replaceAll("[", "")
                          .replaceAll("]", "") +
                      " - " +
                      countryes[index]["subregion"]
                          .toString()
                          .replaceAll("[", "")
                          .replaceAll("]", "")),
                  trailing: Text(countryes[index]["population"].toString()),
                  onTap: () {
                    Navigator.pushNamed(context, "/details",
                        arguments: countryes[index]["cca3"]);
                  },
                ),
              ),
            ),
      ],
    );
  }

  void searchAll() {
    RestClientServer.getCountriesAll().then((value) {
      setState(() {
        countryes = value;
        loading = false;
      });
    });
  }
}

class TableWidget {
  final List country;

  TableWidget({Key? key, country}) : country = country;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("algo"),
    );
  }
}

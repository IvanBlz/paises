import 'package:flutter/material.dart';
import 'package:paises/services/countryes.services.dart';

class DetailsScreen extends StatefulWidget {
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
      "altSpellings": ["", "", ""],
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
      "flags": {},
      "coatOfArms": {},
      "startOfWeek": "",
      "capitalInfo": {
        "latlng": [0, 0]
      }
    },
  ];

  @override
  Widget build(BuildContext context) {
    final String termino =
        ModalRoute.of(context)?.settings.arguments.toString() ??
            'Sin argumentos';

    if (countryes[0]["name"]["common"] == "") {
      RestClientServer.getCountriesByAlpha(termino).then((value) {
        if (value[0]["coatOfArms"].length > 0) {
          print(value[0]["coatOfArms"]);
        }
        setState(() {
          countryes = value;
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Pais"),
        elevation: 0,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              countryes[0]["name"]["common"] + " " + countryes[0]["capital"][0],
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        if (countryes[0]["flags"].length > 0)
          FadeInImage(
            image: NetworkImage(countryes[0]['flags']['png']),
            placeholder: AssetImage('assets/loading.gif'),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        if (countryes[0]["name"]["common"] != "")
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Población",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Continente",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Escudo de Armas",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        Container(
          child: Row(
            children: [
              if (countryes[0]["name"]["common"] != "")
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      countryes[0]["population"].toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              if (countryes[0]["name"]["common"] != "")
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      countryes[0]["region"],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              if (countryes[0]["coatOfArms"].length > 0)
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: FadeInImage(
                        image: NetworkImage(countryes[0]['coatOfArms']['png']),
                        placeholder: AssetImage('assets/loading.gif'),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )),
                ),
              if (countryes[0]["coatOfArms"].length == 0)
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: FadeInImage(
                        image: AssetImage('assets/no-image.jpg'),
                        placeholder: AssetImage('assets/loading.gif'),
                      )),
                ),
            ],
          ),
        ),
        if (countryes[0]["name"]["common"] != "")
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Area",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Lada",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Hora",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (countryes[0]["name"]["common"] != "")
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      countryes[0]["area"].toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      countryes[0]["idd"]["root"] +
                          countryes[0]["idd"]["suffixes"][0],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      countryes[0]["timezones"][0],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              for (var i = 0; i < countryes[0]["altSpellings"].length; i++)
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      countryes[0]["altSpellings"][i],
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
            ],
          ),
        )
      ]),
    );
  }
}

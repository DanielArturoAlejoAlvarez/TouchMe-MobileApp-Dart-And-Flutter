# TouchMe-MobileApp-Dart-And-Flutter


## Description

Software of Application using Dart, Flutter and Kotlin.

![alt text](https://images.prismic.io/impactio-blog/2575689d-8dfe-4d7c-b6a7-f33b170231b8_What+Does+a+Dart+and+Flutter+Developer+Do.png?auto=compress,format)


## Installation

Using Dart 2.13.1, Flutter 2.2.1, etc preferably.

## API

The Rick and Morty API https://rickandmortyapi.com/api. ![alt text](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu3eBZthL1duCCkcg-0IPyz6fcK876yjy6JGYRjyOjxu6OaPG2&usqp=CAU) 


## Usage

```html
$ git clone https://github.com/DanielArturoAlejoAlvarez/TouchMe-MobileApp-Dart-And-Flutter.git [NAME APP] $

```

Follow the following steps and you're good to go! Important:

![alt text](https://miro.medium.com/max/1575/1*5Qp-g4_wE4qYW56bTSVK-Q.gif)

## Frontend

### App

```dart
...
void main(List<String> args) {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List usersData = [];
  String uri = 'https://rickandmortyapi.com/api/character?page=1';

  getUsersRickAndMortyAPI() async {
    Map data;

    http.Response res = await http.get(Uri.parse(uri));
    //debugPrint(res.body);

    data = json.decode(res.body);

    setState(() {
      usersData = data['results'];
    });
  }

  @override
  void initState() {
    super.initState();
    getUsersRickAndMortyAPI();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "At first glance, Rick and Morty looks like just another animated situational family comedy, like Family Guy or The Simpsons. Theoretically, that's true. When sociopathic scientist and estranged grandfather Rick returns to his daughter Beth’s life, he brings with him all sorts of family drama. Watching Beth's family of four navigate life with their self-centered, cynical, and narcissistic grandfather is, indeed, often very funny. In a sea of sad quotes on the internet, Rick and Morty quotes are the hilariously sardonic lines you need to buoy your dark heart.",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: usersData.length,
              itemBuilder: (BuildContext context, int index) {
                return Wrap(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "${usersData[index]["id"]}",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(usersData[index]["image"]),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "${usersData[index]["name"]} ${usersData[index]["species"]}",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black45),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
...
```



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DanielArturoAlejoAlvarez/TouchMe-MobileApp-Dart-And-Flutter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

```

```

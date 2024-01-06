import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(MyApp());
}

class Project {
  final String title;
  final String description;

  Project({required this.title, required this.description});
}

final List<Project> projects = [
  Project(
    title: 'AI Resume Parser',
    description: 'Web application where users can upload their resume and paste a job description to see how well their resume fits the keywords found in the job description',
  ),
  Project(
    title: 'SpotBot: Fake Yelp Review Analyzer',
    description: 'Tool that utilizes machine learning to attempt to classify Yelp reviews as either fraudulent or valid',
  ),
  Project(
    title: 'Elite Matchmaker: F1 Driver Sponsorship Tool',
    description: 'Ranked and scored F1 drivers based on factors in alignment with company’s interests',
  ),
  Project(
    title: 'Data for Good Hackathon: Star House Expansion Plan',
    description: 'Recommended locations based on predicted need for nonprofit Star House’s services',
  ),
  Project(
    title: 'WiDS Datathon: Diabetes Prediction',
    description: 'Utilized machine learning to predict if patients have diabetes',
  ),
  Project(
    title: 'Predictive Modeling for Stroke Diagnosis',
    description: 'Determined risk factors for stroke prediction',
  ),
  // Add more projects
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Megan Sin',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(55, 152, 255, 0.612)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = ProjectsPage();
        break;
      case 2:
        page = Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 1000,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home',
                      style: GoogleFonts.firaMono(
                        fontSize: 16, // Set the desired font size
                        fontWeight: FontWeight.w500, // You can set fontWeight if needed
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.folder),
                      label: Text('Projects',
                      style: GoogleFonts.firaMono(
                        fontSize: 16, // Set the desired font size
                        fontWeight: FontWeight.w500, // You can set fontWeight if needed
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.contact_page),
                      label: Text('Contact Me',
                      style: GoogleFonts.firaMono(
                        fontSize: 16, // Set the desired font size
                        fontWeight: FontWeight.w500, // You can set fontWeight if needed
                        ),
                      ),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}


class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Megan Sin',
          style: GoogleFonts.firaMono(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          AnimatedTextKit(
            repeatForever: false,
            isRepeatingAnimation: false,
            animatedTexts: [
              TyperAnimatedText(
                "Hey! Nice to meet you.",
                textStyle: GoogleFonts.firaMono(fontSize: 32, fontWeight: FontWeight.w600),
                speed: const Duration(milliseconds: 200),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipOval(
                child: Image.asset('megan_sin_headshot.png',
                width: 250,
                height: 250,
                fit: BoxFit.cover),
              ),
              SizedBox(width: 50),
              Column(
                children: [
                  
                  Container(
                    width: 600,
                    padding: EdgeInsets.all(8),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        style: GoogleFonts.firaMono(fontSize: 16, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'My name is Megan Sin and I am a senior at Worcester Polytechnic Institute (WPI) studying data science. I was previously a Summer Analyst intern in the AI & Data Science Analyst Program at ',
                          ),
                          TextSpan(
                            text: 'JPMorgan Chase',
                            style: TextStyle(color: const Color.fromARGB(255, 0, 98, 179),
                            fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ' and a Community Relations intern at ',
                          ),
                          TextSpan(
                            text: 'The Hanover Insurance Group',
                            style: TextStyle(color: Color.fromARGB(255, 2, 101, 0),
                            fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '.',
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    width: 600,
                    padding: EdgeInsets.all(8),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        style: GoogleFonts.firaMono(fontSize: 16, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'I built my skills as a data scientist through various course projects, personal projects, and challenges at datathons. I love data analysis and being able to help people make data-driven decisions to make the world a better place.')
                        ]
                      )
                    )
                  ),

                  Container(
                    width: 600,
                    padding: EdgeInsets.all(8),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        style: GoogleFonts.firaMono(fontSize: 16, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'In my free time I love to play volleyball, explore new places, bake, and collect ',
                          ),
                          TextSpan(
                            text: 'Sonny Angels',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SecretLinkPage()),
                                );
                              },
                          ),
                          TextSpan(
                            text: '.',
                          ),
                        ],
                      )
                    )
                  ),

                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  ProjectDetailsPage({required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
      ),
      body: Center(
        child: Text(project.description),
      ),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Theme(
      data: ThemeData.from(
        colorScheme: colorScheme,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Projects',
          style: GoogleFonts.firaMono(color: Colors.black, fontWeight: FontWeight.bold),),
        ),
        body: GridView.extent(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          maxCrossAxisExtent: 400,
          crossAxisSpacing: 80,
          mainAxisSpacing: 100,
          children: List.generate(
            projects.length,
            (index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectDetailsPage(project: projects[index]),
                  ),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(projects[index].title, 
                      textAlign: TextAlign.center,
                      style: GoogleFonts.firaMono(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                      SizedBox(height: 30),
                      Text(projects[index].description, 
                      textAlign: TextAlign.center,
                      style: GoogleFonts.firaMono(fontSize: 14, color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class SecretLinkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secret Page'),
      ),
      body: Center(
        child: Image.asset('frog_sonny_angel.png'),
      ),
    );
  }
}
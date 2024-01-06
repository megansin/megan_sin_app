import 'dart:html';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:pdfx/pdfx.dart';


void main() {
  runApp(MyApp());
}

class Project {
  final String title;
  final String description;
  final String longdescription;
  final String skills;
  final List<String> assetImagePaths;
  final Uri? url;

  Project({required this.title, required this.description, required this.longdescription, required this.skills, required this.assetImagePaths, this.url});
}

final List<Project> projects = [
  Project(
    title: 'Poetry Pal',
    description: 'Poetry recommendation tool',
    longdescription: 'Poetry Pal is a comprehensive and user-friendly poetry recommendation tool that aims to show users new pieces of poetry they might enjoy. Poetry Pal builds each user a unique personalized profile based on poetry users have previously reviewed, which it then uses to make poetry recommendations.',
    skills: 'Python, Recommendation System, (Item-Item and Neural) Collaborative Filtering, NeuMF',
    assetImagePaths: ['assets/poetry_pal/rating 1.png', 'assets/poetry_pal/rating 2.png', 'assets/poetry_pal/rating 3.png'],
    url: Uri.parse('https://megansin.github.io/poetry_pal/')
  ),
  Project(
    title: 'AI Resume Parser',
    description: 'Web application where users can upload their resume and paste a job description to see how well their resume fits the keywords found in the job description',
    longdescription: 'I worked on a team with two other group members and we developed web application to screen candidate resumes and automatically identify missing keywords. We extracted key information using named entity recognition and other NLP techniques in a Python backend.',
    skills: 'Python, Flask, NLP, Artificial Intelligence',
    assetImagePaths: ['assets/ai_resume_parser/home.png'],
    url: Uri.parse('https://github.com/megansin/CS4341_Resume_Parser')
  ),
  Project(
    title: 'SpotBot: Fake Yelp Review Analyzer',
    description: 'Tool that utilizes machine learning to attempt to classify Yelp reviews as either fraudulent or valid',
    longdescription: 'I worked on a team with three other teammates and we implemented an automated fake review detection tool with 87% model accuracy using Python and BERT NLP. We uncovered class imbalances and investigated data distributions via exploratory data analysis (EDA). We also prepared the review data for BERT classifier via PyTorch input pipeline with tokenization.',
    skills: 'Python, BERT, NLP, PyTorch',
    assetImagePaths: ['assets/spotbot/process_flowchart.png', 'assets/spotbot/results.png'],
    url: Uri.parse('https://seamussullivan.github.io/CS539-SpotBot-Website/')
  ),
  Project(
    title: 'Elite Matchmaker: F1 Driver Sponsorship Tool',
    description: 'Ranked and scored F1 drivers based on factors in alignment with company’s interests',
    longdescription: 'Worked on a team to present to potential clients a service built using Python (pandas, tweepy, NumPy) to advise companies interested in sponsoring Formula 1 drivers. We ranked and scored 20 F1 drivers based on factors in alignment with company’s interests–calculated frequency analysis using Twitter data scraped to MongoDB Atlas database.',
    skills: 'Python, Frequency Analysis, MongoDB, Web Scraping, Twitter API',
    assetImagePaths: ['assets/f1/example.png', 'assets/f1/example2.png'],
    url: Uri.parse('https://github.com/megansin/data-science-courses/tree/main/DS3010/case-study-4')
  ),
  Project(
    title: 'Visitor Management Strategies: Ho‘omaluhia Botanical Garden',
    description: 'Research and created long and short term visitor management strategy suggestions',
    longdescription: 'Over 14 weeks, I worked on a team of four students in reviewing visitor management (VM) plans from similar outdoor recreational sites, collected and analyzed Hoʻomaluhia visitor data to identify visitor trends, and gathered feedback from stakeholders to help develop controlled access management and VM strategies. Our final recommendations aimed to manage increased visitation to the garden and its impact on the local community.',
    skills: 'Research, Data Visualization, Consultation, Communication, Presentation, Professional Writing',
    assetImagePaths: ['assets/iqp/figure3.png', 'assets/iqp/barchart.png', 'assets/iqp/short_term_suggestion.png'],
    url: Uri.parse('https://digital.wpi.edu/concern/student_works/v979v636c?locale=en')
  ),
  Project(
    title: 'Data for Good Hackathon: Star House Expansion Plan',
    description: 'Recommended locations based on predicted need for nonprofit Star House’s services',
    longdescription: 'Over 24 hours, I worked on a team of seven people and crafted a custom composite score to determine locations’ need for nonprofit Star House’s services using significant variables, determined using 12 linear regression models (sklearn). We utilized seven sources of data over a 4-year period containing relevant attributes to clean and parse. Finally, we delivered recommendations our model generated to two panels of judges through a presentation',
    skills: 'Python, Linear Regression, Research',
    assetImagePaths: ['assets/data4good/exec_summary.png', 'assets/data4good/approach.png', 'assets/data4good/recommendations.png']
  ),
  Project(
    title: 'WiDS Datathon: Diabetes Prediction',
    description: 'Utilized machine learning to predict if patients have diabetes',
    longdescription: 'Worked with teammates to use machine learning to predict if patients have diabetes using Multi-layer Perceptron classifier model (scikit-learn)–final model was 83.16% accurate',
    skills: 'Python, Feature Analysis, Multi-Layer Perceptron Classifier, Google CoLab',
    assetImagePaths: [],
    url: Uri.parse('https://github.com/megansin/wids_datathon_2021')
  ),
  Project(
    title: 'Predictive Modeling for Stroke Diagnosis',
    description: 'Determined risk factors for stroke prediction',
    longdescription: 'I worked on a team to investigate statistical relationships using correlation matrix in R and determine risk factors for stroke prediction. We reduced bias and improved accuracy by employing SMOTE to address the 5% stroke rate imbalance in the dataset.',
    skills: 'R, Data Analysis, Logistic Regression, KNN, SMOTE, Presentation',
    assetImagePaths: ['assets/stroke/corr_matrix.png', 'assets/stroke/approach1.png', 'assets/stroke/approach2.png', 'assets/stroke/results.png']
  ),
  // Project(
  //   title: 'Closet Inventory Web Application',
  //   description: 'Web application to allow users to inventory and organize their closets virtually',
  //   longdescription:  'Developed a web application to allow users to inventory and organize garments, and also designed a SQL database accessed by the application to store user and clothing data.',
  //   skills: 'Python, SQL, Flask, Javascript',
  //   assetImagePaths: ['', '']
  // ),
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
        page = ResumePage();
        break;
      case 3:
        page = ContactMePage();
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
                        fontSize: 16, 
                        fontWeight: FontWeight.w500, 
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.folder),
                      label: Text('Projects',
                      style: GoogleFonts.firaMono(
                        fontSize: 16, 
                        fontWeight: FontWeight.w500, 
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.description),
                      label: Text('Resume',
                      style: GoogleFonts.firaMono(
                        fontSize: 16, 
                        fontWeight: FontWeight.w500, 
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.contact_page),
                      label: Text('Contact Me',
                      style: GoogleFonts.firaMono(
                        fontSize: 16, 
                        fontWeight: FontWeight.w500, 
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
          SelectableText('Megan Sin',
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
                child: Image.asset('assets/megan_sin_headshot.png',
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
                    child: SelectionArea(
                      child: SelectableText.rich(
                      TextSpan(
                        style: GoogleFonts.firaCode(fontSize: 16, color: Colors.black),
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
                    )
                    
                  ),

                  Container(
                    width: 600,
                    padding: EdgeInsets.all(8),
                    child: SelectableText.rich(
                      TextSpan(
                        style: GoogleFonts.firaCode(fontSize: 16, color: Colors.black),
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
                    child: SelectableText.rich(
                      TextSpan(
                        style: GoogleFonts.firaCode(fontSize: 16, color: Colors.black),
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

class URLText extends StatelessWidget {
  final String text;
  final Uri url;

  URLText({required this.text, required this.url});

  Future<void> _launchURL() async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Text(
        text,
        style: GoogleFonts.firaMono(color: Colors.blue,  decoration: TextDecoration.underline) 
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
        title: SelectableText(
          project.title,
          textAlign: TextAlign.center,
          style: GoogleFonts.firaMono(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 600,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              if (project.url != null)
                URLText( 
                  text: 'Visit project website',
                  url: project.url!,
                ),
                SizedBox(height: 10),
              ImageSlideshow(
                width: double.infinity,
                height: 400,
                initialPage: 0,
                indicatorColor: Colors.blue,
                indicatorBackgroundColor: Colors.grey,
                autoPlayInterval: 0,
                isLoop: true,
                children: [
                  for (var imagePath in project.assetImagePaths)
                  Image.asset(
                    imagePath,
                    fit: BoxFit.scaleDown,
                  ),
                ]
              ),
              SizedBox(height: 30),
              SelectableText(
                project.longdescription,
                textAlign: TextAlign.center,
                style: GoogleFonts.firaMono(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: SelectableText.rich(
                  TextSpan(
                          style: GoogleFonts.firaMono(fontSize: 16, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Skills: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: project.skills,
                            ),
                          ]
                        ),
                    textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
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
          title: SelectableText('Projects',
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

class ResumePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pdfController = PdfController(document: PdfDocument.openAsset('assets/megan_sin_resume.pdf'),);
    Widget pdfView() => PdfView(controller: pdfController,);

    return Center(
      child: Scaffold(
        appBar: AppBar(
            title: SelectableText('Resume',
            style: GoogleFonts.firaMono(color: Colors.black, fontWeight: FontWeight.bold),),
          ),
          // body: PdfView(controller: PdfController(document: PdfDocument.openAsset('assets/megan_sin_resume.pdf')),),
        body: Center(
          child: Image.asset('megan_sin_resume.png'),
          )
        
        // SingleChildScrollView(
        //   child: Image.asset(
        //             'assets/megan_sin_resume.png',
        //             fit: BoxFit.contain, 
        //           ),
        // ),
      ),
    );
  }
}

class LaunchUrlButton extends StatelessWidget {
  final Uri url;
  final String buttontext;
  final Icon icon;

  LaunchUrlButton({required this.url, required this.buttontext, required this.icon});

  Future<void> _launchURL() async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

 @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchURL,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), 
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon, 
          SizedBox(width: 10),
          SelectableText(buttontext, 
          style: GoogleFonts.firaCode(fontSize: 18, fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}

class ContactMePage extends StatelessWidget {
  Future<void> _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SelectableText(
          'Contact Me',
          style: GoogleFonts.firaMono(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SelectableText('Get in touch',
            style: GoogleFonts.playfairDisplay(fontSize: 50, fontWeight: FontWeight.w700),),
            // SizedBox(height: 30),
            SelectableText('Please feel free to email me or send me a message on LinkedIn. I look forward to hearing from you!',
            style: GoogleFonts.firaMono(fontSize: 18, fontWeight: FontWeight.w500),),
            // SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Expanded(child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: LaunchUrlButton(
                    buttontext: 'Email',
                    url: Uri.parse('mailto:mpsin@wpi.edu?subject=Website Contact Me Page'),
                    icon: Icon(Icons.email), 
                  ),
                )
              ),
              Expanded(child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: LaunchUrlButton(
                    buttontext: 'LinkedIn',
                    url: Uri.parse('https://www.linkedin.com/in/megan-sin/'),
                    icon: Icon(FontAwesomeIcons.linkedin), 
                  ),
                )
              ),
              Expanded(child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: LaunchUrlButton(
                    buttontext: 'GitHub',
                    url: Uri.parse('https://github.com/megansin'), 
                    icon: Icon(FontAwesomeIcons.github)
                  )
                )
              ),
              ],
            ),
          ],
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
        title: SelectableText('Secret Page :)',
        style: GoogleFonts.firaMono(),),
      ),
      body: Center(
        child: Image.asset('assets/frog_sonny_angel.png'),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maphidol/screen/Cafe.dart';
import 'package:maphidol/widget/square_widget.dart';
import 'package:maphidol/widget/MapScreen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:maphidol/screen/Canteen.dart';
import 'package:maphidol/screen/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final auth = FirebaseAuth.instance;
  final PageController _pageController = PageController(viewportFraction: 0.55);
  int _currentPageIndex = 0;
  late ValueNotifier<int> _currentPageIndexNotifier;
  String userID = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    super.initState();
    userID = FirebaseAuth.instance.currentUser!.uid;

    _currentPageIndexNotifier = ValueNotifier<int>(_currentPageIndex);

    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = _pageController.page?.round() ?? 0;
        _currentPageIndexNotifier.value = _currentPageIndex;
      });
    });
  }

  String profileName = '';
  @override
  Future<void> dispose() async {
    _pageController.dispose();
    _currentPageIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maphidol',
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF243763),
                    Color(0xFF562982),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 10,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                    const Text(
                      'Maphidol Application',
                      style: TextStyle(
                        fontFamily: 'InstrumentSerif',
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 65,
              left: 30,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://www.rainforest-alliance.org/wp-content/uploads/2021/06/capybara-square-1-400x400.jpg.webp',
                  ),
                ),
              ),
            ),
            Positioned(
              top: 70,
              left: 10,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      auth.currentUser!.email!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 67,
              right: 30,
              child: IconButton(
                iconSize: 30,
                icon: const Icon(
                  Icons.login,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ),
            // Small Square Carousel
            Positioned(
              top: 150,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recommended',
                    style: TextStyle(
                      color: Color(0xFFD3D3D3),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Positioned(
              top: 190,
              left: -100,
              right: 0,
              child: SizedBox(
                height: 180,
                child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int pageIndex) {
                    setState(() {
                      _currentPageIndex = pageIndex;
                      _currentPageIndexNotifier.value = _currentPageIndex;
                    });
                  },
                  children: [
                    buildSquareContainer(
                      'Starbucks, Mahidol Sitthakarn',
                      'https://img.wongnai.com/p/1920x0/2022/02/07/654c2fbc86a94c4692ba5e736e59d10f.jpg',
                      _currentPageIndex == 0,
                    ),
                    buildSquareContainer(
                      'Fresh me, Mahidol Sitthakarn',
                      'https://img.wongnai.com/p/1920x0/2020/03/10/2ec1c5ffd6254a6da73dd359b998f289.jpg',
                      _currentPageIndex == 1,
                    ),
                    buildSquareContainer(
                      'Tha Rot, College of Music',
                      'https://img.wongnai.com/p/400x0/2017/09/07/b7aa276f6240414cabd5170d5358e1f2.jpg',
                      _currentPageIndex == 2,
                    ),
                    buildSquareContainer(
                      "Bellinee's, Mahidol Learning Center",
                      'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/C.Bellinees-@-MU-Art-Gallery.jpg',
                      _currentPageIndex == 3,
                    ),
                    buildSquareContainer(
                      'Cake Tam Tawan, Student Dormitory',
                      'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/C.%E0%B8%95%E0%B8%B2%E0%B8%A1%E0%B8%95%E0%B8%B0%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%84%E0%B8%B2%E0%B9%80%E0%B8%9F%E0%B9%88.jpg',
                      _currentPageIndex == 4,
                    ),
                  ],
                ),
              ),
            ),

            // Map Preview
            Positioned(
              top: 400,
              left: 30,
              right: 30,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ValueListenableBuilder<int>(
                  valueListenable: _currentPageIndexNotifier,
                  builder: (BuildContext context, int value, Widget? child) {
                    return GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _getMarkerLatLng(value),
                        zoom: 15.0,
                      ),
                      markers: Set<Marker>.of([
                        Marker(
                          markerId: MarkerId('myMarker'),
                          position: _getMarkerLatLng(value),
                        ),
                      ]),
                      onMapCreated: (GoogleMapController controller) {
                        // Add your code here if needed
                      },
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 78.0, // Adjust the vertical position as needed
              left: 30.0,
              right: 30.0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 400.0, // Adjust the width as needed
                  height: 170.0, // Adjust the height as needed
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(132, 94, 221, 0.2),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 20.0),
                    child: ValueListenableBuilder<int>(
                      valueListenable: _currentPageIndexNotifier,
                      builder:
                          (BuildContext context, int value, Widget? child) {
                        String additionalInfo = '';

                        // Set the additional information based on the page index
                        switch (value) {
                          case 0:
                            additionalInfo =
                                'A coffee shop franchise originated in Seattle. Known for its signature roasts, snacks and Wi-Fi. \n\nAvailable everyday at 7:00 -19:00';
                            break;
                          case 1:
                            additionalInfo =
                                'A suitable cafe for sutdent provide delicious flavour, choose sweetness as you like. \n\nAvailable everyday at 10:00-18:00';
                            break;
                          case 2:
                            additionalInfo =
                                'The secret restuarant, very famouse for the music campus, fast serving and best experience \n\n';
                            break;
                          case 3:
                            additionalInfo =
                                'The cafe inside the Mahidol Learning Center, appropriate for studying \n\nAvailable everyday at 7:00-21:00';
                            break;
                          case 4:
                            additionalInfo =
                                'A famouse cafe with a lot of cake that you must try \n\nAvailable everyday at 9:30 - 20:00';
                            break;
                          default:
                            additionalInfo = 'Additional information';
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Information:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              additionalInfo,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFFD3D3D3),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),

            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 16.0),
              child: FractionallySizedBox(
                widthFactor: 0.9, // Adjust the width factor as needed
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF243763), Color(0xFF562982)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CanteenPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            minimumSize: Size(double.infinity, 48.0),
                          ),
                          child: Text(
                            'Canteen',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF243763), Color(0xFF562982)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CafePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            minimumSize: Size(double.infinity, 48.0),
                          ),
                          child: Text(
                            'Cafe',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LatLng _getMarkerLatLng(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return LatLng(13.790721916922067,
            100.32222521170648); // Marker position for page0
      case 1:
        return LatLng(13.790447250864132,
            100.32216224964785); // Marker position for page 1
      case 2:
        return LatLng(13.78897737843187,
            100.32481491586893); // Marker position for page 2
      case 3:
        return LatLng(13.792072962347906,
            100.32028008697498); // Marker position for page 3
      case 4:
        return LatLng(13.793144892370563,
            100.3206481000684); // Marker position for page 4
      default:
        return LatLng(
            13.793228247926843, 100.32059445588742); // Default marker position
    }
  }
}

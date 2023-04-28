import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maphidol/widget/square_widget_forC.dart';

class CafePage extends StatefulWidget {
  @override
  _CanteenPageState createState() => _CanteenPageState();
}

class _CanteenPageState extends State<CafePage> {
  final PageController _pageController = PageController(viewportFraction: 0.55);
  int _currentPageIndex = 0;
  late ValueNotifier<int> _currentPageIndexNotifier;

  @override
  void initState() {
    super.initState();
    _currentPageIndexNotifier = ValueNotifier<int>(_currentPageIndex);

    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = _pageController.page?.round() ?? 0;
        _currentPageIndexNotifier.value = _currentPageIndex;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cafe Page'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          flexibleSpace: Container(
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
        ),
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
              top: 0,
              left: -180,
              right: -200,
              child: SizedBox(
                height: 400,
                child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (int pageIndex) {
                    setState(() {
                      _currentPageIndex = pageIndex;
                      _currentPageIndexNotifier.value = _currentPageIndex;
                    });
                  },
                  children: [
                    buildSquareContainer(
                        context,
                        'Canteen 1',
                        'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/E.%E0%B8%81%E0%B8%B2%E0%B9%81%E0%B8%9F%E0%B8%82%E0%B8%A1%E0%B8%99%E0%B8%A1%E0%B8%AB%E0%B8%A7%E0%B8%B2%E0%B8%99.jpg',
                        _currentPageIndex == 0),
                    buildSquareContainer(
                      context,
                      'Canteen 2',
                      'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/C.TRUE-LAB-@-Mahidol.jpg',
                      _currentPageIndex == 1,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 3',
                      'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/E.%E0%B8%8B%E0%B8%B8%E0%B9%89%E0%B8%A1%E0%B8%8A%E0%B8%B2%E0%B8%99%E0%B8%A1.jpg',
                      _currentPageIndex == 2,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 4',
                      'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/C.Amezon.jpg',
                      _currentPageIndex == 3,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 5',
                      'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/C.TheMoveCoffee.jpg',
                      _currentPageIndex == 4,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 6',
                      'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/E.KOKOMILK-toast-coffee.jpg',
                      _currentPageIndex == 5,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 7',
                      'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/E.%E0%B8%95%E0%B9%89%E0%B8%99%E0%B8%9B%E0%B8%B2%E0%B8%A5%E0%B9%8C%E0%B8%A1.jpg',
                      _currentPageIndex == 6,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 8',
                      'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/D.A-MON-SWEETS.jpg',
                      _currentPageIndex == 7,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 9',
                      'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/D.%E0%B8%81%E0%B8%B2%E0%B9%81%E0%B8%9F%E0%B8%AA%E0%B8%94%E0%B9%81%E0%B8%99%E0%B8%99.jpg',
                      _currentPageIndex == 8,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 10',
                      'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/D.22-Twenty-Two-coffee.jpg',
                      _currentPageIndex == 9,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 11',
                      'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/C.%E0%B8%AD%E0%B8%B4%E0%B8%99%E0%B8%97%E0%B8%99%E0%B8%B4%E0%B8%A5.jpg',
                      _currentPageIndex == 10,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 12',
                      'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/D.%E0%B8%81%E0%B8%B2%E0%B9%81%E0%B8%9F%E0%B8%9E%E0%B8%B5%E0%B9%88%E0%B8%81%E0%B8%B8%E0%B9%8A%E0%B8%81.jpg',
                      _currentPageIndex == 10,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 13',
                      'https://mustudent.mahidol.ac.th/wp-content/uploads/2023/01/C.Coffee-chalet.jpg',
                      _currentPageIndex == 10,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0, // Adjust the vertical position as needed
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 420.0, // Adjust the width as needed
                  height: 450.0, // Adjust the height as needed
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(132, 94, 221, 1),
                        Color.fromRGBO(12, 5, 77, 0.712),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
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
                                'Kafae Khom Nom Wan\n\nCoffee shop and dessert next to the animal hospital, Faculty of Veterinary Medicine';
                            break;
                          case 1:
                            additionalInfo =
                                'TRUE LAB @ Mahidol\n\nCoffee shops, beverages, bakeries with Co-working space available, Mahidol Learning Center';
                            break;
                          case 2:
                            additionalInfo =
                                'Sum Cha Nom\n\nWater and coffee shops next to animal hospital Faculty of Veterinary Science';
                            break;
                          case 3:
                            additionalInfo =
                                'Amazon\n\nCoffee shop, bakery on the 1st floor, next to the parking lot of the environmental building';
                            break;
                          case 4:
                            additionalInfo =
                                'The move coffee\n\nDoi Chaang coffee is in front of the sports technology building (swimming pool).';
                            break;
                          case 5:
                            additionalInfo =
                                'KOKOMILK toast & coffee\n\nLocate at the College of Religious Studies opposite animal hospital';
                            break;
                          case 6:
                            additionalInfo =
                                'Ton Pam\n\nWater and coffee shop next to the car park building. at the National Institute for Child and Family Development';
                            break;
                          case 7:
                            additionalInfo =
                                'A MON SWEETS\n\nBeverage shop food bakery at the library';
                            break;
                          case 8:
                            additionalInfo =
                                'Kafae Sot Naen\n\nCoffee shop behind the Faculty of Physical Therapy building';
                            break;
                          case 9:
                            additionalInfo =
                                '22 Twenty Two coffee\n\nCoffee shop, Khanom Tai, Faculty of Physical Therapy';
                            break;
                          case 10:
                            additionalInfo =
                                'Inthanin coffee\n\nGraduate School Building';
                            break;
                          case 11:
                            additionalInfo =
                                'Kafae Phi Kuk\n\nCoffee shop, dessert under LA building';
                            break;
                          case 12:
                            additionalInfo =
                                'Coffee chale\n\nCoffee shop, bakery, in front of the Institute of Nutrition, building 5-6';
                            break;
                          case 13:
                            additionalInfo =
                                'Tempo cafe\n\nCoffee Shop Bhumibol Sangkhit Building B ';
                            break;
                          case 14:
                            additionalInfo =
                                'Coffee & More\n\nBeverage and bakery shop ASEAN Institute for Health Development';
                            break;
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Information:',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
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
            Positioned(
              bottom: 30,
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
          ],
        ),
      ),
    );
  }

  LatLng _getMarkerLatLng(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return LatLng(13.798517418397802, 100.31798077242433);
      case 1:
        return LatLng(13.794521273907725, 100.32139824247726);
      case 2:
        return LatLng(13.798628104810486, 100.31785336074881);
      case 3:
        return LatLng(13.795042323440168, 100.32159998295154);
      case 4:
        return LatLng(13.796488842328674, 100.32116636441806);
      case 5:
        return LatLng(13.798633307200523, 100.31872018599057);
      case 6:
        return LatLng(13.799955330887817, 100.3223898380655);
      case 7:
        return LatLng(13.7979025920754, 100.32224236078623);
      case 8:
        return LatLng(13.79737369124874, 100.3217947368237);
      case 9:
        return LatLng(13.793549252754069, 100.32240685524489);
      case 10:
        return LatLng(13.793549252754069, 100.32240752579716);
      case 11:
        return LatLng(13.797476927224244, 100.32106111786575);
      case 12:
        return LatLng(13.796498541938073, 100.32195677976287);
        break;
      default:
        return LatLng(0, 0); // Default marker position
    }
  }
}

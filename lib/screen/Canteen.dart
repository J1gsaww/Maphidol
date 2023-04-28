import 'package:flutter/material.dart';
import 'package:maphidol/widget/square_widget_forC.dart';
import 'package:maphidol/widget/MapScreen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';

class CanteenPage extends StatefulWidget {
  @override
  _CanteenPageState createState() => _CanteenPageState();
}

class _CanteenPageState extends State<CanteenPage> {
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
      title: 'Canteen',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Canteen Page'),
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
                        'https://f.ptcdn.info/029/028/000/1422805863-043-o.jpg',
                        _currentPageIndex == 0),
                    buildSquareContainer(
                      context,
                      'Canteen 2',
                      'https://pbs.twimg.com/media/EQKNxzfU4AElKAI.jpg',
                      _currentPageIndex == 1,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 3',
                      'https://nuttpo.files.wordpress.com/2012/06/wpid-social-science-new-cafeteria-20120613.jpg',
                      _currentPageIndex == 2,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 4',
                      'https://10619-2.s.cdn12.com/rests/original/403_120482138.jpg',
                      _currentPageIndex == 3,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 5',
                      'https://f.ptcdn.info/029/028/000/1422805689-145-o.jpg',
                      _currentPageIndex == 4,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 6',
                      'https://fastly.4sqi.net/img/general/600x600/698845_0aUV6bG0CBWmQkMUvh83hva2tf4tVeAOkz1Co2IcNhs.jpg',
                      _currentPageIndex == 5,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 7',
                      'https://ns.mahidol.ac.th/nurse_th/organization/IT/img/bg/backdrop_4.jpg',
                      _currentPageIndex == 6,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 8',
                      'https://theflame.unishanoi.org/wp-content/uploads/2015/04/1069386_643330222358995_345076624_n.jpg',
                      _currentPageIndex == 7,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 9',
                      'https://fastly.4sqi.net/img/general/600x600/6522125_z1AdXKtLzGZwY0GkmLRiHqn322qHI_ghgiLVfRUjSLE.jpg',
                      _currentPageIndex == 8,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 10',
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Environment_of_MSMU.jpg/600px-Environment_of_MSMU.jpg',
                      _currentPageIndex == 9,
                    ),
                    buildSquareContainer(
                      context,
                      'Canteen 11',
                      'https://lh3.googleusercontent.com/_1n9amdLm7RNRTw8X0tc0ZHu-IZXqVAzn43TlnSAGuvscvjJJe-mGJXP8VtXFyf47dqCRaDAlGhGozGM6KNM3Xexug',
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
                                'MLC Food Court\n\n999 Phutthamonthon Sai 4 Road, Salaya Subdistrict, Phutthamonthon District, Nakhon Pathom 73170';
                            break;
                          case 1:
                            additionalInfo =
                                'Canteen - Faculty of Engineering\n\n25 25 Phutthamonthon Sai 4 Road, Salaya Subdistrict, Phutthamonthon District, Nakhon Pathom 73170';
                            break;
                          case 2:
                            additionalInfo =
                                'SH Canteen \n\nFaculty of Social Sciences and Humanities Mahidol University, Salaya Subdistrict, Phutthamonthon District, Nakhon Pathom 73170';
                            break;
                          case 3:
                            additionalInfo =
                                'Canteen - Faculty of Veterinary Science\n\nNo. 999 National Highway No. 3310 Tambon Salaya, Amphoe Phutthamonthon, Nakhon Pathom 73170';
                            break;
                          case 4:
                            additionalInfo =
                                'Canteen - Faculty of Liberal Arts\n\n999 4th Rd Monthon, Phutthamonthon District, Nakhon Pathom 73170';
                            break;
                          case 5:
                            additionalInfo =
                                'Canteen - Faculty of Medical Technology\n\n999 Phutthamonthon Sai 4 Road, Tambon Salaya, Amphoe Phutthamonthon, Nakhon Pathom 73170';
                            break;
                          case 6:
                            additionalInfo =
                                'Canteen - Faculty of Nursing\n\n999 Phutthamonthon Sai 4 Road, Tambon Salaya, Amphoe Phutthamonthon, Nakhon Pathom 73170';
                            break;
                          case 7:
                            additionalInfo =
                                'MUIC Atrium Canteen\n\nMahidol University International College Salaya, Tambon Salaya 73170';
                            break;
                          case 8:
                            additionalInfo =
                                'Canteen - Aditayathorn Building\n\nMahidol University International College Salaya, Tambon Salaya 73170';
                            break;
                          case 9:
                            additionalInfo =
                                'Canteen - College of Music\n\n25 25 Phutthamonthon Sai 4 Road, Salaya Subdistrict, Phutthamonthon District, Nakhon Pathom 73170';
                            break;
                          case 10:
                            additionalInfo =
                                'Canteen - Center of Research and Development for Biomedical Instrumentation\n\n25 25 Phutthamonthon Sai 4 Road, Salaya Subdistrict, Phutthamonthon District, Nakhon Pathom 73170';
                            break;
                          default:
                            additionalInfo = 'Additional information';
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
                                const SizedBox(width: 4),
                                const Text(
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
        return LatLng(13.794110655352476, 100.32132565774064);
      case 1:
        return LatLng(13.796272834519305, 100.3250446171981);
      case 2:
        return LatLng(13.793033359930043, 100.32492064418095);
      case 3:
        return LatLng(13.79826724025723, 100.31721283284217);
      case 4:
        return LatLng(13.797027330813457, 100.32110740035155);
      case 5:
        return LatLng(13.798771401574756, 100.3231116576724);
      case 6:
        return LatLng(13.788975723999535, 100.32610363818348);
      case 7:
        return LatLng(13.792895743255329, 100.32599511349142);
      case 8:
        return LatLng(13.790738090819758, 100.32602733469552);
      case 9:
        return LatLng(13.789076927015273, 100.32397354077355);
      case 10:
        return LatLng(13.797597217648608, 100.32594518094854);
      default:
        return LatLng(
            13.793228247926843, 100.32059445588742); // Default marker position
    }
  }
}

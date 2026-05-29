import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(debugShowCheckedModeBanner: false, home: FirstRoute()),
);

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Welcome to',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text('PRAKTIKUM PAB 2026', style: TextStyle(fontSize: 24)),
                SizedBox(height: 16),
                Text(
                  '1462300157',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/295/295128.png',
              width: 180,
            ),
            Column(
              children: [
                const Text(
                  'Farid Ihsan Falihuddin',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                _btn(
                  'Login',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MainScreen()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const TravelHomeScreen(),
    const BookingScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F5E5),
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E232C),
        selectedItemColor: const Color(0xFF4EBE5F),
        unselectedItemColor: Colors.grey.shade400,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class TravelHomeScreen extends StatelessWidget {
  const TravelHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final r = [
      [
        'Suite Room',
        'https://picsum.photos/id/29/400/300',
        'Suite, 1 Bedroom (duplex) Valley View',
      ],
      [
        'Villa Room',
        'https://picsum.photos/id/11/400/300',
        'Villa, Open Nature View',
      ],
      [
        'Villa 2 Room',
        'https://picsum.photos/id/16/400/300',
        '2-Bedroom Villa with Private Pool',
      ],
      [
        'Villa 3 Room',
        'https://picsum.photos/id/17/400/300',
        'Spacious & Cozy 3-Bedroom Villa',
      ],
    ];

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            'TravelGo',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://picsum.photos/id/28/800/400',
              height: 130,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.0,
            ),
            itemCount: 4,
            itemBuilder: (_, i) => _card(context, r[i][0], r[i][1], r[i][2]),
          ),
        ),
      ],
    );
  }

  Widget _card(BuildContext c, String n, String img, String desc) =>
      GestureDetector(
        onTap: () => Navigator.push(
          c,
          MaterialPageRoute(builder: (_) => RoomDetailRoute(n, img, desc)),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD6F0E6),
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    img,
                    height: 70,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                n,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const Text(
                '\$100',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
        ),
      );
}

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text(
          'My Bookings',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFD6F0E6),
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/id/16/400/300',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Villa 2 Room',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Status: Confirmed',
                      style: TextStyle(
                        color: Color(0xFF4EBE5F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
              'https://cdn-icons-png.flaticon.com/512/295/295128.png',
            ),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(height: 20),
          const Text(
            'Farid Ihsan Falihuddin',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'NBI: 1462300157',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 200,
            child: _btn('Logout', () => Navigator.pop(context), outline: true),
          ),
        ],
      ),
    );
  }
}

class RoomDetailRoute extends StatelessWidget {
  final String n, img, desc;
  const RoomDetailRoute(this.n, this.img, this.desc, {super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFE1F5E5),
    body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      n,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    img,
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 12,
                  left: 12,
                  child: Icon(Icons.star, color: Colors.amber, size: 45),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '\$100',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: _btn(
              'Book Now',
              () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: const Text(
                    'Confirm Booking',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    'Are you sure you want to book the $n for \$100 per night?',
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              outline: true,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _btn(String txt, VoidCallback fn, {bool outline = false}) => SizedBox(
  width: double.infinity,
  height: 50,
  child: outline
      ? OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0xFFD6E4E5),
            side: const BorderSide(width: 1.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: fn,
          child: Text(
            txt,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        )
      : ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4EBE5F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 0,
          ),
          onPressed: fn,
          child: Text(
            txt,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
);

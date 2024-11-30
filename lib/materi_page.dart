import 'package:flutter/material.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({super.key});

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  int _selectedIndex = 1; // Indeks awal untuk MateriPage

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/studentpage');
        break;
      case 1:
        // Tetap di halaman ini
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/quiz_siswa');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0, // Menyembunyikan tinggi AppBar default
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              // Header berbentuk setengah lingkaran dengan teks
              Stack(
                children: [
                  Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 253, 240, 69), // Warna header
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(150),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      alignment: Alignment.center,
                      child: const Text(
                        "Halaman Materi",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10), // Spasi antara header dan konten
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // Mengubah untuk merapat ke atas
                    children: [
                      const SizedBox(height: 20), // Padding atas
                      _buildMateriBox(context, "Matematika"),
                      const SizedBox(height: 20), // Jarak antar box
                      _buildMateriBox(context, "Biologi"),
                      const SizedBox(height: 20), // Jarak antar box
                      _buildMateriBox(context, "PKN"),
                      const SizedBox(height: 20), // Jarak antar box
                      _buildMateriBox(context, "Fisika"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Materi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color.fromARGB(255, 253, 240, 69),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildMateriBox(BuildContext context, String subject) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KelasPage(subject: subject),
          ),
        );
      },
      child: Container(
        width: 300, // Lebar box
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            subject,
            style: const TextStyle(
              color: Colors.white, // Warna teks
              fontSize: 24, // Ukuran teks
              fontWeight: FontWeight.bold, // Ketebalan teks
            ),
          ),
        ),
      ),
    );
  }
}

class KelasPage extends StatelessWidget {
  final String subject;

  const KelasPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0, // Menyembunyikan tinggi AppBar default
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              // Header berbentuk setengah lingkaran dengan teks
              Stack(
                children: [
                  Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 253, 240, 69), // Warna header
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(150),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      alignment: Alignment.center,
                      child: Text(
                        "Kelas $subject",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10), // Spasi antara header dan konten
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // Mengubah agar rapat ke atas
                    children: List.generate(3, (index) {
                      int kelasNumber = index + 10; // Kelas 10, 11, 12
                      return _buildKelasBox(kelasNumber);
                    }),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Materi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
        ],
        currentIndex: 1, // Indeks tetap di Materi
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/studentpage');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/materi');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/quiz_siswa');
              break;
          }
        },
        backgroundColor: const Color.fromARGB(255, 253, 240, 69),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildKelasBox(int kelasNumber) {
    return Container(
      width: 300, // Lebar box
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'Kelas $kelasNumber',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

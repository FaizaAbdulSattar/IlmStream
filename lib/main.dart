import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(IlmiLibraryApp());

class IlmiLibraryApp extends StatefulWidget {
  @override
  State<IlmiLibraryApp> createState() => _IlmiLibraryAppState();
}

class _IlmiLibraryAppState extends State<IlmiLibraryApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ilm Stream – اسلامی و ادبی کتابیں',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.purple.shade900,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple.shade900,
          titleTextStyle: GoogleFonts.notoNastaliqUrdu(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        textTheme: GoogleFonts.notoNastaliqUrduTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.blue.shade900,
                displayColor: Colors.blue.shade900,
              ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.blue.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade100),
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
        primaryColor: Colors.blue.shade200,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey.shade900,
          titleTextStyle: GoogleFonts.notoNastaliqUrdu(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: GoogleFonts.notoNastaliqUrduTextTheme(
          ThemeData.dark().textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        nextScreen: HomeScreen(
          onToggleTheme: () {
            setState(() {
              isDarkMode = !isDarkMode;
            });
          },
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  final Widget nextScreen;
  const SplashScreen({super.key, required this.nextScreen});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => widget.nextScreen),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff6441a5), Color(0xff2a0845)],
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Text(
            'IlmStream',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}
class Book {
  final String title;
  final String author;
  final String path;
  final String cover;
  final String category;

  Book({
    required this.title,
    required this.author,
    required this.path,
    required this.cover,
    required this.category,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      author: json['author'],
      path: json['path'],
      cover: json['cover'],
      category: json['category'],
    );
  }
}

class HomeScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  HomeScreen({required this.onToggleTheme});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Book> allBooks = [];
  List<Book> filteredBooks = [];
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadBooks();
    searchController.addListener(onSearchChanged);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> loadBooks() async {
    final String jsonString = await rootBundle.loadString('assets/books.json');
    final List<dynamic> jsonData = json.decode(jsonString)['books'];
    setState(() {
      allBooks = jsonData.map((e) => Book.fromJson(e)).toList();
      filteredBooks = allBooks;
      isLoading = false;
    });
  }

  void onSearchChanged() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredBooks = allBooks.where((book) {
        return book.title.toLowerCase().contains(query) ||
            book.author.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('IlmStream'),
          actions: [
            IconButton(
              icon: Icon(Icons.brightness_6),
              onPressed: widget.onToggleTheme,
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'اسلامی کتب', ),
              Tab(text: 'اردو ناولز', ),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
          ),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'کتاب یا مصنف تلاش کریں...',
                        prefixIcon:
                            Icon(Icons.search, color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        BookGrid(books: filteredBooks, category: 'Islamic'),
                        BookGrid(books: filteredBooks, category: 'Novel'),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class BookGrid extends StatelessWidget {
  final List<Book> books;
  final String category;

  BookGrid({required this.books, required this.category});

  Future<void> downloadFile(BuildContext context, String assetPath, String title) async {
    try {
      final bytes = await rootBundle.load(assetPath);
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$title.pdf');
      await file.writeAsBytes(bytes.buffer.asUint8List());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('"$title" کامیابی سے ڈاؤن لوڈ ہو گئی۔')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ڈاؤن لوڈ ناکام ہو گئی: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryBooks = books.where((b) => b.category == category).toList();

    return categoryBooks.isEmpty
        ? Center(
            child: Text(
              'اس زمرے میں کوئی کتاب موجود نہیں ہے۔',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: categoryBooks.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.57,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final book = categoryBooks[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          PDFViewerScreen(title: book.title, assetPath: book.path),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade100,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // fix overflow
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.network(
                            book.cover,
                            height: 150,  // Reduced height for better fit
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              height: 150,
                              color: Colors.grey.shade300,
                              child: Icon(Icons.book, size: 80, color: Colors.grey),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min, // fix overflow
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                book.author,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.download),
                                    onPressed: () =>
                                        downloadFile(context, book.path, book.title),
                                    tooltip: 'ڈاؤن لوڈ کریں',
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}




class PDFViewerScreen extends StatefulWidget {
  final String title;
  final String assetPath;

  const PDFViewerScreen({required this.title, required this.assetPath});

  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  late Future<Uint8List> _pdfDataFuture;

  @override
  void initState() {
    super.initState();
    _pdfDataFuture = _loadPdfData();
  }

  Future<Uint8List> _loadPdfData() async {
    final byteData = await rootBundle.load(widget.assetPath);
    return byteData.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder<Uint8List>(
        future: _pdfDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('PDF لوڈ کرنے میں مسئلہ ہوا: ${snapshot.error}'));
          } else {
            return SfPdfViewer.memory(snapshot.data!);
          }
        },
      ),
    );
  }
}

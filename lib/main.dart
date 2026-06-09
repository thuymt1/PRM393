import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveMovieApp());
}

class ResponsiveMovieApp extends StatelessWidget {
  const ResponsiveMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Movie Browser',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F6FB),
      ),
      home: const GenreScreen(),
    );
  }
}

class Movie {
  final String title;
  final int year;
  final List<String> genres;
  final String posterUrl;
  final double rating;

  const Movie({
    required this.title,
    required this.year,
    required this.genres,
    required this.posterUrl,
    required this.rating,
  });
}

const List<Movie> allMovies = [
  Movie(
    title: 'Inception',
    year: 2010,
    genres: ['Action', 'Sci-Fi'],
    posterUrl: 'https://picsum.photos/seed/inception/300/450',
    rating: 8.8,
  ),
  Movie(
    title: 'La La Land',
    year: 2016,
    genres: ['Drama', 'Romance'],
    posterUrl: 'https://picsum.photos/seed/lalaland/300/450',
    rating: 8.0,
  ),
  Movie(
    title: 'The Dark Knight',
    year: 2008,
    genres: ['Action', 'Thriller'],
    posterUrl: 'https://picsum.photos/seed/darkknight/300/450',
    rating: 9.0,
  ),
  Movie(
    title: 'Toy Story',
    year: 1995,
    genres: ['Animation', 'Comedy'],
    posterUrl: 'https://picsum.photos/seed/toystory/300/450',
    rating: 8.3,
  ),
  Movie(
    title: 'Interstellar',
    year: 2014,
    genres: ['Sci-Fi', 'Drama'],
    posterUrl: 'https://picsum.photos/seed/interstellar/300/450',
    rating: 8.7,
  ),
  Movie(
    title: 'Crazy Rich Asians',
    year: 2018,
    genres: ['Comedy', 'Romance'],
    posterUrl: 'https://picsum.photos/seed/richasians/300/450',
    rating: 6.9,
  ),
  Movie(
    title: 'Mad Max: Fury Road',
    year: 2015,
    genres: ['Action', 'Adventure'],
    posterUrl: 'https://picsum.photos/seed/madmax/300/450',
    rating: 8.1,
  ),
  Movie(
    title: 'Parasite',
    year: 2019,
    genres: ['Drama', 'Thriller'],
    posterUrl: 'https://picsum.photos/seed/parasite/300/450',
    rating: 8.5,
  ),
];

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  final TextEditingController _searchController = TextEditingController();

  String searchQuery = '';
  String selectedSort = 'A-Z';
  final Set<String> selectedGenres = {};

  static const List<String> genres = [
    'Action',
    'Drama',
    'Comedy',
    'Sci-Fi',
    'Romance',
    'Thriller',
    'Animation',
    'Adventure',
  ];

  List<Movie> get visibleMovies {
    final query = searchQuery.trim().toLowerCase();

    final movies = allMovies.where((movie) {
      final matchesSearch = movie.title.toLowerCase().contains(query);

      final matchesGenre = selectedGenres.isEmpty ||
          movie.genres.any((genre) => selectedGenres.contains(genre));

      return matchesSearch && matchesGenre;
    }).toList();

    switch (selectedSort) {
      case 'Z-A':
        movies.sort((a, b) => b.title.compareTo(a.title));
        break;
      case 'Year':
        movies.sort((a, b) => b.year.compareTo(a.year));
        break;
      case 'Rating':
        movies.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'A-Z':
      default:
        movies.sort((a, b) => a.title.compareTo(b.title));
    }

    return movies;
  }

  void clearFilters() {
    setState(() {
      searchQuery = '';
      selectedSort = 'A-Z';
      selectedGenres.clear();
      _searchController.clear();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final movies = visibleMovies;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth < 600 ? 16 : 32,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHero(screenWidth),
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 14),
              _buildGenreHeader(),
              const SizedBox(height: 8),
              _buildGenreChips(),
              const SizedBox(height: 14),
              _buildSortBar(movies.length),
              const SizedBox(height: 12),
              Expanded(
                child: _buildMovieArea(movies),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(double screenWidth) {
    final isWide = screenWidth >= 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isWide ? 28 : 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2E1A72),
            Color(0xFF6750A4),
          ],
        ),
      ),
      child: isWide
          ? Row(
        children: [
          Expanded(child: _buildHeroText()),
          const Icon(
            Icons.movie_filter_rounded,
            size: 72,
            color: Colors.white,
          ),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.movie_filter_rounded,
            size: 54,
            color: Colors.white,
          ),
          const SizedBox(height: 14),
          _buildHeroText(),
        ],
      ),
    );
  }

  Widget _buildHeroText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Find a Movie',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Search, filter by genre, and sort movies with a responsive layout.',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      onChanged: (value) {
        setState(() {
          searchQuery = value;
        });
      },
      decoration: InputDecoration(
        hintText: 'Search movie title...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: searchQuery.isEmpty
            ? null
            : IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            setState(() {
              searchQuery = '';
              _searchController.clear();
            });
          },
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildGenreHeader() {
    return Row(
      children: [
        const Text(
          'Genres',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        if (selectedGenres.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF6750A4),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              '${selectedGenres.length} selected',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        const Spacer(),
        TextButton.icon(
          onPressed: clearFilters,
          icon: const Icon(Icons.refresh, size: 18),
          label: const Text('Clear filters'),
        ),
      ],
    );
  }

  Widget _buildGenreChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: genres.map((genre) {
        final isSelected = selectedGenres.contains(genre);

        return FilterChip(
          label: Text(genre),
          selected: isSelected,
          showCheckmark: true,
          onSelected: (_) {
            setState(() {
              if (isSelected) {
                selectedGenres.remove(genre);
              } else {
                selectedGenres.add(genre);
              }
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildSortBar(int movieCount) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '$movieCount movies found',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedSort,
              items: const ['A-Z', 'Z-A', 'Year', 'Rating'].map((sort) {
                return DropdownMenuItem<String>(
                  value: sort,
                  child: Text(sort),
                );
              }).toList(),
              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  selectedSort = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMovieArea(List<Movie> movies) {
    if (movies.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off_rounded, size: 56, color: Colors.black38),
            SizedBox(height: 12),
            Text(
              'No movies found',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Try another search keyword or genre.',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return ListView.separated(
            padding: const EdgeInsets.only(bottom: 16),
            itemCount: movies.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return MovieCard(movie: movies[index]);
            },
          );
        }

        return GridView.count(
          padding: const EdgeInsets.only(bottom: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: constraints.maxWidth >= 1000 ? 2.7 : 2.25,
          children: movies.map((movie) {
            return MovieCard(movie: movie);
          }).toList(),
        );
      },
    );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compactCard = constraints.maxWidth < 380;

        final posterWidth = compactCard ? 82.0 : 104.0;
        final posterHeight = compactCard ? 118.0 : 142.0;

        return Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    movie.posterUrl,
                    width: posterWidth,
                    height: posterHeight,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return Container(
                        width: posterWidth,
                        height: posterHeight,
                        color: const Color(0xFFE8E5F3),
                        alignment: Alignment.center,
                        child: const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: posterWidth,
                        height: posterHeight,
                        color: const Color(0xFFE8E5F3),
                        alignment: Alignment.center,
                        child: const Icon(Icons.movie, size: 36),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${movie.year}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: movie.genres.map((genre) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0EDF8),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              genre,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF4B328A),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            _stars(movie.rating),
                            style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${movie.rating.toStringAsFixed(1)}/10',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _stars(double rating) {
    final filledStars = (rating / 2).round().clamp(0, 5).toInt();

    return List.generate(5, (index) {
      return index < filledStars ? '★' : '☆';
    }).join();
  }
}
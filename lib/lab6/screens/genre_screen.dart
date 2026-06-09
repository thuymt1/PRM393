import 'package:flutter/material.dart';
import '../data/movie_data.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';

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
          'Search, filter by genre, and sort movies with responsive layout.',
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
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: [
        const Text(
          'Genres',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
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

        return GridView.builder(
          padding: const EdgeInsets.only(bottom: 16),
          itemCount: movies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: constraints.maxWidth >= 1000 ? 2.7 : 2.25,
          ),
          itemBuilder: (context, index) {
            return MovieCard(movie: movies[index]);
          },
        );
      },
    );
  }
}
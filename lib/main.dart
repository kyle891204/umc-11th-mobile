import 'package:flutter/material.dart';

void main() {
  runApp(const MovieLogApp());
}

class MovieLogApp extends StatelessWidget {
  const MovieLogApp({super.key});

  // 주요 색상 상수
  static const Color _purple = Color(0xFF5E3B8C);
  static const Color _titleColor = Color(0xFF1A1A1A);
  static const Color _subtitleColor = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieLog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _purple,
          brightness: Brightness.light,
        ),
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 48),
              // 상단 라벨
              const Text(
                'FLUTTER 1주차',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: MovieLogApp._subtitleColor,
                ),
              ),
              const SizedBox(height: 120),
              // 영화 아이콘 (기본 제공 아이콘 사용)
              const Icon(
                Icons.movie_outlined,
                size: 72,
                color: MovieLogApp._purple,
              ),
              const SizedBox(height: 80),
              // 제목
              const Text(
                '영화의 순간을\n기록하세요',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  height: 1.3,
                  color: MovieLogApp._titleColor,
                ),
              ),
              const SizedBox(height: 20),
              // 부제목
              const Text(
                '보고 싶은 영화부터 나만의 평점까지\n한곳에서 관리해요',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  color: MovieLogApp._subtitleColor,
                ),
              ),
              // 남은 공간을 채워 버튼을 하단으로 밀어냄
              const Spacer(),
              // 시작하기 버튼 (화면 이동 기능은 아직 구현하지 않음)
              SizedBox(
                width: double.infinity,
                height: 64,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MovieLogApp._purple,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    '시작하기',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

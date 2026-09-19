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
      home: ProfileScreen(),
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

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. 공용으로 제작한 AppBar 위젯 적용
      appBar: const CommonAppBar(
        title: '내 프로필',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding을 사용한 전체 간격 조정
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Column의 교차축(가로) 중앙 정렬
            children: const [
              ProfileHeader(),
              SizedBox(height: 16),

              EditProfileButton(),
              SizedBox(height: 32),

              ProfileStats(),
              SizedBox(height: 32),

              FavoriteGenres(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        // Image.asset 또는 CircleAvatar로 프로필 이미지 표시[cite: 1]
        CircleAvatar(
          radius: 44, // 원의 반지름 속성 활용[cite: 1]
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
        SizedBox(height: 12),
        Text('무비러버', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // 실제 적용 시 AppTextStyles 활용
        SizedBox(height: 8),
        Text(
          '매주 주말엔 영화관으로 출근하는 프로 관람객, 좋은 영화를 보고 기록하는 것을 좋아합니다.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton( // ElevatedButton 또는 TextButton 사용[cite: 1]
      onPressed: () {}, // 클릭 이벤트 비워두기[cite: 1]
      child: const Text('프로필 수정'),
    );
  }
}

// 통계 카드 컴포넌트 (Guided Practice 참고)[cite: 1]
class StatItem extends StatelessWidget {
  const StatItem({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    // 테두리와 둥근 모서리가 적용된 Container[cite: 1]
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Row의 주축(가로) 영역에서 공간을 고르게 분배[cite: 1]
      children: [
        // StatItem을 재사용해 나머지 통계 항목 완성[cite: 1]
        StatItem(label: '본 영화', value: '342'),
        StatItem(label: '평점', value: '4.2'),
        StatItem(label: '즐겨찾기', value: '58'),
      ],
    );
  }
}

class FavoriteGenres extends StatelessWidget {
  const FavoriteGenres({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 좌측 정렬
      children: [
        const Text('선호하는 장르', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(
          children: const [
            Chip(
              label: Text('드라마'),
              backgroundColor: Color(0xFFE8DEF8),
              side: BorderSide.none,
              labelStyle: TextStyle(color: Color(0xFF6750A4), fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 8),
            Chip(
              label: Text('SF'),
              backgroundColor: Color(0xFFE8DEF8),
              side: BorderSide.none,
              labelStyle: TextStyle(color: Color(0xFF6750A4), fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 8),
            Chip(
              label: Text('애니메이션'),
              backgroundColor: Color(0xFFE8DEF8),
              side: BorderSide.none,
              labelStyle: TextStyle(color: Color(0xFF6750A4), fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.actions,
    this.centerTitle = false,
    this.titleStyle,
  });

  final String title;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final bool centerTitle;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        // 주의: 워크북에서는 AppTextStyles와 AppColors를 사용하지만,
        // 아직 해당 파일을 안 만들었다면 에러가 날 수 있어 임시로 기본 스타일을 적용해 두었습니다.
        // 나중에 테마 세팅을 마치면 워크북 코드대로 수정하세요!
        style: titleStyle ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      centerTitle: centerTitle,
      leading: onBack == null
          ? null
          : IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onBack,
      ),
      actions: actions,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
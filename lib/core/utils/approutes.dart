import 'package:go_router/go_router.dart';
import 'package:starx/features/chat/presentation/views/chatpage.dart';
import 'package:starx/features/feed/presentation/views/feedpage.dart';
import 'package:starx/features/logins/presentation/views/setuppage.dart';
import 'package:starx/features/navigationbar/presentation/views/navigationbarpage.dart';
import 'package:starx/features/logins/presentation/views/loginpage.dart';
import 'package:starx/features/logins/presentation/views/signuppage.dart';
import 'package:starx/features/profile/presentation/views/profilepage.dart';
import 'package:starx/features/splash/view/splashview.dart';

abstract class AppRouter {
  static const kloginPage = '/LoginPage';
  static const kSignupPage = '/SignupPage';
  static const kNavigationbarPage = '/NavigationbarPage';
  static const kProfilePage = '/ProfilePage';
  static const kFeedPage = '/FeedPage';
  static const kChatPage = '/ChatPage';
  static const kSetupPageName = '/CustomSetupPage';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: kloginPage,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: kSignupPage,
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: kNavigationbarPage,
        builder: (context, state) => const NavigationBarpage(),
      ),
      GoRoute(
        path: kProfilePage,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: kFeedPage,
        builder: (context, state) => const FeedPage(),
      ),
      GoRoute(
        path: kChatPage,
        builder: (context, state) => const ChatPage(),
      ),
      GoRoute(
        path: kSetupPageName,
        builder: (context, state) => const CustomSetupPage(),
      ),
    ],
  );
}

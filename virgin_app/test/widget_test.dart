// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:virgin_app/login_page.dart';
// import 'package:virgin_app/main.dart';
// import 'package:virgin_app/home_page.dart';
// import 'package:virgin_app/widgets/avatar_widget.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:video_player/video_player.dart';

// // Mock VideoPlayerController
// class MockVideoPlayerController extends Mock implements VideoPlayerController {}


// void main() {

//   // Setup for video player mocking
//   setUpAll(() {
//     registerFallbackValue(FakeVideoPlayerOptions());
//   });
//   testWidgets('Virgin App loads correctly', (WidgetTester tester) async {
//     // Build our app and trigger a frame
//     await tester.pumpWidget(MyApp());

//     // Verify that the app starts with HomePage
//     expect(find.byType(LoginPage), findsOneWidget);
    
//   });


//    testWidgets('Homepage loads correctly', (WidgetTester tester) async {
//       // Create a mock video controller
//     final mockVideoController = MockVideoPlayerController();

//     // Stub the initialization method to prevent real initialization
//     when(() => mockVideoController.initialize()).thenAnswer((_) async => {});
//     when(() => mockVideoController.setLooping(any())).thenAnswer((_) async => {});
//     when(() => mockVideoController.play()).thenAnswer((_) async => {});
//     when(() => mockVideoController.dispose()).thenAnswer((_) async => {});

//     // Override the VideoPlayerController.asset constructor for testing
//     VideoPlayerController.asset = (String dataSource) {
//       return mockVideoController;
//     };
    
//     // Create a MaterialApp to provide the necessary context
//     await tester.pumpWidget(
//       MaterialApp(
//         home: HomePage(),
//       )
//     );
    
//     // Wait for any animations or loading to complete
//     // await tester.pumpAndSettle();

//     // Verify that the AvatarWidget is present
//     expect(find.byType(AvatarWidget), findsAtLeastNWidgets(1));
    
//     // // Test for welcome text on the homepage
//     // expect(find.text('Welcome Back'), findsOneWidget);
//   });




// // testWidgets('Welcome text appears on homepage', (WidgetTester tester) async {
// //   // Pump the homepage widget
// //   await tester.pumpWidget(HomePage()); // Replace MyApp with your app's root widget
  
// //   /// Verify that the welcome text appears
// //     // expect(find.text('Welcome Back,'), findsOneWidget);
    
// //     // // Verify that the AvatarWidget is present
// //     expect(find.byType(AvatarWidget), findsAtLeastNWidgets(1));
    
// //     // // Verify that the BottomAppBar is present
// //     // expect(find.byType(BottomAppBar), findsOneWidget);
    
// //     // // Verify that the home button is present
// //     // expect(find.byIcon(Icons.home), findsOneWidget);
// // });
  
// //   // Puoi aggiungere altri test specifici per la tua app
// //   // testWidgets('Navigation works correctly', (WidgetTester tester) async {
// //   //   await tester.pumpWidget(MyApp());
    
// //   //   // Trova e tocca il pulsante della community
// //   //   await tester.tap(find.byIcon(Icons.groups));
// //   //   await tester.pumpAndSettle(); // Attendi che le animazioni si completino
    
// //   //   // Verifica che siamo nella pagina della community
// //   //   expect(find.text('Community'), findsOneWidget);
// //   // });
// }
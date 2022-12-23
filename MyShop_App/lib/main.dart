import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myshop/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';
import '../providers/orders.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/auth_screen.dart';
import 'providers/auth.dart';
import './widgets/splash_screen.dart';
import './helpers/custom_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Auth()),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (ctx) => Products('', ''),
          update: (ctx, auth, previousProduct) => previousProduct!
            ..update(auth.token ?? '' as String, auth.userId ?? '' as String),
        ),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (ctx) => Orders('', [], ''),
          update: (ctx, auth, previousOrders) => Orders(
            auth.token ?? '' as String,
            previousOrders == null ? [] : previousOrders.orders,
            auth.userId ?? '' as String,
          ),
        ),
      ],
      child: Consumer<Auth>(builder: (ctx, auth, _) {
        ifAuth(targetScreen) => auth.isAuth ? targetScreen : AuthScreen();
        return MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Colors.purple,
                  secondary: Colors.deepOrange,
                ),
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
            }),
            fontFamily: 'Lato',
          ),
          home: auth.isAuth
              ? ProductsOverviewScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          routes: {
            AuthScreen.routeName: (ctx) => ifAuth(AuthScreen()),
            ProductDetailScreen.routeName: (ctx) =>
                ifAuth(ProductDetailScreen()),
            CartScreen.routeName: (ctx) => ifAuth(CartScreen()),
            OrdersScreen.routeName: (ctx) => ifAuth(OrdersScreen()),
            UserProductsScreen.routeName: (ctx) => ifAuth(UserProductsScreen()),
            EditProductScreen.routeName: (ctx) => ifAuth(EditProductScreen()),
            ProductsOverviewScreen.routeName: (ctx) =>
                ifAuth(ProductsOverviewScreen()),
          },
        );
      }),
    );
  }
}

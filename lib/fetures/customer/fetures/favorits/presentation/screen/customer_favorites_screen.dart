import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/app/share_cubit/share_cubit.dart';
import 'package:shopi/core/di/di.dart';
import 'package:shopi/fetures/customer/fetures/favorits/presentation/cubit/customer_favorites_cubit.dart';
import 'package:shopi/fetures/customer/fetures/favorits/presentation/widgets/customer_favorites_body.dart';

class CustomerFavoritsScreen extends StatelessWidget {
  const CustomerFavoritsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CustomerFavoritesCubit>()),
        BlocProvider(create: (context) => getIt<ShareCubit>()),
      ],
      child: const CustomerFavorietsBody(),
    );
  }
}



/**
 * 
 * 
 *   
        <!-- ======= App Link (HTTPS) =======
                 Enable this if you want links like:
                 https://shopi.com/product/123
                 NOTE: you must host .well-known/assetlinks.json on your domain
                 and set the correct package name + signing fingerprint.
            -->
            <intent-filter android:autoVerify="true">
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
                <data
                    android:scheme="https"
                    android:host="shopi.com"
                    android:pathPrefix="/product" />
            </intent-filter>

            <!-- ======= Custom Scheme Deep Link (اختياري) =======
                 Uncomment if you want to support custom scheme links too:
                 shopi://product/123
            -->
            <
            <intent-filter>
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
                <data android:scheme="shopi" android:host="product" />
            </intent-filter>
            >



 */
import 'dart:async';
import 'dart:developer';

import 'package:drive_easy_app/screens/students/dashboard.dart';
import 'package:drive_easy_app/screens/students/layouts/dashboard_layout.dart';
import 'package:drive_easy_app/utils/check_image_extension.dart';
import 'package:drive_easy_app/utils/theme_consts.dart';
import 'package:drive_easy_app/utils/user_location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../routes/app_routes.dart';

part 'alert_dialogs/sign_out_confirmation.dart';
part 'alert_dialogs/common_confirmation.dart';
part 'app_bar/top_app_bar.dart';
part 'banners/screen_top_banner.dart';
part 'bottom_nav_bars/persistent_nav_bar.dart';
part 'buttons/app_text_button.dart';
part 'buttons/button_card.dart';
part 'buttons/button_card_wide.dart';
part 'cards/vehicle_card.dart';
part 'cards/vehicle_space_card.dart';
part 'charts/indicator.dart';
part 'charts/pie_chart.dart';
part 'loaders/circular_loader_widget.dart';
part 'maps/map_container.dart';
part 'maps/rounded_map_container.dart';
part 'notifications/app_snack_bar_widget.dart';
part 'notifications/app_toast_widget.dart';

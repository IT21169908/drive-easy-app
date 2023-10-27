part of '../widgets.g.dart';

Future<void> showSignOutDialog(BuildContext context, bool mounted) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // User must tap button to dismiss
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Sign Out?'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Are you sure you want to sign out?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: const Text('Sign Out'),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (mounted) {
                Navigator.of(context).pushNamedAndRemoveUntil(RouteName.guestDashboard, (Route<dynamic> route) => false);
              }
            },
          ),
        ],
      );
    },
  );
}

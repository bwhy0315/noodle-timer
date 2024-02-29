import 'package:flutter/material.dart';
import 'package:noodle_timer/misc_oss_license_single.dart';
import 'oss_licenses.dart';

class OssLicensesPage extends StatelessWidget {

  static Future<List<String>> loadLicenses() async {
    final ossKeys = ossLicenses.keys.toList();
    return ossKeys..sort();
  }

  static final _licenses = loadLicenses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Open Source Licenses'),
        ),
        body: FutureBuilder<List<String>>(
            future: _licenses,
            builder: (context, snapshot) {
              return ListView.separated(
                  padding: const EdgeInsets.all(0),
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final key = snapshot.data![index];
                    final licenseJson = ossLicenses[key];
                    final version = licenseJson['version'];
                    final desc = licenseJson['description'];
                    return ListTile(
                        title: Text('$key ${version ?? ''}'),
                        subtitle: desc != null ? Text(desc) : null,
                        trailing: Icon(Icons.chevron_right),
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MiscOssLicenseSingle(name: key, json: licenseJson)))
                    );
                  },
                  separatorBuilder: (context, index) => const Divider()
              );
            }
        )
    );
  }
}
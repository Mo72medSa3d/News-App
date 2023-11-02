import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  Future<List<dynamic>> fetchPosts() async {
    final response =
    await http.get(Uri.https('jsonplaceholder.typicode.com', 'posts'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: () => Get.offAllNamed('/login')),
      ),
      body: FutureBuilder<List<dynamic>>(
                  future: fetchPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data![index]['title']),
                            subtitle: Text(snapshot.data![index]['body']),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
          );
  }
}


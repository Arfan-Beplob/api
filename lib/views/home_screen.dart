import 'package:api_get_method/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  void didChangeDependencies() {
Provider.of<UserProvider>(context,listen: false).getData();

super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(
        builder: ( context, Provider , child)
        {
          return  Provider.hasDataLoaded
              ? Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context,index){
                    return Container(
                      height: 629,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      color: Colors.amber,
                      child:  Column(
                        children: [
                          Text('"User Id" : ${Provider.userModel?.userId}'
                          ,style: const TextStyle(fontSize: 30),
                          ),
                          Text('"Id" : ${Provider.userModel?..id}'
                            ,style: const TextStyle(fontSize: 30),
                          ),
                          Text('"Title" : ${Provider.userModel?.title}'
                            ,style: const TextStyle(fontSize: 30),
                          ),
                          Text('"Body" : ${Provider.userModel?.body}'
                            ,style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    );
                  }),
                  ElevatedButton(onPressed: Provider.postData,
                      child:Text('Post Data') )
                ],
              ): const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

import "package:flutter/material.dart";
class InfoPage0 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white30,
      child: SingleChildScrollView(
        child: Column(
          children: [

            Image.asset("lib/images/0.jpg"),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                  " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                  " Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi"
                  " ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit"
                  " in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur "
                  "sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt "
                  "mollit anim id est laborum.", textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}

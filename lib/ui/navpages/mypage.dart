import 'package:flutter/material.dart';

class mypage extends StatelessWidget {
   mypage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Myprofile'),
        titleTextStyle: TextStyle(
          color: Color.fromRGBO(158, 158, 158, 1),
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),
     
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/Naruto.jpg'),
                radius: 60,
              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey,
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Color.fromRGBO(158, 158, 158, 1),
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Shahis pk',
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              'CURRENT MSPK LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
          
            
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Shahispk910@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ],
            )
          ],
        ),
      ),  
    );
  }
}


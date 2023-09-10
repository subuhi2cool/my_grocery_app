import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery_app/constants/text_strings.dart';
import 'package:my_grocery_app/features/custom_appbar/ui/appbar.dart';

import '../../custom_bottom_navigation_bar/ui/bottom_navigation_bar.dart';
import '../../login_form/ui/login_form.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: CustomAppBar(title: tProfile),
      body:
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
             children: [
               const Padding(
                 padding: EdgeInsets.all(20.0),
                 child: Icon(Icons.person_pin,size: 125,color: Colors.black26,),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   TextButton(
                       onPressed: (){},
                       child: const Text("test",
                         style: TextStyle(
                             color: Colors.black,
                             fontSize: 20),)),
                   const Icon(Icons.edit,size: 20,color: Colors.green,),

                 ],
               ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
         onPressed: (){},
         style: ElevatedButton.styleFrom(
         backgroundColor: Colors.yellow,
        // foregroundColor: Colors.yellow,
         shape: RoundedRectangleBorder(
         side: const BorderSide(color: Colors.yellow,width: 1),
         borderRadius: BorderRadius.circular(15.0)),
         padding: const EdgeInsets.only(right:20,left: 1,top:5,bottom: 5),),
         child: const Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             SizedBox(width: 15,),
             Text("Email is not verified",textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 20),),
           ],
         ),),
            ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: (){},
                      child: const Text("Dismiss",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20),)),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white60,
                        shape: RoundedRectangleBorder(
                         side:  const BorderSide(color: Colors.black26),
                         borderRadius: BorderRadius.circular(5.0)),
                        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),),
                      child: const Text("Send verification email",textAlign: TextAlign.start,style: TextStyle(color: Colors.green,fontSize: 20),),),
                  ),
                ],
              ),
               const SizedBox(height: 10,),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       TextButton(
                           onPressed: (){},
                           child: const Text("Sign in methods",
                             style: TextStyle(
                                 color: Colors.black54,
                                 fontSize: 20),)),
                       const Padding(
                         padding: EdgeInsets.all(8.0),
                         child: Icon(Icons.mail_outline,size: 20,color: Colors.black,),
                       ),
                     ],
                   ),
                 ],
               ),
               const SizedBox(height: 15,),
               SizedBox(
                 height: 35,
                 width: double.infinity,
                 child: ElevatedButton(
                   onPressed: () async {
                     Navigator.push(
                         context, MaterialPageRoute(builder: (context) => const LoginForm()));
                     await FirebaseAuth.instance.signOut();
                   },
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.white60,
                     // foregroundColor: Colors.yellow,
                     shape: RoundedRectangleBorder(
                         side: const BorderSide(color: Colors.black26,width: 1),
                         borderRadius: BorderRadius.circular(5.0)),
                     padding: const EdgeInsets.only(right:20,left: 1,top:5,bottom: 5),),
                   child: const Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(Icons.logout, color: Colors.green,),
                       Text("Sign out",textAlign: TextAlign.start,style: TextStyle(color: Colors.green,fontSize: 20),),
                     ],
                   ),),
               ),
               const SizedBox(height: 10,),
               SizedBox(
                 height: 40,
                 width: double.infinity,
                 child: ElevatedButton(
                   onPressed: (){},
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.red,
                     // foregroundColor: Colors.yellow,
                     shape: RoundedRectangleBorder(
                         side: const BorderSide(color: Colors.yellow,width: 1),
                         borderRadius: BorderRadius.circular(5.0)),
                     padding: const EdgeInsets.only(right:20,left: 1,top:5,bottom: 5),),
                   child: const Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(Icons.delete, color: Colors.white,),
                       Text("Delete Account",textAlign: TextAlign.start,style: TextStyle(color: Colors.white,fontSize: 20),),
                     ],
                   ),),
               ),



    ],

         ),
          ),

      bottomNavigationBar: CustomBottomNavigationBar(newindex: 0,),
    );
  }
}

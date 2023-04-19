
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Login UI",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),

      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Signup Screen",
          ),
        ),
        
      body: _screen(),),);
  }

  Widget _screen(){
     return Padding(
       padding:const EdgeInsets.all(5),
       child:Container(
        child: SingleChildScrollView(
           child:Column(

              children: [
                
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Enter your First Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
             
         
             const SizedBox(
               height: 15,),

               TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Enter your Last Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

                const SizedBox(
               height: 15,),

               

               TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter your CNIC",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

                const SizedBox(
               height: 15,),

               TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Enter your email address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

                const SizedBox(
               height: 15,),

               TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

                const SizedBox(
               height: 15,),

               TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

                const SizedBox(
               height: 15,),

               TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Enter your Phone no",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

                const SizedBox(
               height: 15,),

               TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: "Enter your Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
  
            
        
      
            const SizedBox(
              height: 15,),
      
            const SizedBox(
              height: 15,),
      
            Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(colors: [Colors.blue, Colors.green]),
                  ),
                  child: MaterialButton(
                    onPressed: (){},
                    child: const Text(
                      "SIGNUP",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),),
         
         ],
       ),),)
       
       );
     
    
  }
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List userPosts = [
    {
      "name": "Margareta Da Vick",
      "profile":
          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "location": "Cafe Brew and Bloom",
      "postPhoto":
          "https://plus.unsplash.com/premium_photo-1674327105074-46dd8319164b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "storyPhoto":
          "https://plus.unsplash.com/premium_photo-1703701579680-3b4c2761aa47?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "isUser": true,
    },
    {
      "name": "Margareta Da Vick",
      "profile":
          "https://images.unsplash.com/photo-1546961329-78bef0414d7c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "location": "Cafe Brew and Bloom",
      "postPhoto":
          "https://plus.unsplash.com/premium_photo-1674327105074-46dd8319164b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "storyPhoto":
          "https://plus.unsplash.com/premium_photo-1703701579680-3b4c2761aa47?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "isUser": false,
    },
    {
      "name": "Margareta Da Vick",
      "profile":
          "https://images.unsplash.com/photo-1701615004837-40d8573b6652?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "location": "Cafe Brew and Bloom",
      "postPhoto":
          "https://plus.unsplash.com/premium_photo-1674327105074-46dd8319164b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "storyPhoto":
          "https://plus.unsplash.com/premium_photo-1703701579933-29e3f78c46a9?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "isUser": false,
    },
    {
      "name": "Margareta Da Vick",
      "profile":
          "https://images.unsplash.com/photo-1499887142886-791eca5918cd?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "location": "Cafe Brew and Bloom",
      "postPhoto":
          "https://plus.unsplash.com/premium_photo-1674327105074-46dd8319164b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "storyPhoto":
          "https://plus.unsplash.com/premium_photo-1703701579680-3b4c2761aa47?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "isUser": false,
    },
    {
      "name": "Margareta Da Vick",
      "profile":
          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTB8fHVzZXJ8ZW58MHx8MHx8fDA%3D",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "location": "Cafe Brew and Bloom",
      "postPhoto":
          "https://plus.unsplash.com/premium_photo-1674327105074-46dd8319164b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "storyPhoto":
          "https://images.unsplash.com/photo-1735806439337-91c2848603db?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGZhY2UlMjBib29rc3Rvcnl8ZW58MHx8MHx8fDA%3D",
      "isUser": false,
    },
    {
      "name": "Margareta Da Vick",
      "profile":
          "https://images.unsplash.com/photo-1528892952291-009c663ce843?q=80&w=2144&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "location": "Cafe Brew and Bloom",
      "postPhoto":
          "https://plus.unsplash.com/premium_photo-1674327105074-46dd8319164b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "storyPhoto":
          "https://plus.unsplash.com/premium_photo-1703701579680-3b4c2761aa47?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "isUser": false,
    },
  ];

  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset("assets/logo/logo_kivaloop.png", width: 120),
        actions: [
          Icon(Iconsax.gameboy4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Iconsax.message_2),
          ),
        ],
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Story Section
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Container(
                  height: 180,
                  width: double.infinity,

                  child: ListView.builder(
                    itemCount: userPosts.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 177,
                          width: 99,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xff745340).withOpacity(0.5),
                            image:
                                !userPosts[index]["isUser"]
                                    ? DecorationImage(
                                      opacity: 0.3,
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        userPosts[index]["storyPhoto"],
                                      ),
                                    )
                                    : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Visibility(
                                visible:
                                    userPosts[index]["isUser"] ? true : false,
                                child: Icon(
                                  Iconsax.add_circle5,
                                  size: 30,
                                  color: Colors.transparent,
                                ),
                              ),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(color: Color(0xff745340)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      userPosts[index]["profile"],
                                    ),
                                  ),
                                ),
                              ),

                              Visibility(
                                visible:
                                    userPosts[index]["isUser"] ? true : false,
                                child: GestureDetector(
                                  onTap: () async {
                                    final ImagePicker picker = ImagePicker();
                                    // Pick an image.
                                    final XFile? image = await picker.pickImage(
                                      source: ImageSource.camera,
                                    );
                                  },
                                  child: Icon(
                                    Iconsax.add_circle5,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Post Section
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: userPosts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing: 6,
                                children: [
                                  Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),

                                      image: DecorationImage(
                                        image: NetworkImage(
                                          userPosts[index]["profile"],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    userPosts[index]["name"],
                                    style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                spacing: 6,
                                children: [
                                  Icon(
                                    Iconsax.location5,
                                    size: 12,
                                    color: Color(0xff745340),
                                  ),
                                  Text(
                                    userPosts[index]["location"],
                                    style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          Container(
                            height: 393,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  userPosts[index]["postPhoto"],
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 20,
                                  bottom: 20,
                                  child: Container(
                                    width: 289,
                                    height: 70,
                                    child: Text(
                                      "☕ Welcome to Brew & Bloom– your new favorite coffee spot in town! Fresh brews, cozy vibes, and delicious bites await. 📍Visit at Amsterdam ⏰ Open daily: 7AM#CafeVibes #CoffeeLovers #NewInTown",
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),

                                Positioned(
                                  right: 20,
                                  bottom: 20,
                                  child: Container(
                                    width: 24,
                                    height: 126,
                                    child: Column(
                                      spacing: 10,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedIndex = index;
                                            });
                                          },
                                          child:
                                              selectedIndex == index
                                                  ? Icon(
                                                    Iconsax.heart5,
                                                    color: Colors.red,
                                                  )
                                                  : Icon(
                                                    Iconsax.heart,
                                                    color: Colors.white,
                                                  ),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Iconsax.message,
                                            color: Colors.white,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Iconsax.bookmark,
                                            color: Colors.white,
                                          ),
                                        ),

                                        GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Iconsax.more,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

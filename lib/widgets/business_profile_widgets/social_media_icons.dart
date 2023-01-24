import 'package:flutter/material.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Divider(
              indent: 30,
              endIndent: 30,
              color: Colors.grey,
              thickness: 2,
              height: 4),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Row(
            children: const [
              Text('Share Cash Flow Campaign'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CircleAvatar(
                radius: 15,
                // backgroundImage: AssetImage('assets/images/usr_pwd_icon.jpeg'),
                backgroundImage: NetworkImage(
                    'https://www.freepnglogos.com/uploads/logo-facebook-png/logo-facebook-facebook-logo-transparent-png-pictures-icons-and-0.png'),
              ),
              CircleAvatar(
                radius: 15,
                //backgroundImage: AssetImage('assets/images/usr_pwd_icon.jpeg'),
                backgroundImage: NetworkImage(
                    'https://thumbs.dreamstime.com/b/colored-instagram-logo-icon-high-resolution-colored-instagram-logo-white-background-vector-eps-file-available-additional-175710005.jpg'),
              ),
              CircleAvatar(
                radius: 15,
                //backgroundImage: AssetImage('assets/images/usr_pwd_icon.jpeg'),
                backgroundImage: NetworkImage(
                    'https://logos-world.net/wp-content/uploads/2020/04/Snapchat-Logo.png'),
              ),
              CircleAvatar(
                radius: 15,
                //backgroundImage: AssetImage('assets/images/usr_pwd_icon.jpeg'),
                backgroundImage: NetworkImage(
                    'https://www.kindpng.com/picc/m/363-3632986_logo-linkedin-png-rond-transparent-png.png'),
              ),
              CircleAvatar(
                radius: 15,
                //backgroundImage: AssetImage('assets/images/usr_pwd_icon.jpeg'),
                backgroundImage: NetworkImage(
                    'https://www.socialflow.com/wp-content/uploads/2019/01/8ca486faebd822ddf4baf00321b16df1-google-icon-logo-by-vexels.png'),
              ),
              CircleAvatar(
                radius: 15,
                //backgroundImage: AssetImage('assets/images/usr_pwd_icon.jpeg'),
                backgroundImage: NetworkImage(
                    'https://cdn.freebiesupply.com/logos/large/2x/twitter-3-logo-png-transparent.png'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

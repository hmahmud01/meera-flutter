import 'package:flutter/material.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/home_button.dart';

class PolicyScreens extends StatelessWidget {
  static const routeName = '/policy-screens';
  // const TermScreens({Key? key}) : super(key: key);

  List<String> terms = [
    "The security of your Personal Information is important to us, but remember that no method of transmission over the Internet. The method of electronic storage and 100% secure. While we strive to use commercially acceptable means to protect your Personal Information.",
    "Our Service may contain links to external sites that are not operated by us. When you click on a third party link, you will be directed into that third party’s site. We strongly advise you to review the Privacy Policy and terms of service of every site you visit. We have no control over, and assume no responsibility for the content, privacy policies or practices of any third party sites.",
    "MAI Seed uses the remarketing services to advertise on third party websites (including Google). It could mean that we advertise to previous visitors who haven’t completed to login on our site, for example using the contact form to make an mirror. This could be in the form of an advertisement on the Google search results page, or a site in the Google Display Network. Third-party vendors, including Google, use cookies to serve ads based on someone’s past visits. Of course, any data collected will be used in accordance with our own privacy policy and Google’s privacy policy. You can set preferences for how Google advertises to you using the Google Ad Preferences page, and if you want to advertise entirely by cookie settings or permanently using a browser plugin.",
    "If you are a registered user of MAI application and have supplied your email address, MAI Seed may occasionally send you an email to tell you about new features, solicit your feedback, or just keep you up to date with what’s going on with MAI Seed and our products. We primarily use our blog to communicate this type of information, so we expect to keep this type of email to a minimum. If you send us a request, we reserve the right to publish it in order to help us clarify or respond to your request or to help us support other users. MAI Seed takes all measures reasonably necessary to protect against the unauthorized access, use, alteration or destruction of potentially personally-identifying information.",
    "MAI Seed may collect statistics about the behavior of visitors to its website. MAI Seed may display this information publicly or provide it to others. However, we do not disclose your personal identifying information.",
    "Those who engage in transactions with MAI Seed – by purchasing MAI’s products, are asked to provide additional information. In each case, MAI Seed collects such information only insofar as is necessary or appropriate to fulfill the purpose of the visitor’s interaction with MAI Seed. We do not share personally identifying information to others. And it may prevent them from engaging in certain website related activities.",
    "We do not accept return of sold product. If once it sold, you cannot refund it. After pay advance if you want to cancel the order, we will refund your money. Otherwise no refund and return policy. If you have any other questions or concerns about the product, please contact with us anytime.",
    "Although most changes are likely to be minor, MAI Seed may change its Privacy Policy from time to time, and in MAI’s sole discretion. We encourage visitors to frequently check this page for any changes. Your continued use of this site after any change in this Privacy Policy will constitute your acceptance of such change."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('MAI SEED'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 8.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text(
                    "Policy",
                    style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w800, fontSize: 32.0),
                  )
              )
          ),
          Expanded(child: Padding(
            padding: EdgeInsets.all(12),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: terms.length,
              // prototypeItem: ListTile(
              //   title: Text(terms.first),
              // ),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${index + 1}  ${terms[index]}'),
                );
              },
            ),
          ))
        ],
      ),
      floatingActionButton: HomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

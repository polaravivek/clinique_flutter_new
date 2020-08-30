import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    home: SafeArea(
      child: Scaffold(
        body: Clinique(),
      ),
    ),
  ));
}

class Clinique extends StatefulWidget {
  @override
  _CliniqueState createState() => _CliniqueState();
}

class _CliniqueState extends State<Clinique> {
  var sizeWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          child: Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.15),
          ),
        ),
        Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: sizeWidth = (MediaQuery.of(context).size.height * 0.30),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'Clinique',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Card(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.001),
                    height: MediaQuery.of(context).size.height - sizeWidth - 33,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Drawtabbar(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Drawtabbar extends StatefulWidget {
  @override
  _DrawtabbarState createState() => _DrawtabbarState();
}

class _DrawtabbarState extends State<Drawtabbar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Text(
        'LOGIN',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
        ),
      ),
    ),
    Tab(
      child: Text(
        'SIGN UP',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 1.0,
      child: Column(
        children: <Widget>[
          TabBar(
            unselectedLabelColor: Colors.redAccent,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.red,
            ),
            controller: _tabController,
            tabs: myTabs,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[Loginpage(), SignUpPage(context)],
            ),
          )
        ],
      ),
    );
  }
}

class Loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              decoration: kTextFeildInputDecoration.copyWith(
                  hintText: 'Enter email address'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: kTextFeildInputDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
              elevation: 5.0,
              child: MaterialButton(
                onPressed: () {},
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  'LOG IN',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  final BuildContext context;

  const SignUpPage(this.context);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              decoration: kTextFeildInputDecoration.copyWith(
                  hintText: 'Enter email address'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: kTextFeildInputDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: kTextFeildInputDecoration.copyWith(
                  hintText: 'Enter your name'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: kTextFeildInputDecoration.copyWith(
                  hintText: 'Enter your mobile no.'),
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
              elevation: 5.0,
              child: MaterialButton(
                onPressed: () {},
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const kTextFeildInputDecoration = InputDecoration(
  hintText: 'Enter a Value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

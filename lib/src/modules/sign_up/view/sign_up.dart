import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_management_system/src/extensions/extensions.dart';
import 'package:order_management_system/src/models/user_models.dart';
import 'package:order_management_system/src/modules/sign_up/provider/fucntions.dart';
import 'package:order_management_system/src/modules/sign_up/provider/providers.dart';
import 'package:order_management_system/src/routing/app_route.dart';
import 'package:order_management_system/src/utils/app_colors.dart';

import '../../../components/logo_ekopii.dart';
import '../../../constants/app_sizes.dart';
import '../../../provider/providers.dart';
import '../../../utils/font_style.dart';
import '../../../utils/key.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  /*List<UsersData> totalUser = [];
  final user = FirebaseAuth.instance.currentUser;*/

  @override
  void initState() {
    /*FirebaseFirestore.instance
        .collection('orders')
        .where('user_id', isEqualTo: user!.uid)
        .snapshots()
        .listen((event) {
      mapRecords(event);
    });*/

   // fetchData();

    // TODO: implement initState
    super.initState();
  }

/*  fetchData() async {
    var records = await FirebaseFirestore.instance
        .collection('user_info')
        .where('user_id', isEqualTo: user!.uid)
        .get();
    mapRecords(records);
  }*/

  bool _isloading =false;

  void mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var list = records.docs
        .map(
          (data) => UsersData(
            email: data['email'],
            mobileNumber: data['mobile_number'],
            name: data['name'],
            ownerDesignation: data['owner_designation'],
            ownerName: data['owner_name'],
            password: data['password'],
            userId: data['user_id'],
          ),
        )
        .toList();

    setState(() {
     // totalUser = list;
    });
  }

  deleteItem(String id) {
    FirebaseFirestore.instance.collection('user_info').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    final passwordVisible = ref.watch(passwordProvider);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/back.png")),
        title: Text(
          'Registered',
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: appbackGroundgradent),
        ),
      ),
      body:_isloading==false? Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: appbackGroundgradent),
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: formKeySignup,
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Text(
                  'Full Name',
                  style: kTextStylePoppinsTitel,
                ),
                gapH16,
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty == true) {
                      return 'please enter name';
                    }
                    return null;
                  },
                  controller: ref.watch(
                    textControllerProvider('signup_name'),
                  ),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.inputBorderColor,
                          width: 0.5,
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.abc),
                      hintText: 'Enter your full Name',
                      labelText: 'Name'),
                ),
                gapH20,
                Text(
                  'Email',
                  style: kTextStylePoppinsTitel,
                ),
                gapH16,
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmail != true) {
                      return 'please enter valid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.inputBorderColor,
                          width: 0.5,
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter your Email',
                      prefixIcon: Icon(Icons.abc),
                      labelText: 'Email'),
                  controller: ref.watch(textControllerProvider('signup_email'),),
                ),
                gapH20,
                Text(
                  'Password',
                  style: kTextStylePoppinsTitel,
                ),
                gapH16,
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.length < 8) {
                      return 'password must be 8 character or more';
                    }

                    return null;
                  },
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.inputBorderColor,
                        width: 0.5,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        ref
                            .read(passwordProvider.notifier)
                            .visible(!passwordVisible);
                      },
                    ),
                    hintText: 'Enter your Password',
                    prefixIcon: const Icon(Icons.password),
                    labelText: 'Password',
                  ),
                  controller: ref.watch(textControllerProvider('signup_password'),),
                ),
                gapH20,
                Text(
                  'Mobile Number',
                  style: kTextStylePoppinsTitel,
                ),
                gapH16,
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty == true) {
                      return 'please enter Mobile number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller:
                      ref.watch(textControllerProvider('signup_mobile')),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.inputBorderColor,
                        width: 0.5,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter your Mobile Number',
                    labelText: 'Mobile Number',
                  ),
                ),
                gapH16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      activeColor: Colors.orange,
                      value: ref.watch(checkboxProvider),
                      onChanged: (value) {
                        ref.read(checkboxProvider.notifier).changeValue(value!);
                      },
                    ),
                    const Text('Are you a owner of company?')
                  ],
                ),
                gapH8,
                Visibility(
                  visible: ref.watch(checkboxProvider),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Company Name',
                            style: kTextStylePoppinsTitel,
                          ),
                        ],
                      ),
                      gapH16,
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty == true) {
                            return 'please enter Owner name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        controller: ref
                            .watch(textControllerProvider('signup_ownerName')),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.inputBorderColor,
                              width: 0.5,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.abc),
                          hintText: 'Owner Name',
                          labelText: 'Owner Name',
                        ),
                      ),
                      gapH20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Designation',
                            style: kTextStylePoppinsTitel,
                          ),
                        ],
                      ),
                      gapH16,
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty == true) {
                            return 'please enter Designation';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        controller: ref.watch(
                            textControllerProvider('signup_designation')),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.inputBorderColor,
                              width: 0.5,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.abc),
                          hintText: 'Designation',
                          labelText: 'Designation',
                        ),
                      ),
                    ],
                  ),
                ),
                gapH48,
                InkWell(
                  onTap: () {
                    setState(() {
                      _isloading=true;
                    });
                    signUptoFirebase(
                      ref.watch(textControllerProvider('signup_email'),),
                      ref.watch(textControllerProvider('signup_password'),),
                      context,
                      ref).then((value) async {
                     var data =  UsersData(
                        email: ref
                            .watch(textControllerProvider('signup_email'))
                            .text,
                        mobileNumber: ref
                            .watch(textControllerProvider('signup_mobile'))
                            .text,
                        name: ref
                            .watch(textControllerProvider('signup_name'))
                            .text,
                        ownerDesignation: ref
                            .watch(textControllerProvider('signup_designation'))
                            .text,
                        ownerName: ref
                            .watch(textControllerProvider('signup_ownerName'))
                            .text,
                        password: ref
                            .watch(textControllerProvider('signup_password'))
                            .text,
                        userId: value?.user?.uid,
                      );
                      await FirebaseFirestore.instance.collection('user_info').doc("${data.userId}").set(data.toJson()).then((value) {
                        setState(() {
                          _isloading=false;
                        });
                        context.pushReplacementNamed(AppRoute.home.name);
                      });
                    });

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: kGradientColorOrange,
                    ),
                    child: Center(
                        child: Text(
                      "Registred",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
                gapH48,
              ],
            ),
          ),
        ),
      ):Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: appbackGroundgradent),

          child: Center(child: CircularProgressIndicator())),
    );
  }
}

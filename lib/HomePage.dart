import 'dart:async';
import 'dart:io';
import 'package:celebrare/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void closeAppUsingSystemPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  // void closeAppUsingExit() {
  //   exit(0);
  // }

  Future uploadimage() async {
    // await _picker.pickImage(source: ImageSource.gallery);
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxWidth: 800,
        maxHeight: 600);

    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: '',
              toolbarColor: const Color.fromARGB(255, 0, 0, 0),
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          WebUiSettings(
            context: context,
          ),
        ],
        compressQuality: 90,
        compressFormat: ImageCompressFormat.jpg);
    showOptions(File(croppedFile!.path));
   
  }

  Future showOptions(File image) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Container(
            height:430,
            width: double.infinity,
            padding: EdgeInsets.all(2.0),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close_outlined,
                        size: 27,
                      )),
                ),
                Text(
                  "Uploaded Image",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 135, 132, 132),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Consumer<imageModel>(
                  builder: (context, imageModel, child) {
                    return Container(
                        // height: 220,
                        // width: 240,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(image),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(1),
                            BlendMode.srcOut,
                          ),
                          child: imageModel.imageUrl != ''
                              ? Image.asset(
                                  imageModel.imageUrl,
                                  width: 200,
                                  height: 230,
                                  fit: BoxFit.fill,
                                )
                              : Image.file(
                                  image,
                                  width: 200,
                                  height: 230,
                                  fit: BoxFit.fill,
                                ),
                        ));
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Color.fromARGB(83, 0, 0, 0),
                            width: 0.7,
                            style: BorderStyle.solid,
                            strokeAlign: BorderSide.strokeAlignInside,
                          )),
                      child: TextButton(
                        onPressed: () {
                          // HandleImage('');
                          Provider.of<imageModel>(context, listen: false)
                              .setImageurl('');
                        },
                        child: Text(
                          "Original",
                          style: TextStyle(
                              color: Color.fromARGB(255, 135, 132, 132),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Color.fromARGB(83, 0, 0, 0),
                            width: 0.7,
                            style: BorderStyle.solid,
                            strokeAlign: BorderSide.strokeAlignInside,
                          )),
                      child: TextButton(
                        onPressed: () {
                          Provider.of<imageModel>(context, listen: false)
                              .setImageurl('asset/user_image_frame_1.png');
                        },
                        child: Image.asset(
                          'asset/user_image_frame_1.png',
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Color.fromARGB(83, 0, 0, 0),
                            width: 0.7,
                            style: BorderStyle.solid,
                            strokeAlign: BorderSide.strokeAlignInside,
                          )),
                      child: TextButton(
                        onPressed: () {
                          Provider.of<imageModel>(context, listen: false)
                              .setImageurl('asset/user_image_frame_2.png');
                        },
                        child: Image.asset(
                          'asset/user_image_frame_2.png',
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Color.fromARGB(83, 0, 0, 0),
                            width: 0.7,
                            style: BorderStyle.solid,
                            strokeAlign: BorderSide.strokeAlignInside,
                          )),
                      child: TextButton(
                        onPressed: () {
                          Provider.of<imageModel>(context, listen: false)
                              .setImageurl('asset/user_image_frame_3.png');
                        },
                        child: Image.asset(
                          'asset/user_image_frame_3.png',
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Color.fromARGB(83, 0, 0, 0),
                            width: 0.7,
                            style: BorderStyle.solid,
                            strokeAlign: BorderSide.strokeAlignInside,
                          )),
                      child: TextButton(
                        onPressed: () {
                          Provider.of<imageModel>(context, listen: false)
                              .setImageurl('asset/user_image_frame_4.png');
                        },
                        child: Image.asset(
                          'asset/user_image_frame_4.png',
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 320,
                  height: 45,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                          EdgeInsets.only(left: 20, right: 20)),
                      backgroundColor: WidgetStateProperty.all(
                          Color.fromARGB(245, 8, 129, 120)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      )),
                    ),
                    onPressed: () {
                      Provider.of<imageModel>(context, listen: false)
                          .finalImageurl(
                              Provider.of<imageModel>(context, listen: false)
                                  .imageUrl);
                      Provider.of<imageModel>(context, listen: false)
                          .setImage(image);
                          Provider.of<imageModel>(context, listen: false)
                          .setImageurl('');
                      // print(_image);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Use this image",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
          );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(245, 8, 129, 120),
            statusBarIconBrightness: Brightness.light,
          ),
          title: const Text(
            'Add Image/Icon',
            style: TextStyle(
              color: Color.fromARGB(255, 135, 132, 132),
              fontSize: 18.0,
            ),
          ),
          shadowColor: Color.fromARGB(245, 14, 150, 98),
          centerTitle: true,
          toolbarHeight: 57,
          toolbarOpacity: 1,
          elevation: 4.0,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 25),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 135, 132, 132),
              size: 30,
              weight: 50.0,
            ),
            onPressed: () {
              // closeAppUsingExit();
              closeAppUsingSystemPop();
            },
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        body: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(children: [
              Container(
                width: double.infinity,
                height: 100,
                margin: EdgeInsets.all(9),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Color.fromARGB(83, 0, 0, 0),
                      width: 0.7,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignInside,
                    )),
                alignment: Alignment.center,
                // padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Upload Image',
                      style: TextStyle(
                        color: Color.fromARGB(255, 135, 132, 132),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextButton(
                        style: ButtonStyle(
                          padding: WidgetStatePropertyAll(
                              EdgeInsets.only(left: 20, right: 20)),
                          backgroundColor: WidgetStateProperty.all(
                              Color.fromARGB(245, 8, 129, 120)),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                        ),
                        onPressed: () {
                          uploadimage();
                        },
                        child: Text(
                          'Choose from Device',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ))
                  ],
                ),
              ),
              Consumer<imageModel>(builder: (context, imageModel, child) {
                return Container(
                  child: imageModel.image != null
                      ? Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              image: DecorationImage(
                                  image: FileImage(imageModel.image!),
                                  fit: BoxFit.cover)),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(1),
                              BlendMode.srcOut,
                            ),
                            child: imageModel.finalimageurl != ''
                                ? Image.asset(
                                    imageModel.finalimageurl,
                                    // width: 400,
                                    // height: 400,
                                    fit: BoxFit.fill,
                                  )
                                : Image.file(
                                    imageModel.image!,
                                    // width: 400,
                                    // height: 400,
                                    fit: BoxFit.fill,
                                  ),
                          ))
                      : Text(''),
                );
              }),
            ])));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fb_insta_clone/app/core/mixins/form_input_mixin.dart';
import 'package:flutter_fb_insta_clone/app/core/theme/app_colors.dart';
import 'package:flutter_fb_insta_clone/app/modules/add_post/controllers/add_post_controller.dart';
import 'package:flutter_fb_insta_clone/app/services/auth_service.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPostView extends GetView<AddPostController> with FormInputMixin {
  const AddPostView({Key? key}) : super(key: key);

  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  controller.selectFromCamera();
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  controller.selectFromGallery();
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.file.value == null
        ? Center(
            child: IconButton(
              icon: const Icon(
                Icons.upload,
                size: 30,
              ),
              onPressed: () => _selectImage(context),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: controller.clearImage,
              ),
              title: const Text(
                'Post to',
              ),
              centerTitle: false,
              actions: <Widget>[
                TextButton(
                  onPressed: controller.postImage,
                  child: const Text(
                    "Post",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                )
              ],
            ),
            // POST FORM
            body: FormBuilder(
              key: controller.formKey,
              child: Column(
                children: <Widget>[
                  controller.isLoading.value
                      ? const LinearProgressIndicator()
                      : const Padding(padding: EdgeInsets.only(top: 0.0)),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (AuthService.to.user.value?.isPhotoUrl)
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            AuthService.to.user.value!.photoUrl!,
                          ),
                        )
                      else
                        Container(),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: buildDescriptionField()),
                      SizedBox(
                        height: 45.0,
                        width: 45.0,
                        child: AspectRatio(
                          aspectRatio: 487 / 451,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.fill,
                              alignment: FractionalOffset.topCenter,
                              image: MemoryImage(controller.file.value!),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          ));
  }
}

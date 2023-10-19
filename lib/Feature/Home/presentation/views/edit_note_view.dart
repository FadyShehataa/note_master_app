import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_master_app/Core/utils/my_colors.dart';
import 'package:note_master_app/Feature/Home/data/models/note_model.dart';
import 'package:note_master_app/Feature/Home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:note_master_app/Feature/Home/presentation/views/widgets/add_note_body.dart';
import 'package:note_master_app/Feature/Home/presentation/views/widgets/edit_note_footer.dart';


class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: noteModel.title);
    final TextEditingController descriptionController =
        TextEditingController(text: noteModel.description);

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColors.myOrange,
          appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: AddNoteBody(
                        titleController: titleController,
                        descriptionController: descriptionController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    EditNoteFooter(
                      titleController: titleController,
                      descriptionController: descriptionController,
                      formKey: formKey,
                      noteModel: noteModel,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../Core/utils/my_colors.dart';
import '../manager/add_note_cubit/add_note_cubit.dart';
import '../manager/get_notes_cubit/get_notes_cubit.dart';
import 'widgets/add_note_body.dart';
import 'widgets/add_note_footer.dart';

import '../../../../Core/utils/functions/custom_show_snake_bar.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    // late final Color color;

    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          BlocProvider.of<GetNotesCubit>(context).fetchAllNotes();
          Navigator.pop(context);
        } else if (state is AddNoteFailure) {
          customShowSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator:
              const CircularProgressIndicator(color: MyColors.myBlack),
          inAsyncCall: state is AddNoteLoading ? true : false,
          child: Scaffold(
            backgroundColor: BlocProvider.of<AddNoteCubit>(context).colorNote,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: MyColors.myWhite),
            ),
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
                      AddNoteFooter(
                        titleController: titleController,
                        descriptionController: descriptionController,
                        formKey: formKey,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

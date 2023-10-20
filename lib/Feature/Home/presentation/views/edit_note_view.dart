import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_master_app/Feature/Home/data/models/note_model.dart';
import 'package:note_master_app/Feature/Home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:note_master_app/Feature/Home/presentation/views/widgets/add_note_body.dart';
import 'package:note_master_app/Feature/Home/presentation/views/widgets/edit_note_footer.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  late final TextEditingController titleController;

  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.noteModel.title);
    descriptionController =
        TextEditingController(text: widget.noteModel.description);

    BlocProvider.of<AddNoteCubit>(context).editColor =
        Color(widget.noteModel.color);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: BlocProvider.of<AddNoteCubit>(context).editColor,
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
                      noteModel: widget.noteModel,
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

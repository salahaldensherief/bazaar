import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../auth/presentation/views/widgets/custom_text_bottom.dart';
import '../../cubits/accountDetails/account_detailes_cubit.dart';
import 'edit_info_field.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AccountDetailesCubit>().fetchUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final kHorizontal = MediaQuery.of(context).size.width;
    final kVertical = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(showBack: true, title: 'Profile Details'),
      body: BlocConsumer<AccountDetailesCubit, AccountDetailesState>(
        listener: (context, state) {
          if (state is AccountDetailesError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AccountDetailesSuccess) {}
        },
        builder: (context, state) {
          if (state is AccountDetailesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AccountDetailesSuccess) {
            nameController.text = state.user.username ?? '';
            emailController.text = state.user.email ?? '';

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kHorizontal / 15,
                vertical: kVertical / 10,
              ),
              child: Column(
                children: [
                  EditInfoField(
                    title: 'Username',
                    hintText: '',
                    textInputType: TextInputType.name,
                    controller: nameController,
                  ),
                  const SizedBox(height: 30),
                  EditInfoField(
                    title: 'Email',
                    hintText: '',
                    textInputType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  const Spacer(),
                  CustomTextBottom(
                    text: 'Save',
                    onPressed: () {
                      context.read<AccountDetailesCubit>().updateUserData(
                        name: nameController.text,
                        email: emailController.text,
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

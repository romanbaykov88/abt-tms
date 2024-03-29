import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:tms/logic/blocs/authentication/google_auth_cubit.dart';
import 'package:tms/presentation/screens/document/document_screen.dart';
import 'package:tms/presentation/screens/document/document_arguments.dart';
import 'package:tms/logic/blocs/documents_list/documents_list_cubit.dart';

class DocumentList extends StatefulWidget {
  const DocumentList({super.key});

  @override
  State<DocumentList> createState() => _DocumentListState();
}

class _DocumentListState extends State<DocumentList> {
  Map<String, String>? headers;

  void updateHeaders(GoogleAuthState state) {
    setState(() {
      headers = state.when((account, client, headers, sheetsApi) => headers,
          initial: (client) => null, loading: (client) => null);
    });
  }

  @override
  Widget build(BuildContext context) {
    updateHeaders(BlocProvider.of<GoogleAuthCubit>(context).state);
    return BlocListener<GoogleAuthCubit, GoogleAuthState>(
      listener: (context, state) {
        updateHeaders(state);
      },
      child: BlocBuilder<DocumentsListCubit, DocumentsListState>(
        builder: (context, state) {
          return state.when((FileList fileList) {
            final files = fileList.files;
            if (files != null) {
              return GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: files.map((file) {
                  return Ink(
                    decoration: const BoxDecoration(
                      color: Color(0x10000000),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      onTap: () {
                        Navigator.of(context).pushNamed(DocumentScreen.routeName, arguments: DocumentArguments(file: file));
                      },
                      child: GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: CachedNetworkImage(
                                  imageUrl: file.thumbnailLink!,
                                  cacheKey: "${file.id}",
                                  httpHeaders: headers,
                                  imageBuilder: (context, imageProvider) =>
                                      Image(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                  placeholder: (context, url) =>
                                      SvgPicture.asset(
                                    "assets/icons/sheet.svg",
                                    fit: BoxFit.contain,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      SvgPicture.asset(
                                    "assets/icons/sheet.svg",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                                child: Center(
                                  child: Text(
                                    "${file.name}",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }
            return const Text("no files"); //todo: change;
          },
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: () => const Center(child: Icon(Icons.error)));
        },
      ),
    );
  }
}

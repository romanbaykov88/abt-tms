import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:tms/logic/blocs/authentication/google_auth_cubit.dart';
import 'package:tms/logic/blocs/sheets_list/sheets_list_cubit.dart';

class SheetList extends StatefulWidget {
  const SheetList({super.key});

  @override
  State<SheetList> createState() => _SheetListState();
}

class _SheetListState extends State<SheetList> {
  Map<String, String>? headers;

  void updateHeaders(GoogleAuthState state) {
    setState(() {
      headers = state.when((account, client, headers) => headers,
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
      child: BlocBuilder<SheetsListCubit, SheetsListState>(
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
                  return InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    splashColor: Colors.blue,
                    onTap: () {
                      // todo: go to details screen
                    },
                    child: GestureDetector(
                      child: Card(
                        elevation: 2,
                        color: Colors.white70,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                          child: Column(
                            children: [
                              Expanded(
                                child: CachedNetworkImage(
                                  imageUrl: file.thumbnailLink!,
                                  cacheKey: "${file.id}1",
                                  httpHeaders: headers,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: const Offset(0,
                                                    0), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Image(image: imageProvider)),
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Expanded(
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
            return const Text("no files");
          },
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: () => const Center(child: Icon(Icons.error)));
        },
      ),
    );
  }
}

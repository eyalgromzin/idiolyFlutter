import 'dart:io' as io;
import 'dart:async';
import 'dart:math';

import 'package:epubx/epubx.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_time/services/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:file_picker/file_picker.dart';

class BookReader extends StatefulWidget {
  const BookReader({Key? key}) : super(key: key);

  @override
  _BookReaderState createState() => _BookReaderState();
}

class _BookReaderState extends State<BookReader> {

  String time = 'loading...';

  Map data = <dynamic, dynamic>{};

  List<String> bookTextByChapters = [];

  @override
  void didChangeDependencies() async {
    var data2 = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;

    if(data2['bookPath'] != null){
      String bookPath = data2['bookPath'];

      print('book path : $bookPath');

      List<String> bookContent = await getBookContent(bookPath);

      setState(() { //without it still dissappears
        bookTextByChapters = bookContent;
      });
    }
    // args = ModalRoute.of(context).settings.argument
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('in book reader');

    var s = 4;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text(bookTextByChapters[20]),
        ]
      )
    );
  }

  Future<List<String>> getBookContent(String fullPath) async {
    //Get the epub into memory somehow
    var targetFile = io.File(fullPath);
    List<int> bytes = await targetFile.readAsBytes();


    // Opens a book and reads all of its content into memory
    EpubBook epubBook = await EpubReader.readBook(bytes);

    // COMMON PROPERTIES

    // Book's title
    String? title = epubBook.Title;

    // Book's authors (comma separated list)
    String? author = epubBook.Author;

    // Book's authors (list of authors names)
    List<String?>? authors = epubBook.AuthorList;

    // Book's cover image (null if there is no cover)
    var coverImage = epubBook.CoverImage;


    // CHAPTERS

    // Enumerating chapters
    epubBook.Chapters?.forEach((EpubChapter chapter) {
      // Title of chapter
      String? chapterTitle = chapter.Title;

      // HTML content of current chapter
      String? chapterHtmlContent = chapter.HtmlContent;

      // Nested chapters
      List<EpubChapter>? subChapters = chapter.SubChapters;
    });


    // CONTENT

    // Book's content (HTML files, stylesheets, images, fonts, etc.)
    EpubContent? bookContent = epubBook.Content;

    Map<String, EpubTextContentFile>? htmlFiles = bookContent?.Html;

    // Entire HTML content of the book
    List<String> bookParts = [];

    if(htmlFiles != null){
      for (var htmlFile in htmlFiles.values) {
        String? htmlContent = htmlFile.Content;

        if(htmlContent != null){
          String htmlStrippedText = Bidi.stripHtmlIfNeeded(htmlContent);
          print(htmlStrippedText.substring(0, min(200, htmlStrippedText.length - 1))); //returns instance of epub content
          bookParts.add(htmlStrippedText);
        }
      }
    }

    return bookParts;
  }
}

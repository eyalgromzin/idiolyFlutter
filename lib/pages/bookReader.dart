import 'dart:io' as io;
import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

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
  String wholeBookText = "";

  @override
  void didChangeDependencies() async {
    var data2 = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;

    if(data2['bookPath'] != null){
      String bookPath = data2['bookPath'];

      print('book path : $bookPath');

      List<String> bookContent = await getBookContent(bookPath);

      String bookContentString = bookContent.join(' ');

      setState(() { //without it still dissappears
        wholeBookText = bookContentString.substring(0, 600);
      });
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('in book reader');

    //works
    const String text1 = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        "    Why do we use it?"
        "    It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
        "    Where does it come from?"
        "    Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32."
        "    The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."
        "    Where can I get some?"
        "    There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";

    const String text2= 'asd';
    return const Scaffold(
      body: Center(
        child:  ExampleMultiPageText(bookText: text1),
      ),
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
          // print(htmlStrippedText.substring(0, math.min(200, htmlStrippedText.length - 1))); //returns instance of epub content
          bookParts.add(htmlStrippedText);
        }
      }
    }

    return bookParts;
  }
}

class MultiPageText extends StatefulWidget {
  /// The entire text that has to be distributed across one or
  /// more pages.
  final String fullText;

  /// The [TextStyle] that is applied to the [fullText].
  final TextStyle textStyle;

  /// The size of the entire widget.
  ///
  /// This size's height is the upper limit for the [PageTextContainer]'s that contains
  /// each page text. If the [PageNavigatorMenu] is included (i.e. if
  /// [usePageNavigation] is `true`), its height (50 pixel) will be deducted
  /// leaving the only remaining height for the [PageTextContainer].
  final Size size;

  /// The padding that will be applied to the [PageTextContainer].
  final EdgeInsets paddingTextBox;

  /// Whether the [PageNavigatorMenu] will be rendered below the [PageTextContainer].
  final bool usePageNavigation;

  /// The [PageTextContainer]'s decoration.
  final BoxDecoration? decoration;

  /// Creates a widget that distributes the provided text across as many pages as necessary.
  ///
  /// Besides the TextContainer that holds the text for the given page, the widget can also
  /// contain a PageNavigatorMenu for navigating between the different pages.
  const MultiPageText({
    Key? key,
    required this.fullText,
    required this.size,
    this.textStyle = const TextStyle(
      fontSize: 10,
      color: Colors.white,
    ),
    this.paddingTextBox = const EdgeInsets.all(
      10,
    ),
    this.usePageNavigation = true,
    this.decoration,
  }) : super(key: key);

  @override
  State<MultiPageText> createState() => _MultiPageTextState();
}

class _MultiPageTextState extends State<MultiPageText> {
  int _currentPageIndex = 0;
  final double _pageNavigatorHeight = 80;
  final int _upperLayoutRunsLimit = 20;
  late List<String> _pages;
  late Size _availableSize;

  @override
  void initState() {
    _pages = _getPageTexts();
    super.initState();
  }

  List<String> _getPageTexts() {
    List<String> pages = <String>[];
    String remainingText = widget.fullText;
    _availableSize = _calculateAvailableSize(
      size: widget.size,
      padding: widget.paddingTextBox,
      usePageNavigation: widget.usePageNavigation,
    );
    double widthFactor = 0.5;
    int retries = 0;
    int pageCharacterLimit = _estimatePageCharacterLimit(
      size: _availableSize,
      textStyle: widget.textStyle,
      widthFactor: widthFactor,
    );
    while (remainingText.isNotEmpty) {
      final String pageTextEstimate = _getPageTextEstimate(
        text: remainingText,
        pageCharacterLimit: pageCharacterLimit,
      );
      final PageProperties pageProperties = _getPageText(
        text: pageTextEstimate,
        textStyle: widget.textStyle,
        size: _availableSize,
      );
      if (_shouldOptimizeEstimates(pageProperties.layoutRuns)) {
        // Optimize widthFactor for better pageTextEstimates
        widthFactor = _updateWidthFactor(
          widthFactor: widthFactor,
          layoutRuns: pageProperties.layoutRuns,
          upperLayoutRunsLimit: _upperLayoutRunsLimit,
        );
        // Update pageCharacterLimit
        pageCharacterLimit = _estimatePageCharacterLimit(
          size: _availableSize,
          textStyle: widget.textStyle,
          widthFactor: widthFactor,
        );
      }
      if (_performRetry(pageProperties.layoutRuns, retries)) {
        retries++;
        continue;
      }
      pages.add(pageProperties.text);
      remainingText =
          remainingText.substring(pageProperties.text.length).trimLeft();
      retries = 0;
    }
    return pages;
  }

  /// Calculates the available space for the [ui.ParagraphBuilder] (i.e. its width constraint).
  ///
  /// That means subtracting any padding of the enclosing [Container] as well as removing the
  /// height of the page navigation (only if [usePageNavigation] is `true`).
  Size _calculateAvailableSize({
    required Size size,
    required EdgeInsets padding,
    required bool usePageNavigation,
  }) {
    double availableHeight = size.height -
        (widget.paddingTextBox.top + widget.paddingTextBox.bottom);
    if (usePageNavigation) {
      availableHeight = availableHeight - _pageNavigatorHeight;
    }
    final double availableWidth =
        size.width - (widget.paddingTextBox.right + widget.paddingTextBox.left);
    return Size(availableWidth, availableHeight);
  }

  /// Updates the [widthFactor] based on the number of actual [layoutRuns].
  ///
  /// If the [upperLayoutRunsLimit] was exceeded, we want to tighten our character estimate
  /// (hence increase the [widthFactor] by `0.05`). Otherwise (i.e. if [layoutRuns] = `1`) the
  /// constraint should be loosened (decrease the [widthFactor] by `0.05`).
  double _updateWidthFactor({
    required double widthFactor,
    required int layoutRuns,
    required int upperLayoutRunsLimit,
  }) {
    final double newWidthFactor = layoutRuns >= upperLayoutRunsLimit
        ? widthFactor + 0.05
        : widthFactor - 0.05;
    return newWidthFactor;
  }

  /// (Over)Estimates the character limit for a given page.
  ///
  /// The [widthFactor] is automatically chosen and adjusted by the parent function
  /// so that the resulting maximum character will be slightly overestimated.
  int _estimatePageCharacterLimit({
    required Size size,
    required TextStyle textStyle,
    required double widthFactor,
  }) {
    final characterHeight = textStyle.fontSize!;
    final characterWidth = characterHeight * widthFactor;
    return ((size.height * size.width) / (characterHeight * characterWidth))
        .ceil();
  }

  /// Retrieves the part of the [text] that fits within the [pageCharacterLimit] starting
  /// from the beginning of the string.
  String _getPageTextEstimate({
    required String text,
    required int pageCharacterLimit,
  }) {
    final initialPageTextEstimate =
    text.substring(0, math.min(pageCharacterLimit + 1, text.length));
    final substringIndex =
    initialPageTextEstimate.lastIndexOf(RegExp(r"\s+\b|\b\s+|[\.?!]"));
    final pageTextEstimate =
    text.substring(0, math.min(substringIndex + 1, text.length));
    return pageTextEstimate;
  }

  /// Determines the final text for the given page and returns the respective
  /// [PageProperties] with the number of necessary `layoutRuns` for optimization
  /// and the [text] itself.
  PageProperties _getPageText({
    required String text,
    required TextStyle textStyle,
    required Size size,
  }) {
    double paragraphHeight = 10000;
    String currentText = text;
    int layoutRuns = 0;
    final RegExp regExp = RegExp(r"\S+[\W]*$");
    while (paragraphHeight > size.height) {
      final paragraph = ParagraphPainter.layoutParagraph(
          text: currentText, textStyle: textStyle, size: size);
      paragraphHeight = paragraph.height;
      if (paragraphHeight > size.height) {
        currentText = currentText.replaceFirst(regExp, '');
      }
      layoutRuns = layoutRuns + 1;
    }

    return PageProperties(currentText, layoutRuns);
  }

  bool _performRetry(int layoutRuns, int retries) {
    return layoutRuns == 1 && retries <= 0;
  }

  bool _shouldOptimizeEstimates(int layoutRuns) {
    return layoutRuns > _upperLayoutRunsLimit || layoutRuns == 1;
  }

  void _updatePageIndex(PageUpdateOperation pageUpdateOperation) {
    switch (pageUpdateOperation) {
      case PageUpdateOperation.first:
        setState(() {
          _currentPageIndex = 0;
        });
        break;
      case PageUpdateOperation.previous:
        setState(() {
          _currentPageIndex--;
        });
        break;
      case PageUpdateOperation.next:
        setState(() {
          _currentPageIndex++;
        });
        break;
      case PageUpdateOperation.last:
        setState(() {
          _currentPageIndex = _pages.length - 1;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageTextContainer = PageTextContainer(
      text: _pages[_currentPageIndex],
      textStyle: widget.textStyle,
      padding: widget.paddingTextBox,
      size: _availableSize,
      decoration: widget.decoration,
    );
    return widget.usePageNavigation
        ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        pageTextContainer,
        PageNavigatorMenu(
          size: Size(widget.size.width, _pageNavigatorHeight),
          currentPageIndex: _currentPageIndex,
          pageCount: _pages.length,
          updatePageIndex: _updatePageIndex,
        ),
      ],
    )
        : pageTextContainer;
  }
}

class PageTextContainer extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final EdgeInsets padding;
  final Size size;
  final BoxDecoration? decoration;

  const PageTextContainer({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.padding,
    required this.size,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: decoration,
      child: CustomPaint(
        painter: ParagraphPainter(
          pageText: text,
          textStyle: textStyle,
        ),
        child: SizedBox(
          height: size.height,
          width: size.width,
        ),
      ),
    );
  }
}

class PageNavigatorMenu extends StatelessWidget {
  final Size size;
  final int currentPageIndex;
  final int pageCount;
  final void Function(PageUpdateOperation) updatePageIndex;

  const PageNavigatorMenu({
    Key? key,
    required this.size,
    required this.currentPageIndex,
    required this.pageCount,
    required this.updatePageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.first_page,
            ),
            onPressed: currentPageIndex > 0
                ? () => updatePageIndex(
              PageUpdateOperation.first,
            )
                : null,
          ),
          IconButton(
            icon: const Icon(
              Icons.navigate_before,
            ),
            onPressed: currentPageIndex > 0
                ? () => updatePageIndex(
              PageUpdateOperation.previous,
            )
                : null,
          ),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Page ${currentPageIndex + 1}',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.navigate_next,
            ),
            onPressed: currentPageIndex < pageCount - 1
                ? () => updatePageIndex(
              PageUpdateOperation.next,
            )
                : null,
          ),
          IconButton(
            icon: const Icon(
              Icons.last_page,
            ),
            onPressed: currentPageIndex < pageCount - 1
                ? () => updatePageIndex(
              PageUpdateOperation.last,
            )
                : null,
          ),
        ],
      ),
    );
  }
}

class ParagraphPainter extends CustomPainter {
  final String pageText;
  final TextStyle textStyle;

  ParagraphPainter({
    required this.pageText,
    required this.textStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paragraph = layoutParagraph(
      text: pageText,
      textStyle: textStyle,
      size: size,
    );
    canvas.drawParagraph(paragraph, Offset.zero);
  }

  static ui.Paragraph layoutParagraph({
    required String text,
    required TextStyle textStyle,
    required Size size,
  }) {
    final ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        fontSize: textStyle.fontSize,
        fontFamily: textStyle.fontFamily,
        fontStyle: textStyle.fontStyle,
        fontWeight: textStyle.fontWeight,
        textAlign: TextAlign.left,
      ),
    )
      ..pushStyle(textStyle.getTextStyle())
      ..addText(text);
    final ui.Paragraph paragraph = paragraphBuilder.build()
      ..layout(
        ui.ParagraphConstraints(width: size.width),
      );
    return paragraph;
  }

  @override
  bool shouldRepaint(ParagraphPainter oldDelegate) =>
      oldDelegate.pageText != pageText || oldDelegate.textStyle != textStyle;
}

class PageProperties {
  final String text;
  final int layoutRuns;

  PageProperties(this.text, this.layoutRuns);

  @override
  String toString() {
    return '''PageProperties(
$text,
$layoutRuns
)''';
  }
}

enum PageUpdateOperation {
  first,
  previous,
  next,
  last,
}

// Call the widget
class ExampleMultiPageText extends StatefulWidget {
  final String bookText;

  const ExampleMultiPageText({Key? key, required this.bookText}) : super(key: key);

  @override
  State<ExampleMultiPageText> createState() => _ExampleMultiPageTextState();
}

class _ExampleMultiPageTextState extends State<ExampleMultiPageText> {

  // String bookText = 'asd asd asd ';

  @override
  Widget build(BuildContext context) {


    return Center(
      child: MultiPageText(
        textStyle: const TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1.0,
            color: Colors.black,
          ),
        ),
        usePageNavigation: true,
        fullText: widget.bookText,
        size: const Size(
          200,
          350,
        ),
      ),
    );
  }


}
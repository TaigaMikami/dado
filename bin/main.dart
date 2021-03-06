import 'dart:io';

import 'package:build_cli_annotations/build_cli_annotations.dart';
import 'package:dado/dado.dart';
import 'package:io/io.dart';
import 'package:io/ansi.dart';

part 'main.g.dart';

@CliOptions()
class Options {
  @CliOption(abbr: 'add', help: 'add task to list')
  String add;

  @CliOption(abbr: 'list', help: 'watch task list')
  bool list;

  @CliOption(abbr: 'done', help: 'done task')
  String done;

  @CliOption(abbr: 'undone', help: 'undone task')
  String undone;

  @CliOption(abbr: 'remove', help: 'remove task from list')
  String remove;

  @CliOption(abbr: 'clean', help: 'clean done tasks from list')
  bool clean;

 @CliOption(abbr: 'h', negatable: false, help: 'Prints usage information.')
  bool help;

  Options();
}

void main(List<String> args) {
 Options options;
 try {
   options = parseOptions(args);
 } on FormatException catch (e) {
    print(red.wrap(e.message));
    print('');
    _printUsage();
    exitCode = ExitCode.usage.code;
    return;
 }

 if (options.help) {
   _printUsage();
   return;
 } else if (options.add != null) {
   add(options.add);
 } else if (options.list) {
   list();
 } else if (options.done != null) {
   var number = int.parse(options.done);
   done(number);
 } else if (options.undone != null) {
   var number = int.parse(options.undone);
   undone(number);
 } else if (options.remove != null) {
   var number = int.parse(options.remove);
   remove(number);
 } else if (options.clean) {
   clean();
 }
}

void _printUsage() {
  print('Usage: dado.dar');
  print(_$parserForOptions.usage);
}

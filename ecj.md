ecj(1)                                                                                     General Commands Manual                                                                                     ecj(1)



NAME
       ecj - the eclipse JDT Batch Compiler

SYNOPSIS
       ecj [OPTION]... [SOURCEFILE]...  ...

DESCRIPTION
       ecj  is  the  batch compiler from Eclipse and is available as ecj.jar.  Since 3.3, this jar also contains the support for jsr199 (Compiler API) and the support for jsr269 (Annotation processing). In
       order to use the annotations processing support, a 1.6 VM is required.


OPTIONS SUMMARY
       Here is a summary of all the options, grouped by type.  Explanations are in the OPTIONS section.

       ClassPath Options

       -bootclasspath -cp|-classpath -extdirs -endorseddirs -sourcepath -d -encoding

       Compliance Options

       -target -1.3 -1.4 -1.5 -1.6 -1.7 -1.8 -source

       Warning Options

       -?:warn -help:warn -warn:... -nowarn -err:... -deprecation -properties

       Debug Options

       -g -preserveAllLocals -parameters

       Annotation Processing Options

       -Akey[=value] -proc:[only|none] -processor -processorpath -s -XprintProcessorInfo -XprintRounds -classNames

       Ignored Options (for compatibility with javac options)

       -J -X -O

       Advanced Options

       @<file> -maxProblems -log -Xemacs -proceedOnError -verbose -referenceInfo -progress -time -noExit -repeat -inlineJSR -enableJavaDoc -missingNullDefault

       Helping Options

       -? -help -v -version -showversion


OPTIONS
       ClassPath Options


       -bootclasspath <dir 1>;<dir 2>;...;<dir P>
              This is a list of directories or jar files used to bootstrap the class files used by the compiler. By default the libraries of the running VM are used. Entries are separated by  the  platform
              path  separator.  Each directory or file can specify access rules for types between '[' and ']'.  If no bootclasspath is specified, the compiler will infer it using the following system prop‐
              erties sun.boot.class.path, vm.boot.class.path or org.apache.harmony.boot.class.path in this order respectively


       -cp|-classpath <dir 1>;dir2;...<dir P>
              This is a list of directories or jar files used to compile the source files. The default value is the value of the property "java.class.path". Entries are separated by the platform path sepa‐
              rator.   Each directory or file can specify access rules for types between '[' and ']' (e.g. [-X] to forbid access to type X, [~X] to discourage access to type X, [+p/X:-p/*] to forbid access
              to all types in package p but allow access to p/X).  The compiler follows the Class-Path clauses of jar files' manifests recursively and appends each referenced jar file to  the  end  of  the
              classpath, provided it is not on the classpath yet.


       -extdirs <dir 1>;<dir 2>;...;<dir P>
              This is a list of directories used to specify the location of extension zip/jar files. Entries are separated by the platform path separator.


       -endorseddirs <dir 1>;<dir 2>;...;<dir P>
              This is a list of directories used to specify the location of endorsed zip/jar files. Entries are separated by the platform path separator.


       -sourcepath <dir 1>;<dir 2>;...;<dir P>
              This is a list of directories used to specify the source files. Entries are separated by the platform path separator.  Each directory can specify access rules for types between '[' and ']'.


       -d <dir 1>|none
              This is used to specify in which directory the generated .class files should be dumped. If it is omitted, no package directory structure is created.  If you want to generate no .class file at
              all, use -d none.


       -encoding <encoding name>
              Specify default encoding for all source files. Custom encoding can also be specified on a per file basis by suffixing each input source file/folder name with [<encoding  name>].  For  example
              X.java[UTF-8]  would  specify  the UTF-8 encoding for the compilation unit X.java located in the current user directory.  If multiple default source file encodings are specified, the last one
              will be used.

              For example: ... -encoding UTF-8 X.java[Cp1252] Y.java[UTF-16] Z.java ....
              All source files will be read using UTF-8 encoding (this includes Z.java). X.java will be read using Cp1252 encoding and Y.java will be read using UTF-16 encoding.

              ... -encoding UTF-8 -encoding UTF-16 ....
              All source files will be read using UTF-16 encoding. The -encoding option for UTF-8 is ignored.

              ... -encoding Cp1252 /foo/bar/X.java[UTF-16] /foo/bar[UTF-8] ....
              All source files will be read using Cp1252 encoding. X.java is the only file inside the /foo/bar directory to be read using the encoding UTF-16. All other files in  that  directory  will  use
              UTF-8 encoding.


       Compliance Options


       -target 1.1 to 1.8 (or 8, 8.0, etc.)
              This specifies the .class file target setting. The possible value are:
              1.1 (major version: 45 minor: 3)
              1.2 (major version: 46 minor: 0)
              1.3 (major version: 47 minor: 0)
              1.4 (major version: 48 minor: 0)
              1.5, 5 or 5.0 (major version: 49 minor: 0)
              1.6, 6 or 6.0 (major version: 50 minor: 0)
              1.7, 7 or 7.0 (major version: 51 minor: 0)
              1.8, 8 or 8.0 (major version: 52 minor: 0)

              Defaults are:
              1.1 in -1.3 mode
              1.2 in -1.4 mode
              1.5 in -1.5 mode
              1.6 in -1.6 mode
              1.7 in -1.7 mode
              1.8 in -1.8 mode clcd1.1 can be used to generate the StackMap attribute.


       -1.3   Set compliance level to 1.3. Implicit -source 1.3 -target 1.1.


       -1.4   Set compliance level to 1.4 (default). Implicit -source 1.3 -target 1.2.


       -1.5   Set compliance level to 1.5. Implicit -source 1.5 -target 1.5.


       -1.6   Set compliance level to 1.6. Implicit -source 1.6 -target 1.6.


       -1.7   Set compliance level to 1.7. Implicit -source 1.7 -target 1.7.


       -1.8   Set compliance level to 1.8. Implicit -source 1.8 -target 1.8.


       -source 1.1 to 1.8 (or 8, 8.0, etc.)
              This is used to specify the source level expected by the compiler.  The possible value are:
              1.3
              1.4
              1.5, 5 or 5.0
              1.6, 6 or 6.0
              1.7, 7 or 7.0
              1.8, 8 or 8.0

              Defaults are:
              1.3 in -1.3 mode
              1.3 in -1.4 mode
              1.5 in -1.5 mode
              1.6 in -1.6 mode
              1.7 in -1.7 mode
              1.8 in -1.8 mode
              In 1.4, assert is treated as a keyword. In 1.5 and 1.6, enum and assert are treated as keywords.


       Warning Options


       -?:warn -help:warn
              Display advanced warning options


       -warn:...
              Specify the set of enabled warnings.
              -warn:none                              disable all warnings
              -warn:<warning tokens separated by ,>   enable exactly the listed warnings
              -warn:+<warning tokens separated by ,>  enable additional warnings
              -warn:-<warning tokens separated by ,>  disable specific warnings

              Examples:

              warn:unusedLocal,deprecation
              enables only the given two warning options and disables all the other options

              warn:-unusedLocal,deprecation,+fallthrough
              disables unusedLocal and deprecation, enables fallthrough, and leaves the other warning options untouched

              The  first column below shows the default state for an option. A mark "+/-" indicates that an option covers several fine grained warning variants, some of which are enabled by default, others
              disabled. This means that specifying the given option with "+" will enable more warnings than the default, and specifying "-" disables some that are enabled by default.


              +/- allDeadCode dead code including trivial if (DEBUG) check

              +/- allDeprecation deprecation even inside deprecated code

               -  allJavadoc invalid or missing Javadoc

               -  allOver-ann all missing @Override annotations (superclass and superinterfaces)

               -  all-static-method all method can be declared as static warnings

               +  assertIdentifier occurrence of assert used as identifier

               -  boxing autoboxing conversion

               +  charConcat when a char array is used in a string concatenation without being converted explicitly to a string

               +  compareIdentical comparing identical expressions

               -  conditionAssign possible accidental boolean assignment

               +  constructorName method with constructor name

               +  deadCode dead code excluding trivial if (DEBUG) check

               -  dep-ann missing @Deprecated annotation

              +/- deprecation usage of deprecated type or member outside deprecated code

               +  discouraged use of types matching a discouraged access rule

               -  emptyBlock undocumented empty block

               +  enumIdentifier occurrence of enum used as identifier

               +  enumSwitch incomplete enum switch

               -  enumSwitchPedantic report missing enum switch cases even in the presence of a default case

               -  fallthrough possible fall-through case

               -  fieldHiding field hiding another variable

               +  finalBound type parameter with final bound

               +  finally finally block not completing normally

               +  forbidden use of types matching a forbidden access rule

               -  hashCode missing hashCode() method when overriding equals()

              +/- hiding macro for fieldHiding, localHiding, maskedCatchBlock, and typeHiding

               -  includeAssertNull raise null warnings for variables that got tainted in an assert expression

               -  indirectStatic indirect reference to static member

               -  inheritNullAnnot consider null annotations as being inherited from an overridden method to any overriding methods

               +  intfAnnotation annotation type used as super interface

               +  intfNonInherited interface non-inherited method compatibility

               -  intfRedundant find redundant superinterfaces

               -  invalidJavadoc macro to toggle the 'malformed Javadoc comments' option and all its sub-options listed below

               -  invalidJavadocTag report invalid Javadoc tags in Javadoc comments.

               -  invalidJavadocTagDep report invalid deprecated references in Javadoc tag arguments

               -  invalidJavadocTagNotVisible report invalid non-visible references in Javadoc tag arguments

               -  invalidJavadocVisibility(<visibility>) specify visibility modifier ("public", "protected" or "private") for malformed Javadoc tag warnings. Usage example: invalidJavadocVisibility(public)

               -  javadoc invalid Javadoc

               -  localHiding local variable hiding another variable

               +  maskedCatchBlock hidden catch block

               -  missingJavadocTags macro to toggle the 'missing Javadoc tags' option and all its sub-options listed below

               -  missingJavadocTagsMethod report missing Javadoc tags for a method's type parameters

               -  missingJavadocTagsOverriding report missing Javadoc tags in overriding methods

               -  missingJavadocTagsVisibility(<visibility>) specify visibility modifier ("public", "protected" or "private") for missing Javadoc tags warnings.  Usage  example:  missingJavadocTagsVisibil‐
              ity(public)

               -  missingJavadocComments macro to toggle the 'missing Javadoc comments' option and all its sub-options listed below

               -  missingJavadocCommentsOverriding report missing Javadoc comments in overriding methods

               -   missingJavadocCommentsVisibility(<visibility>)  specify  visibility modifier ("public", "protected" or "private") for missing Javadoc comments warnings. Usage example: missingJavadocCom‐
              mentsVisibility(public)

               -  nls non-nls string literals (lacking of tags //$NON-NLS-<n>)

               +  noEffectAssign assignment with no effect

               +  nonnullNotRepeated nonnull parameter annotation from overridden method is not repeated in an overriding method. Is effective only with the nullAnnot option enabled.

              +/- null potential missing or redundant null check

               -  nullAnnot enable annotation based null analysis.  If desired, the annotation types to be interpreted by the compiler can be  specified  by  appending  (nullable|nonnull|nonnullbydefault),
              where each annotation type is specified using its fully qualified name.  Usage example: nullAnnot(p.Nullable|p.NonNull|p.NonNullByDefault)

              Enabling this option enables all null-annotation related sub-options. These can be individually controlled using options listed below

               -  nullAnnotConflict report conflicts between null annotation specified and nullness inferred. Is effective only with the nullAnnot option enabled.

               -  nullAnnotRedundant report redundant specification of null annotation. Is effective only with the nullAnnot option enabled.

               -  nullDereference missing null check

               -  nullUncheckedConversion report unchecked conversion from unannotated type to @NonNull type. Is effective only with the nullAnnot option enabled.

               -  over-ann missing @Override annotation (superclass only)

               -  paramAssign assignment to a parameter

               +  pkgDefaultMethod attempt to override package-default method

               +  raw usage a of raw type (instead of a parameterized type)

              +/- resource (potentially) unsafe usage of resource of type Closeable

               -  semicolon unnecessary semicolon or empty statement

               +  serial missing serialVersionUID

               -  specialParamHiding constructor or setter parameter hiding another field

              +/- static-access macro for indirectStatic and staticReceiver

               -  static-method an instance method that could be as a static method

               +  staticReceiver if a non static receiver is used to get a static field or call a static method

               -  super overriding a method without making a super invocation

               +  suppress enable @SuppressWarnings

               -  switchDefault switch statement lacking a default case

               -  syncOverride missing synchronized in synchronized method override

               -  syntacticAnalysis perform syntax-based null analysis for fields

               -  syntheticAccess when performing synthetic access for innerclass

               -  tasks enable support for tasks tags in source code

               +  typeHiding type parameter hiding another type

               +  unavoidableGenericProblems report even unavoidable type safety problems due to raw APIs

               +  unchecked unchecked type operation

               -  unnecessaryElse unnecessary else clause

               -  unqualifiedField unqualified reference to field

              +/- unused macro for unusedImport, unusedLabel, unusedLocal, unusedPrivate, unusedThrown, unusedTypeArgs, and unusedTypeParameter

               -  unusedAllocation allocating an object that is not used

               -  unusedArgument unused method parameter (deprecated option; use unusedParam instead)

               +  unusedImport unused import reference

               +  unusedLabel unused label

               +  unusedLocal unused local variable

               +  unusedParam unused method parameter

               +  unusedParamImplementing unused parameter for implementing method

               +  unusedParamIncludeDoc unused parameter documented in a Javadoc comment tag

               +  unusedParamOverriding unused parameter for overriding method

               +  unusedPrivate unused private member declaration

               -  unusedThrown unused declared thrown exception

               -  unusedThrownIncludeDocComment unused declared thrown exception documented in a Javadoc comment tag

               -  unusedThrownExemptExceptionThrowable report unused declared thrown exception but exempt Exception and Throwable

               -  unusedThrownWhenOverriding unused declared thrown exception in overriding method

               +  unusedTypeArgs unused type arguments for method and constructor

               +  unusedTypeParameter unused type parameter

               -  uselessTypeCheck unnecessary cast/instanceof operation

               +  varargsCast varargs argument need explicit cast

              +/- warningToken unhandled or unused warning token in @SuppressWarnings


       -nowarn
              No warning (equivalent to -warn:none)

       -err:...
              Specify the set of enabled warnings that are converted to errors.
              E.g.
              -err:unusedLocal,deprecation
              unusedLocal and deprecation warnings will be converted to errors. All other warnings are still reported as warnings.

              -err:<warning tokens separated by ,>    convert exactly the listed warnings to errors
              -err:+<warning tokens separated by ,>   convert additional warnings to errors
              -err:-<warning tokens separated by ,>   remove specific warnings from being converted to errors


       -deprecation
              Equivalent to -warn:+deprecation.

       -properties <file>
              Set  warnings/errors  option based on the properties file contents. This option can be used with -nowarn, -err:.. or -warn:.. options, but the last one on the command line sets the options to
              be used.

              The properties file contents can be generated by setting project specific settings on an existing java project and using the file in .settings/org.eclipse.jdt.core.prefs file as a  properties
              file,  or  a  simple text file that is defined entry/value pairs using the constants defined in the org.eclipse.jdt.core.JavaCore class. Of those constants declared in this class, all options
              starting with "org.eclipse.jdt.core.compiler." are interpreted by the batch compiler.

               ...
              org.eclipse.jdt.core.compiler.problem.annotationSuperInterface=warning
              org.eclipse.jdt.core.compiler.problem.assertIdentifier=warning
              org.eclipse.jdt.core.compiler.problem.autoboxing=ignore
               ...

              To ensure that a property file has the same effect when used in the IDE and for the batch compiler, use of the -properties option will change the defaults for a few options:

              -g                       default changed to all enabled
              -preserveAllLocals       default changed to enabled
              -enableJavadoc           default changed to enabled
              error/warning forbidden default changed to error


       Debug Options


       -g[:none|:lines,vars,source]
              Set the debug attributes level
              -g                       All debug info (equivalent to -g:lines,vars,source)
              -g:none                  No debug info
              -g:[lines,vars,source]   Selective debug info
              Not specifying this option is equivalent to setting -g:lines,source.


       -preserveAllLocals
              Explicitly request the compiler to preserve all local variables (for debug purpose). If omitted, the compiler will remove unused locals.

       -parameters
              Explicitly request the compiler to preserve information about the formal parameters of a method (such as their names) to be accessed from reflection  libraries,  annotation  processing,  code
              weaving, and in the debugger. This option is supported from target level 1.8 and later.  Annotation processing options (require a 1.6 VM or above and are used only if the compliance is 1.6)


       Annotation Processing Options


       -Akey[=value]
              Annotation processors options that are passed to annotation processors. key is made of identifiers separated by dots


       -proc:[only|none]
              If  -proc:only is specified, the annotation processors will run but no compilation will be performed. If -proc:none is specified, annotation processors will not be discovered or run; compila‐
              tion will proceed as if no annotation processors were found. By default the compiler must search the classpath for annotation processors, so specifying -proc:none  may  speed  compilation  if
              annotation processing is not required.

       -processor <class1[,class2,...]>
              Qualified class names of annotation processors to run. If specified, the normal processor discovery process will be skipped.

       -processorpath <dir 1>;<dir 2>;...;<dir P>
              A  list  of  directories  or jar files which will be searched for annotation processors. Entries are separated by the platform path separator. If not specified, the classpath will be searched
              instead.

       -s <dir>
              The directory where generated source files will be created.

       -XprintProcessorInfo
              Print information about which annotations and which elements a processor is asked to process

       -XprintRounds
              Print information about annotation processing rounds

       -classNames <class1[,class2,...]>
              Qualified names of binary types that need to be processed


       Ignored Options (for compatibility with javac options)


       -J<option>
              Pass option to the virtual machine

       -X<option>
              Specify non-standard option. -Xemacs is not ignored.

       -X     Print non-standard options and exit

       -O     Optimize for execution time


       Advanced Options


       @<file>
              Read command-line arguments from file

       -maxProblems <n>
              Max number of problems per compilation unit (100 by default)

       -log <filename>
              Specify a log file in which all output from the compiler will be dumped. This is really useful if you want to debug the batch compiler or get a file which contains  all  errors  and  warnings
              from a batch build. If the extension is .xml, the generated log will be an xml file.

       -genericsignature
              Explicitly request the compiler to preserve information about generic signature of lambda expressions.

       -Xemacs
              Use emacs style to present errors and warnings locations into the console and regular text logs. XML logs are unaffected by this option. With this option active, the message:
                  2. WARNING in /workspace/X.java
                  (at line 8)...
              is presented as:
                  /workspace/X.java:8: warning: The method...


       -proceedOnError[:Fatal]
              Keep  compiling in spite of errors, dumping class files with problem methods or problem types. This is recommended only if you want to be able to run your application even if you have remain‐
              ing errors.  With ":Fatal", all optional errors are treated as fatal and this leads to code that will abort if an error is reached at runtime. Without ":Fatal", optional errors don't  prevent
              the proper code generation and the produced .class files can be run without a problem.

       -verbose
              Print accessed/processed compilation units in the console or the log file if specified.

       -referenceInfo
              Compute reference info. This is useful only if connected to the builder. The reference infos are useless otherwise.

       -progress
              Show progress (only in -log mode).

       -time  Display speed information.

       -noExit
              Do not call System.exit(n) at end of compilation (n=0 if no error).

       -repeat <n>
              Repeat compilation process <n> times (perf analysis).

       -inlineJSR
              Inline JSR bytecode (implicit if target >= 1.5).

       -enableJavadoc
              Consider references inside Javadoc. The Javadoc options are effective only when this option is enabled.

       -missingNullDefault
              When annotation based null analysis is enabled (using "nullAnnot", above), this option will raise a warning whenever there is no default annotation on a package or a type.

       -annotationpath
              When  annotation  based  null  analysis is enabled (using "nullAnnot", above), this option defines locations where to find external annotations to support annotation-based null analysis.  The
              value of this options is a list of directories or zip files. Entries are separated by the platform path separator.  The special name CLASSPATH will cause lookup of external  annotations  from
              the classpath and sourcepath.


       Helping Options


       -? -help
              Display the help message.

       -v -version
              Display the build number of the compiler. This is very useful to report a bug.

       -showversion
              Display the build number of the compiler and continue. This is very useful to report a bug.


SEE ALSO
       <http://help.eclipse.org/topic/org.eclipse.jdt.doc.user/tasks/task-using_batch_compiler.htm>

BUGS
       To report bugs, use <https://bugs.eclipse.org/bugs/enter_bug.cgi?product=JDT&component=Core>

AUTHOR
       For details on Eclipse committers, see <http://www.eclipse.org/committers/>



                                                                                                10 August 2015                                                                                         ecj(1)

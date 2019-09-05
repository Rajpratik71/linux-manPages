moc(1)                                                        General Commands Manual                                                       moc(1)

NAME
       moc - generate Qt meta object support code

SYNOPSIS
       moc [-o file] [-i] [-f] [-k] [-ldbg] [-nw] [-p path] [-q path] [-v] file

DESCRIPTION
       This  page documents the Meta Object Compiler for the Qt GUI application framework. The moc reads one or more C++ class declarations from a
       C++ header or source file and generates one C++ source file containing meta object  information  for  the  classes.  The  C++  source  file
       generated  by  the  moc  must  be  compiled and linked with the implementation of the class (or it can be #included into the class's source
       file).

       If you use qmake to create your Makefiles, build rules will be included that call the moc when required, so you will not need  to  use  the
       moc directly.

       In  brief,  the  meta  object  system  is a structure used by Qt (see http://doc.trolltech.com) for component programming and run time type
       information.  It adds properties and inheritance information to (some) classes and provides a  new  type  of  communication  between  those
       instances of those classes, signal-slot connections.

OPTIONS
       -o file
              Write output to file rather than to stdout.

       -f     Force  the  generation  of  an  #include  statement  in  the  output.   This is the default for files whose name matches the regular
              expression .[hH][^.]* (i.e. the extension starts with H or h ). This option is only useful if you have  header  files  that  do  not
              follow the standard naming conventions.

       -i     Do  not  generate  an  #include  statement  in  the  output.  This may be used to run moc on a C++ file containing one or more class
              declarations. You should then #include the meta object code in the .cpp file (see USAGE below).  If both -f and -i are present,  the
              last one wins.

       -nw    Do not generate any warnings. Not recommended.

       -ldbg  Write a flood of lex debug information to stdout.

       -p path
              Makes moc prepend path/ to the file name in the generated #include statement (if one is generated).

       -q path
              Makes moc prepend path/ to the file name of qt #include files in the generated code.

       -v     Displays the version of moc and Qt.

       You  can  explicitly  tell  the  moc  not  to parse parts of a header file. It recognizes any C++ comment (//) that contains the substrings
       MOC_SKIP_BEGIN or MOC_SKIP_END. They work as you would expect and you can have several levels of them. The net result as seen by the moc is
       as if you had removed all lines between a MOC_SKIP_BEGIN and a MOC_SKIP_END

USAGE
       moc is almost always invoked by make(1), not by hand.

       moc is typically used with an input file containing class declarations like this:

           class YourClass : public QObject {
               Q_OBJECT
               Q_PROPERTY( ... )
               Q_CLASSINFO( ... )

           public:
               YourClass( QObject * parent=0, const char * name=0 );
               ~YourClass();

           signals:

           public slots:

           };

       Here is a useful makefile rule if you only use GNU make:

           m%.cpp: %.h
                   moc $< -o $@

       If you want to write portably, you can use individual rules of the following form:

           mNAME.cpp: NAME.h
                   moc $< -o $@

       You must also remember to add mNAME.cpp to your SOURCES (substitute your favorite name) variable and mNAME.o to your OBJECTS variable.

       (While  we  prefer  to  name  our  C++  source files .cpp, the moc doesn't know that, so you can use .C, .cc, .CC, .cxx or even .c++ if you
       prefer.)

       If you have class declarations in C++ files, we recommend that you use a makefile rule like this:

           NAME.o: mNAME.cpp

           mNAME.cpp: NAME.cpp
                   moc -i $< -o $@

       This guarantees that make(1) will run the moc before it compiles NAME.cpp.  You can then put

           #include "nNAME.cpp"

       at the end of NAME.cpp, where all the classes declared in that file are fully known.

DIAGNOSTICS
       Sometimes you may get linkage errors, saying that YourClass::className() is undefined or that YourClass lacks a vtbl.  Those errors  happen
       most often when you forget to compile the moc-generated C++ code or include that object file in the link command.

       The moc will warn you about a number of dangerous or illegal constructs.

BUGS
       The  moc  does  not  expand  #include  or  #define,  it simply skips any preprocessor directives it encounters. This is regrettable, but is
       normally not a problem in practice.

       The moc does not handle all of C++.  The main problem is that class templates cannot have signals or slots.   This  is  an  important  bug.
       Here is an example:

           class SomeTemplate<int> : public QFrame {
               Q_OBJECT
               ....
           signals:
               void bugInMocDetected( int );
           };

       Less  importantly, the following constructs are illegal.  All of them have have alternatives which we think are usually better, so removing
       these limitations is not a high priority for us.

   Multiple inheritance requires QObject to be first.
       If you are using multiple inheritance, moc assumes that the first inherited class is a subclass of QObject.  Also, be sure  that  only  the
       first inherited class is a QObject.

           class SomeClass : public QObject, public OtherClass {
               ...
           };

       This  bug  is almost impossible to fix; since the moc does not expand #include or #define, it cannot find out which one of the base classes
       is a QObject.

   Function pointers cannot be arguments to signals or slots.
       In most cases where you would consider that, we think inheritance is a better alternative.  Here is an example of illegal syntax:

           class SomeClass : public QObject {
               Q_OBJECT
               ...
           public slots:
               // illegal
               void apply( void (*apply)(List *, void *), void * );
           };

       You can work around this restriction like this:

           typedef void (*ApplyFunctionType)( List *, void * );

           class SomeClass : public QObject {
               Q_OBJECT
               ...
           public slots:
               void apply( ApplyFunctionType, char * );
           };

       It may sometimes be even better to replace the function pointer with inheritance and virtual functions, signals or slots.

   Friend declarations cannot be placed in signals or slots sections
       Sometimes it will work, but in general, friend declarations cannot be placed in signals or slots  sections.   Put  them  in  the  good  old
       private, protected or public sections instead.  Here is an example of the illegal syntax:

           class SomeClass : public QObject {
               Q_OBJECT
               ...
           signals:
               friend class ClassTemplate<char>; // illegal
           };

   Signals and slots cannot be upgraded
       The  C++ feature of upgrading an inherited member function to public status is not extended to cover signals and slots.  Here is an illegal
       example:

           class Whatever : public QButtonGroup {
               ...
           public slots:
               QButtonGroup::buttonPressed; // illegal
               ...
           };

       The QButtonGroup::buttonPressed() slot is protected.

       C++ quiz: What happens if you try to upgrade a protected member function which is overloaded?

              - All the functions are upgraded.

              - That is not legal C++.

   Type macros cannot be used for signal and slot arguments
       Since the moc does not expand #define, type macros that take an argument will not work in signals and slots. Here is an illegal example:

           #ifdef ultrix
           #define SIGNEDNESS(a) unsigned a
           #else
           #define SIGNEDNESS(a) a
           #endif
           class Whatever : public QObject {
               ...
           signals:
               void someSignal( SIGNEDNESS(int) ); // illegal
           };

       A #define without arguments works.

   Nested classes cannot be in the signals or slots sections nor have signals or slots
       Here's an example:

           class A {
               Q_OBJECT
           public:
               class B {
               public slots: // illegal
                   void b();
                   ...
               };
           signals:
               class B {  // illegal
                   void b();
                ...
               }:
           };

   Constructors cannot be used in signals or slots sections
       It is a mystery to us why anyone would put a constructor on either the signals or slots  sections.   You  can't,  anyway  (except  that  it
       happens  to  work in some cases).  Put them in private, protected or public sections, where they belong.  Here is an example of the illegal
       syntax:

           class SomeClass : public QObject {
               Q_OBJECT
           public slots:
               SomeClass( QObject *parent, const char *name )
                   : QObject( parent, name ) {} // illegal
               ...
           };

   Properties need to be declared before the public section that contains the respective get and set functions
       Declaring the first property within or after the public section that contains the type definition and the respective get and set  functions
       does  not  work  as  expected. The moc will complain that it can neither find the functions nor resolve the type. Here is an example of the
       illegal syntax:

           class SomeClass : public QObject {
               Q_OBJECT
           public:
               ...
               // illegal
               Q_PROPERTY( Priority priority READ priority WRITE setPriority )
               Q_ENUMS( Priority )
               enum Priority { High, Low, VeryHigh, VeryLow };
               void setPriority( Priority );
               Priority priority() const;
               ...
           };

       Work around this limitation by declaring all properties at the beginning of the class declaration, right after Q_OBJECT:

           class SomeClass : public QObject {
               Q_OBJECT
               Q_PROPERTY( Priority priority READ priority WRITE setPriority )
               Q_ENUMS( Priority )
           public:
               ...
               enum Priority { High, Low, VeryHigh, VeryLow };
               void setPriority( Priority );
               Priority priority() const;
               ...
           };

SEE ALSO
       http://www.trolltech.com, C++  ARM,  section  r.11.3  (for  the  answer  to  the  quiz),  and  http://doc.trolltech.com  (for  complete  Qt
       documentation).

Trolltech AS                                                       24 June 2001                                                             moc(1)

dbus-binding-tool(1)                                                                            User Commands                                                                            dbus-binding-tool(1)



NAME
       dbus-binding-tool - C language GLib bindings generation utility.

SYNOPSIS
       dbus-binding-tool [--force] [--help] [--ignore-unsupported] [--mode=pretty|glib-client|glib-server] [--output=file] [--prefix=symbol-prefix] [--version] [file...]

DESCRIPTION
       dbus-binding-tool  is  used  to  expose a GObject via D-Bus.  As input, dbus-binding-tool uses a D-Bus Introspection XML file.  As output, the client-side or server-side bindings is generated.  This
       output is a header file which eases the use of a remote D-Bus object.  Output is sent to standard out or to the filename specified with the --output argument.

EXTENDED DESCRIPTION

       The following is a sample D-Bus Introspection XML file which describes an object that exposes one method, named ManyArgs:

       <?xml version="1.0" encoding="UTF-8" ?>
       <node name="/com/example/MyObject">
         <interface name="com.example.MyObject">
           <method name="ManyArgs">
             <arg type="u" name="x" direction="in" />
             <arg type="s" name="str" direction="in" />
             <arg type="d" name="trouble" direction="in" />
             <arg type="d" name="d_ret" direction="out" />
             <arg type="s" name="str_ret" direction="out" />
           </method>
         </interface>
       </node>

       dbus-binding-tool supports annotations in the XML format to further control how the bindings are generated.

   client-side bindings
       When building client-side bindings, the --mode=glib-client argument is used.  The client-side bindings support the "org.freedesktop.DBus.Glib.NoReply"  annotation.   This  is  specified  within  the
       <method> tag to indicate that the client is not expecting a reply to the method call, so a reply should not be sent.  This is often used to speed up rapid method calls where there are no "out" argu‐
       ments, and not knowing if the method succeeded is an acceptable compromise to halve the traffic on the bus.  For example:

       <method name "FooMethod">
         [...]
         <annotation name="org.freedesktop.DBus.GLib.NoReply" value="yes"/>
         [...]
       </method>

   server-side bindings
       When building server-side bindings, the --mode=glib-server argument is used.  Also the --prefix argument must be used when building server-side bindings so that functions in the generated output are
       prefexed with the specified value.  The server-side bindings support the following annotations:

       "org.freedesktop.DBus.GLib.CSymbol"

       This annotation is used to specify the C symbol names for the various types (interface, method, etc.), if it differs from the name D-Bus generates.

       <interface name="com.example.MyObject">
         <annotation name="org.freedesktop.DBus.GLib.CSymbol" value="my_object"/>
         [...]
         <method name "ManyArgs">
           <annotation name="org.freedesktop.DBus.GLib.CSymbol" value="my_object_many_args"/>
           [...]
         </method>
       </interface>

       "org.freedesktop.DBus.GLib.Async"

       This  annotation marks the method implementation as an asynchronous function, which does not return a response straight away but will send the response at some later point to complete the call. This
       is used to implement non-blocking services where method calls can take time.

       When a method is asynchronous, the function prototype is different. It is required that the function conform to the following rules:

         ·  The function must return a value of type gboolean; TRUE on success, and FALSE otherwise.
         ·  The first parameter is a pointer to an instance of the object.
         ·  Following the object instance pointer are the method input values.
         ·  The final parameter must be a (DBusGMethodInvocation *). This is used when sending the response message back to the client, by calling dbus_g_method_return or dbus_g_method_return_error.

       For example:

       <method name "FooMethod">
         [...]
         <annotation name="org.freedesktop.DBus.GLib.Async" value="yes"/>
         [...]
       </method>

       "org.freedesktop.DBus.GLib.Const"

       This attribute can only be applied to "out" <arg> nodes, and specifies that the parameter is not being copied when returned. For example, this turns a 's' argument from a (char **) to a (const  char
       **), and results in the argument not being freed by D-Bus after the message is sent.  For example:

         <arg type="u" name="x" direction="out">
           <annotation name="org.freedesktop.DBus.GLib.Const" value=""/>
         </arg>

       "org.freedesktop.DBus.GLib.ReturnVal"

       This  attribute can only be applied to "out" <arg> nodes, and alters the expected function signature. It currently can be set to two values: "" or "error". The argument marked with this attribute is
       not returned via a pointer argument, but by the function's return value. If the attribute's value is the empty string, the (GError *) argument is also omitted so there is no standard way  to  return
       an  error  value.  This  is  very useful for interfacing with existing code, as it is possible to match existing APIs. If the attribute's value is "error", then the final argument is a (GError *) as
       usual.  For example:

         <arg type="u" name="x" direction="out">
           <annotation name="org.freedesktop.DBus.GLib.ReturnVal" value=""/>
         </arg>

OPTIONS
       The following options are supported:

       --force

           Overwrite the output file if it already exists with a newer timestamp than the source files.



       --help

           Display usage information.



       --ignore-unsupported

           If set, then unsupported signatures for <method> parameters are ignored.



       --mode=pretty|glib-client|glib-server

           If the value is "glib-client", then client bindings are generated.  If the value is "glib-server", then server bindings are generated.  If the value is "pretty", then the output  is  in  a  more
           human readable format.



       --output=file

           Specify the output file.



       --prefix=symbol-prefix

           Functions in the generated output are prefixed with the symbol-prefix value.



       --version

           Display the version number of the dbus-binding-tool command.



OPERANDS
       The following operands are supported:

       file            A list of one or more input D-Bus Introspection XML files to include in the generated output.



FILES
       The following files are used by this application:

       /usr/bin/dbus-binding-tool      Executable for the D-Bus Binding Tool application.



ATTRIBUTES
       See attributes(5) for descriptions of the following attributes:


       ┌─────────────────────────────┬─────────────────────────────┐
       │      ATTRIBUTE TYPE         │      ATTRIBUTE VALUE        │
       ├─────────────────────────────┼─────────────────────────────┤
       │Availability                 │SUNWdbus-bindings            │
       ├─────────────────────────────┼─────────────────────────────┤
       │Interface stability          │Volatile                     │
       └─────────────────────────────┴─────────────────────────────┘

SEE ALSO
       dbus-cleanup-sockets(1), dbus-daemon(1), dbus-monitor(1), dbus-send(1), dbus-uuidgen(1), libdbus-glib-1(3), attributes(5)

NOTES
       Written by Brian Cameron, Sun Microsystems Inc., 2009.



SunOS 5.11                                                                                       26 Feb 2009                                                                             dbus-binding-tool(1)

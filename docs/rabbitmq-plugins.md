RABBITMQ-PLUGINS(1)                                                                            RabbitMQ Service                                                                           RABBITMQ-PLUGINS(1)



NAME
       rabbitmq-plugins - command line tool for managing RabbitMQ broker plugins

SYNOPSIS


                        rabbitmq-plugins [-n node] {command} [command options...]

DESCRIPTION
       rabbitmq-plugins is a command line tool for managing RabbitMQ broker plugins. It allows one to enable, disable and browse plugins. It must be run by a user with write permissions to the RabbitMQ
       configuration directory.

       Some plugins depend on others to work correctly.  rabbitmq-plugins traverses these dependencies and enables all required plugins. Plugins listed on the rabbitmq-plugins command line are marked as
       explicitly enabled; dependent plugins are marked as implicitly enabled. Implicitly enabled plugins are automatically disabled again when they are no longer required.

       The enable, disable and set commands will update the plugins file and then attempt to connect to the broker and ensure it is running all enabled plugins. By default if it is not possible to connect
       to the running broker (for example if it is stopped) then a warning is displayed. Specify --online or --offline to change this behaviour.

COMMANDS
       list [-v] [-m] [-E] [-e] [pattern]

           -v
               Show all plugin details (verbose).

           -m
               Show only plugin names (minimal).

           -E
               Show only explicitly enabled plugins.

           -e
               Show only explicitly or implicitly enabled plugins.

           pattern
               Pattern to filter the plugin names by.

           Lists all plugins, their versions, dependencies and descriptions. Each plugin is prefixed with two status indicator characters inside [ ]. The first indicator can be " " to indicate that the
           plugin is not enabled, "E" to indicate that it is explicitly enabled, "e" to indicate that it is implicitly enabled, or "!" to indicate that it is enabled but missing and thus not operational.
           The second indicator can be " " to show that the plugin is not running, or "*" to show that it is.

           If the optional pattern is given, only plugins whose name matches pattern are shown.

           For example:

           rabbitmq-plugins list

           This command lists all plugins, on one line each.

           rabbitmq-plugins list -v

           This command lists all plugins.

           rabbitmq-plugins list -v management

           This command lists all plugins whose name contains "management".

           rabbitmq-plugins list -e rabbit

           This command lists all implicitly or explicitly enabled RabbitMQ plugins.

       enable [--offline] [--online] {plugin ...}

           --offline
               Just modify the enabled plugins file.

           --online
               Treat failure to connect to the running broker as fatal.

           plugin
               One or more plugins to enable.

           Enables the specified plugins and all their dependencies.

           For example:

           rabbitmq-plugins enable rabbitmq_shovel rabbitmq_management

           This command enables the shovel and management plugins and all their dependencies.

       disable [--offline] [--online] {plugin ...}

           --offline
               Just modify the enabled plugins file.

           --online
               Treat failure to connect to the running broker as fatal.

           plugin
               One or more plugins to disable.

           Disables the specified plugins and all their dependencies.

           For example:

           rabbitmq-plugins disable amqp_client

           This command disables amqp_client and all plugins that depend on it.

       set [--offline] [--online] {plugin ...}

           --offline
               Just modify the enabled plugins file.

           --online
               Treat failure to connect to the running broker as fatal.

           plugin
               Zero or more plugins to enable.

           Enables the specified plugins and all their dependencies. Unlike rabbitmq-plugins enable this command ignores and overwrites any existing enabled plugins.  rabbitmq-plugins set with no plugin
           arguments is a legal command meaning "disable all plugins".

           For example:

           rabbitmq-plugins set rabbitmq_management

           This command enables the management plugin and its dependencies and disables everything else.

AUTHOR
       The RabbitMQ Team <<info@rabbitmq.com>>



RabbitMQ Server                                                                                   08/02/2018                                                                              RABBITMQ-PLUGINS(1)

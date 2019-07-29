VIEWRES(1)                                                    General Commands Manual                                                   VIEWRES(1)

NAME
       viewres - graphical class browser for Xt

SYNOPSIS
       viewres [-option ...]

DESCRIPTION
       The  viewres program displays a tree showing the widget class hierarchy of the Athena Widget Set.  Each node in the tree can be expanded to
       show the resources that the corresponding class adds (i.e. does not inherit from its parent) when a widget is  created.   This  application
       allows the user to visually examine the structure and inherited resources for the Athena Widget Set.

OPTIONS
       Viewres accepts all of the standard toolkit command line options as well as the following:

       -top name
               This option specifies the name of the highest widget in the hierarchy to display.  This is typically used to limit the display to a
               subset of the tree.  The default is Object.

       -variable
               This option indicates that the widget variable names (as declared in header files) should be displayed in the nodes rather than the
               widget class name.  This is sometimes useful to distinguish widget classes that share the same name (such as Text).

       -vertical
               This option indicates that the tree should be displayed top to bottom rather left to right.

VIEW MENU
       The way in which the tree is displayed may be changed through the entries in the View menu:

       Show Variable Names
               This  entry  causes the node labels to be set to the variable names used to declare the corresponding widget class.  This operation
               may also be performed with the SetLabelType(variable) translation.

       Show Class Names
               This entry causes the node labels to be set to the class names used when specifying resources.  This operation  may  also  be  per‐
               formed with the SetLabelType(class) translation.

       Layout Horizontal
               This  entry  causes the tree to be laid out from left to right.  This operation may also be performed with the SetOrientation(West)
               translation.

       Layout Vertical
               This entry causes the tree to be laid out from top to bottom.  This operation may also be performed with the  SetOrientation(North)
               translation.

       Show Resource Boxes
               This  entry expands the selected nodes (see next section) to show the new widget and constraint resources.  This operation may also
               be performed with the Resources(on) translation.

       Hide Resource Boxes
               This entry removes the resource displays from the selected nodes (usually to conserve space).  This operation may also be performed
               with the Resources(off) translation.

SELECT MENU
       Resources  for a single widget class can be displayed by clicking Button2 on the corresponding node, or by adding the node to the selection
       list with Button1 and using the Show Resource Boxes entry in the View menu.  Since Button1 actually toggles the selection state of a  node,
       clicking on a selected node will cause it to be removed from the selected list.

       Collections of nodes may also be selected through the various entries in the Select menu:

       Unselect All
               This entry removes all nodes from the selection list.  This operation may also be performed with the Select(nothing) translation.

       Select All
               This entry adds all nodes to the selection list.  This operation may also be performed with the Select(all) translation.

       Invert All
               This  entry  adds  unselected  nodes to, and removes selected nodes from, the selection list.  This operation may also be performed
               with the Select(invert) translation.

       Select Parent
               This entry selects the immediate parents of all selected nodes.  This operation may  also  be  performed  with  the  Select(parent)
               translation.

       Select Ancestors
               This  entry recursively selects all parents of all selected nodes.  This operation may also be performed with the Select(ancestors)
               translation.

       Select Children
               This entry selects the immediate children of all selected nodes.  This operation may also be performed  with  the  Select(children)
               translation.

       Select Descendants
               This  entry  recursively  selects all children of all selected nodes.  This operation may also be performed with the Select(descen‐
               dants) translation.

       Select Has Resources
               This entry selects all nodes that add new resources (regular or constraint) to their corresponding widget classes.  This  operation
               may also be performed with the Select(resources) translation.

       Select Shown Resource Boxes
               This  entry  selects  all  nodes whose resource boxes are currently expanded (usually so that they can be closed with Hide Resource
               Boxes).  This operation may also be performed with the Select(shown) translation.

ACTIONS
       The following application actions are provided:

       Quit()
               This action causes viewres to exit.

       SetLabelType(type)
               This action sets the node labels to display the widget variable or class names, according to the argument type.

       SetOrientation(direction)
               This action sets the root of the tree to be one of the following areas of the window:  West, North, East, or South.

       Select(what)
               This action selects the indicated nodes, as described in the VIEW MENU section: nothing  (unselects  all  nodes),  invert,  parent,
               ancestors, children, descendants, resources, shown.

       Resources(op)
               This  action turns on, off, or toggles the resource boxes for the selected nodes.  If invoked from within one of the nodes (through
               the keyboard or pointer), only that node is used.

WIDGET HIERARCHY
       Resources may be specified for the following widgets:

       Viewres viewres
               Paned pane
                       Box buttonbox
                               Command quit
                               MenuButton view
                                       SimpleMenu viewMenu
                                               SmeBSB layoutHorizontal
                                               SmeBSB layoutVertical
                                               SmeLine line1
                                               SmeBSB namesVariable
                                               SmeBSB namesClass
                                               SmeLine line2
                                               SmeBSB viewResources
                                               SmeBSB viewNoResources
                               MenuButton select
                                       SimpleMenu selectMenu
                                               SmeBSB unselect
                                               SmeBSB selectAll
                                               SmeBSB selectInvert
                                               SmeLine line1
                                               SmeBSB selectParent
                                               SmeBSB selectAncestors
                                               SmeBSB selectChildren
                                               SmeBSB selectDescendants
                                               SmeLine line2
                                               SmeBSB selectHasResources
                                               SmeBSB selectShownResources
                       Form treeform
                               Porthole porthole
                                       Tree tree
                                               Box variable-name
                                                       Toggle variable-name
                                                       List variable-name
                               Panner panner

       where variable-name is the widget variable name of each node.

SEE ALSO
       X(7), xrdb(1), listres(1), editres(1), appres(1), appropriate widget documents

COPYRIGHT
       Copyright 1994 X Consortium
       See X(7) for a full statement of rights and permissions.

AUTHOR
       Jim Fulton, MIT X Consortium

X Version 11                                                       viewres 1.0.4                                                        VIEWRES(1)

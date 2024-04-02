KATARAKT(1)                                                       Katarakt Manual                                                      KATARAKT(1)

NAME
       katarakt - a simple PDF viewer with three layouts

SYNOPSIS
       katarakt ([OPTIONS] FILE|(-u URL))*

DESCRIPTION
       It’s a PDF viewer. It views PDFs.

       There are currently three layouts. The single layout is very simple and only supports scrolling on a per page basis. As the name suggests
       the current page is displayed in the center and zoomed to fit the window. It is active by default.

       The grid layout is much more advanced and offers continuous (smooth, per pixel) scrolling, zooming and adjusting the column count. Pages
       keep their correct relative size and are shown in a grid.

       The presenter layout is for giving a presentation. It opens a second window, to be viewed on the beamer, and shows the current and next
       slide in the main window.

       For every file passed on the command line a separate process is spawned.

OPTIONS
       -u, --url
           Instead of opening a local document, download it from the given URL.

       -p, --page NUM
           Start on page NUM.

       -f, --fullscreen
           Start in fullscreen mode.

       -q, --quit true|false
           If true, quit on initialization failure. If false, show the window even if an error occured. Overrides the config option
           quit_on_init_fail.

       -s, --single-instance true|false
           If true, prevents opening the same document twice and focuses the existing instance. Overrides the config option
           single_instance_per_file.

       --write-default-config FILE
           Write the built-in default configuration to FILE and exit. Hint: on unix systems, you can use --write-defaults /dev/stdout to print the
           defaults.

       -h, --help
           Print help and exit.

CONFIGURATION
       Variables and key bindings can be changed by modifying the katarakt.ini file. By default it is read from $XDG_CONFIG_HOME.

       Variables must be listed under the section "[Settings]", keys under section "[Keys]". Settings that are not present in the config file use
       the built-in default. For a list of all variables with a short explanation see below.

KEY BINDINGS
       q
           Quit katarakt.

       1
           Switch to single layout. Views a single page at a time, scaled to fit the screen.

       2
           Switch to grid layout. Views pages in a continuous fashion, scaled to fit the window width. Supports zooming and multiple columns.

       3
           Switch to presenter layout. Views the current page and a smaller preview of the next page. Also, opens a second window that shows only
           the current page for displaying on a beamer.

       Up, Down, Left, Right, k, j, h, l
           Move around (up/down/left/right).

       ^u, ^d
           Scroll up/down half the screen.

       BackSpace, Space, ^b, ^f
           Scroll up/down the screen. By default scrolls 90% to create an overlapping region.

       PgUp, PgDown
           Scroll up/down one page. Kind of swaps the pages in place.

       Home, End, g, G
           Go to the first/last page.

       ^g
           Show goto page bar.

       /
           Show the search bar. Hitting Esc will hide the results, searching for an empty string will clear them. If the search term contains an
           uppercase letter the search is case sensitive ("smartcase").

       ?
           Show the search bar. This next search will be backwards.

       n, N
           Focus next/previous search hit.

       ^n, ^N
           Focus next/previous search hit that is currently not visible.

       ^o, ^i, Alt-Left, Alt-Right
           Move backward/forward through the jump list. Entries are added automatically when jumping.

       m
           Manually add the current page to the jump list.

       -, +, =
           Adjust zoom level (grid layout only).

       z
           Reset zoom level to default, i.e. fit width (grid layout only).

       [, ]
           Adjust column count (grid layout only).

       {, }
           Adjust the column the first page will be displayed in. Useful for reading in a book layout with a cover page (grid layout only).

       ,, .
           Rotate pages left/right.

       t
           Toggle the page number display in the bottom right corner.

       i
           Toggle between normal and inverted color rendering.

       ^c
           Copy the current selection to the global clipboard.

       v
           Swap the mouse buttons for selection and panning. The the left mouse button’s current operation is indicated by the mouse cursor.

       f
           Toggle fullscreen.

       r
           Reload the document. This can also be achieved by sending SIGUSR1 to the process.  katarakt reloads automatically if the opened file
           has changed.

       o
           Open a different document; shows a file dialog.

       s
           Show a file dialog to save the current document.

       F9
           Toggle the table of contents.

VARIABLES
       string default_layout
           single: The layout on startup. Possible values: single, grid, presenter.

       string background_color
           0xDF202020: Background color in ARGB Format. Alpha only works when using a compositor.

       string background_color_fullscreen
           0xFF000000: Fullscreen background color in ARGB Format.

       string unrendered_page_color
           0x80808080: Color that gets drawn instead of a page that hasn’t been rendered yet.

       int click_link_button
           1: The mouse button used for clicking links. Buttons 1-5 are supported.

       int drag_view_button
           2: The mouse button used for scrolling the view. Double-clicking this button centers the view around the location of the click. This is
           especially useful when using many columns to get an overview. Resets the column count to 1.

       int select_text_button
           1: The mouse button used for text selection. Double- and triple-clicking are supported to select with word/line granularity.

       int smooth_scroll_delta
           30: Pixel offset when moving around.

       float screen_scroll_factor
           0.9: Factor for scrolling the screen. Should be <= 1 to create an overlapping region.

       float jump_padding
           0.2: Distance from the border of the screen to keep for jump targets, e.g. search hits. Moves the view so that search hits are centered
           more.

       int rect_margin
           2: Number of pixels search rects are expanded by.

       int useless_gap
           2: Gap between two pages in grid layout in pixels.

       int min_zoom
           -14: Smallest zoom value.

       int max_zoom
           30: Biggest zoom value.

       float zoom_factor
           0.05: Influences the number of steps between min and max.

       int min_page_width
           50: Pages can not be smaller than this.

       bool quit_on_init_fail
           false: If true, quit katarakt if the document fails to open.

       bool single_instance_per_file
           false: If set and katarakt is called with a file that is already shown in another katarakt instance, then the other katarakt window is
           activated instead.

       string stylesheet
           See http://doc.qt.io/qt-4.8/stylesheet.html. It can be overridden via Qt’s -stylesheet command line option. The following example
           changes the goto page bar:

               stylesheet="
               GotoLine {
                       margin: 0px;
                       padding: 4px;
                       border-top-right-radius: 6px;
                       border-top: 1px solid black;
                       border-right: 1px solid black;
               }"

       string page_overlay_text
           Page %1/%2: The text in the bottom right corner.

       string icon_theme
           The name of your icon theme. Fill in if auto detection fails.

       int prefetch_count
           4: Number of pages exceeding the currently visible ones to render, back- and forwards respectively.

       int mouse_wheel_factor
           120: QT delta for turning the mouse wheel 1 click. Shouldn’t need to be touched.

       bool thumbnail_filter
           true: Enables the higher quality downsampling filter for thumbnails.

       int thumbnail_size
           32: One dimension of square thumbnails saved at run-time for every page that was once rendered.

COMMUNITY
       Feel free to join the IRC channel #katarakt on freenode.

AUTHOR
       katarakt is written by Philipp Erhardt.

RESOURCES
       Gitweb: http://git.cs.fau.de/?p=katarakt

       Homepage: http://git.cs.fau.de/~go18gomu/katarakt/

Katarakt                                                            12/06/2015                                                         KATARAKT(1)

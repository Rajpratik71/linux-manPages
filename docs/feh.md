FEH(1)                                                      BSD General Commands Manual                                                     FEH(1)

NAME
     feh — image viewer and cataloguer

SYNOPSIS
     feh [options] [files | directories | URLs ...]

VERSION
     This manual documents feh 2.14

     Compile-time switches: libcurl support enabled, Xinerama support enabled, builtin EXIF support enabled

DESCRIPTION
     feh is a mode-based image viewer.  It is especially aimed at command line users who need a fast image viewer without huge GUI dependencies,
     though it can also be started by (graphical) file managers to view an image.  By default (unless arguments or a filelist are specified) feh
     displays all files in the current directory.

     feh supports filelists, various image sorting modes, image captions, HTTP and more.  Configurable keyboard shortcuts are used to control it;
     the mouse is also supported, but only required for very few actions.

     feh can also be used as wallpaper setter.

     EXIF tags are supported either using exiv2 / exifgrep via --info (see the USAGE EXAMPLES section), or by compiling feh with exif=1.

MODES
     feh is based on various modes, which are selected at startup by command line options.

     Slideshow mode is the default.  It opens one window and displays the first image in it, the keyboard and mouse can be used to change slides
     (images).  In slideshow mode, images can be deleted either from the filelist or from the disk, the new filelist can then be saved to the disk
     and reopened at a later time.  An image can also be read from stdin via "feh -".

     Montage mode forms a montage from the filelist.  The resulting image can be viewed or saved, and its size can be limited by height, width or
     both.

     Index mode forms an index print from the filelist.  Image thumbnails are shown along with the filename, filesize and pixel size, printed
     using a truetype font of your choice.  The resulting image can be viewed or saved, and its size can be limited by height, width or both.

     Thumbnail mode is like index mode, but the mini-images are clickable and open the selected image in a new window.

     Multiwindow mode shows images in multiple windows, instead of as a slideshow in one window.  Don't use with a large filelist ;)

     List mode doesn't display images.  Outputs an ls - style listing of the files in the filelist, including image info such as size, pixels,
     type, etc.  Customlist mode will display whatever image info you want, in the format you choose.

     feh can also list either all the loadable files in a filelist or all the unloadable files.  Useful for preening a directory.

SUPPORTED FORMATS
     feh can open any format supported by Imlib2, most notably jpeg and png.  If the convert binary (supplied by ImageMagick) is available, it
     also has limited support for many other filetypes, such as svg, xcf and otf. Use --magick-timeout num with a non-negative value to enable it.
     For animated images, only the first frame is shown.

OPTIONS
     -A, --action [flag]action
             Specify a shell command as an action to perform on the image.  In slideshow or multiwindow mode, the action will be run when the
             action_0 key is pressed, in list mode, it will be run for each file.  In loadable/unloadable mode, it will be run for each load‐
             able/unloadable file, respectively.  In thumbnail mode, clicking on an image will cause the action to run instead of opening the
             image.

             If flag is ";", feh will reload the current image instead of switching to the next one after executing the action.

             The action will be executed by /bin/sh.  Use format specifiers to refer to image info.  See FORMAT SPECIFIERS for examples.  E.g.
             "feh -A mv ~/images/%n *".  In slideshow mode, the next image will be shown after running the action, in multiwindow mode, the window
             will be closed.

     --action1 .. --action9
             Extra actions which can be set and triggered using the appropriate number key.

     -Z, --auto-zoom
             Zoom pictures to screen size in fullscreen / fixed geometry mode.

     -x, --borderless
             Create borderless windows.

     -P, --cache-thumbnails
             Enable thumbnail caching in ~/.thumbnails.  Only works with thumbnails <= 256x256 pixels.

     -K, --caption-path path
             Path to directory containing image captions.  This turns on caption viewing, and if captions are found in path, which is relative to
             the directory of each image, they are overlayed on the displayed image.  E.g. with caption path "captions/", and viewing image
             "images/foo.jpg", the caption will be looked for in "images/captions/foo.jpg.txt".

     -L, --customlist format
             Don't display images, print image info according to format instead.  See FORMAT SPECIFIERS.

     --cycle-once
             Exit feh after one loop through the slideshow.

     -G, --draw-actions
             Draw the defined actions and what they do at the top-left of the image.

     --draw-exif
             (only if compiled with exif=1) display some EXIF information in the bottom left corner, similar to using --info with exiv2 / exifgrep
             .

     -d, --draw-filename
             Draw the filename at the top-left of the image.

     --draw-tinted
             Show overlay texts (as created by --draw-filename et al) on a semi-transparent background to improve their readability

     -f, --filelist file
             This option is similar to the playlists used by music software.  If file exists, it will be read for a list of files to load, in the
             order they appear.  The format is a list of image filenames, absolute or relative to the current directory, one filename per line.

             If file doesn't exist, it will be created from the internal filelist at the end of a viewing session.  This is best used to store the
             results of complex sorts (-Spixels for example) for later viewing.

             Any changes to the internal filelist (such as deleting a file or it being pruned for being unloadable) will be saved to file when feh
             exits.  You can add files to filelists by specifying them on the command line when also specifying the list.

             If file is "-", feh will read the filelist from its standard input.

     -e, --font font
             Set global font.  Should be a truetype font, resident in the current directory or the font directory, and should be defined in the
             form fontname/points, like "myfont/12".

     -C, --fontpath path
             Specify path as extra directory in which to search for fonts; can be used multiple times to add multiple paths.

     --force-aliasing
             Disable antialiasing for zooming, background setting etc.

     -I, --fullindex
             Same as index mode, but with additional information below the thumbnails.  Works just like "feh --index --index-info
             "%n\n%S\n%wx%h"".  Enables MONTAGE MODE OPTIONS.

             Note: This option needs to load all images to calculate the dimensions of the feh window, so when using it with many files it will
             take a while before a feh window is visible.  Use --preload to get a progress bar.

     -F, --fullscreen
             Make the window fullscreen.  Note that in this mode, large images will always be scaled down to fit the screen, --zoom zoom only
             affects smaller images and never scales larger than necessary to fit the screen size. The only exception is a zoom of 100, in which
             case images will always be shown at 100% zoom, no matter their dimensions.

     -g, --geometry [width x height] [+ x + y]
             Limit (and don't change) the window size.  Takes an X-style geometry string like 640x480 with optional +x+y window offset.  Note that
             larger images will be zoomed out to fit, but you can see them at 1:1 by clicking the zoom button.  Note that this option does not
             enforce the geometry, changing it by a tiling WM or manually is still possible.

     -Y, --hide-pointer
             Hide the pointer (useful for slideshows).

     -B, --image-bg style
             Use style as background for transparent image parts and the like.  Accepted values: checks, white, black.  The default for windowed
             mode is checks, while fullscreen defaults to black.

     -i, --index
             Enable Index mode.  Index mode is similar to montage mode, and accepts the same options.  It creates an index print of thumbnails,
             printing the image name beneath each thumbnail.  Index mode enables certain other options, see INDEX MODE OPTIONS and MONTAGE MODE
             OPTIONS.

     --index-info format
             Show image information based on format below thumbnails in index / thumbnail mode.  See FORMAT SPECIFIERS.  May contain newlines.

             Note: If you specify image-related formats (such as %w or %s), feh needs to load all images to calculate the dimensions of its own
             window.  So when using them with many files, it will take a while before a feh window becomes visible.  Use --preload to get a
             progress bar.

     --info [flag]commandline
             Execute commandline and display its output in the bottom left corner of the image.  Can be used to display e.g. image dimensions or
             EXIF information.  Supports FORMAT SPECIFIERS.  If flag is set to ";", the output will not be displayed by default, but has to be
             enabled by the toggle_info key.

     -k, --keep-http
             When viewing files using HTTP, feh normally deletes the local copies after viewing, or, if caching, on exit.  This option prevents
             this so that you get to keep the local copies.  They will be in /tmp with "feh" in the name.

     --keep-zoom-vp
             When switching images, keep zoom and viewport settings (zoom level and X, Y offsets)

     -l, --list
             Don't display images.  Analyze them and display an ls(1) - style listing.  Useful in scripts to hunt out images of a certain
             size/resolution/type etc.

     -U, --loadable
             Don't display images.  Just print out their names if imlib2 can successfully load them.  Returns false if at least one image failed
             to load.

     --magick-timeout timeout
             Stop trying to convert unloadable files after timeout seconds. A negative value disables covert / magick support altogether, a value
             of zero causes feh to try indefinitely. By default, magick support is disabled.

     --max-dimension width x height
             Only show images with width <= width and height <= height.  If you only care about one parameter, set the other to 0 (or a negative
             value).

     -M, --menu-font font
             Use font (truetype, with size, like "yudit/12") as menu font.

     --min-dimension width x height
             Only show images with width >= width and height >= height.  If you only care about one parameter, set the other to 0.

     -m, --montage
             Enable montage mode.  Montage mode creates a new image consisting of a grid of thumbnails of the images in the filelist.  When mon‐
             tage mode is selected, certain other options become available.  See MONTAGE MODE OPTIONS.

     -w, --multiwindow
             Disable slideshow mode.  With this setting, instead of opening multiple files in slideshow mode, multiple windows will be opened; one
             per file.

     --no-jump-on-resort
             Don't jump to the first image after resorting the filelist.

     -N, --no-menus
             Don't load or show any menus.

     --no-screen-clip
             By default, window sizes are limited to the screen size.  With this option, windows will have the size of the image inside them.
             Note that they may become very large this way, making them unmanageable in certain window managers.

     --no-xinerama
             Disable Xinerama support.  Only makes sense when you have Xinerama support compiled in.

     -j, --output-dir directory
             Save files to directory (only useful with -k)

     -p, --preload
             Preload images.  This doesn't mean hold them in RAM, it means run through them and eliminate unloadable images first.  Otherwise they
             will be removed as you flick through.  This also analyses the images to get data for use in sorting, such as pixel size, type etc.  A
             preload run will be automatically performed if you specify one of these sort modes.

     -q, --quiet
             Don't report non-fatal errors for failed loads.  Verbose and quiet modes are not mutually exclusive, the first controls informational
             messages, the second only errors.

     -z, --randomize
             When viewing multiple files in a slideshow, randomize the file list before displaying. The list is re-randomized whenever the
             slideshow cycles (that is, transitions from last to first image).

     -r, --recursive
             Recursively expand any directories in the commandline arguments to the content of those directories, all the way down to the bottom
             level.

     -R, --reload int
             Reload filelist and current image after int seconds.  Useful for viewing HTTP webcams or frequently changing directories.  (Note that
             the filelist reloading is still experimental.)

             If an image is removed, feh will either show the next one or quit.  However, if an image still exists, but can no longer be loaded,
             feh will continue to try loading it.

     -n, --reverse
             Reverse the sort order.  Use this to invert the order of the filelist.  E.g. to sort in reverse width order, use -nSwidth.

     -., --scale-down
             Scale images to fit window geometry (defaults to screen size when no geometry was specified).  This option is ignored when in
             fullscreen mode.

             In tiling environments, this also causes the image to be centered in the window.

     --scroll-step count
             Scroll count pixels whenever scroll_up, scroll_down, scroll_left or scroll_right is pressed.  Note that this option accepts negative
             numbers in case you need to inverse the scroll direction; see KEYS CONFIG SYNTAX to change it permanently.  Default: 20

     -D, --slideshow-delay float
             For slideshow mode, wait float seconds between automatically changing slides.  Useful for presentations.  Specify a negative number
             to set the delay (which will then be float * (-1)), but start feh in paused mode.

     -S, --sort sort_type
             The file list may be sorted according to image parameters.  Allowed sort types are: name, filename, mtime, width, height, pixels,
             size, format.  For sort modes other than name, filename, or mtime, a preload run will be necessary, causing a delay proportional to
             the number of images in the list.

             The mtime sort mode sorts images by most recently modified. To sort by oldest first, reverse the filelist with --reverse.

     -|, --start-at filename
             Start the filelist at filename.  Note that at the moment, filename must match an (expanded) path in the filelist. So, if the file to
             be matched is passed via an absolute path in the filelist, filename must be an absolute path. If the file is passed via a relative
             path, filename must be an identical relative path. This is a known issue.  See also USAGE EXAMPLES.

     -T, --theme theme
             Load options from config file with name theme - see THEMES CONFIG SYNTAX for more info.  Note that commandline options always over‐
             ride theme options.  The theme can also be set via the program name (e.g. with symlinks), so by default feh will look for a "feh"
             theme.

     -t, --thumbnails
             Same as Index mode, but the thumbnails are clickable image launchers.  Note that --fullscreen and --scale-down do not affect the
             thumbnail window. They do, however, work for image windows launched from thumbnail mode.  Also supports MONTAGE MODE OPTIONS.

     -~, --thumb-title string
             Set title for windows opened from thumbnail mode.  See also FORMAT SPECIFIERS.

     -^, --title title
             Set window title.  Applies to all windows except those opened from thumbnail mode.  See FORMAT SPECIFIERS.

     -u, --unloadable
             Don't display images.  Just print out their names if imlib2 can NOT successfully load them.  Returns false if at least one image was
             loadable.

     -V, --verbose
             output useful information, progress bars, etc.

     -v, --version
             output version information and exit.

     --xinerama-index screen
             Override feh's idea of the active Xinerama screen. May be useful in certain circumstances where the window manager places the feh
             window on Xinerama screen A while feh assumes that it will be placed on screen B.

             In background setting mode: When used with any option other than --bg-tile: Only set wallpaper on screen.  All other screens will be
             filled black/white.  This is most useful in a Xinerama configuration with overlapping screens.  For instance, assume you have two
             overlapping displays (index 0 and 1), where index 0 is smaller. To center a background on the display with index 0 and fill the extra
             space on index 1 black/white, use "--xinerama-index 0" when setting the wallpaper.

     --zoom percent | max | fill
             Zoom images by percent when in full screen mode or when window geometry is fixed.  When combined with --auto-zoom, zooming will be
             limited to the specified percent.  Specifying max is like setting --auto-zoom, using fill makes feh zoom the image like the --bg-fill
             mode.

MONTAGE MODE OPTIONS
     These additional options can be used for index, montage and (partially) thumbnail mode.

     -a, --alpha int
             When drawing thumbnails onto the background, set their transparency level to int (0 - 255).

     -b, --bg file | trans
             Use file as background for your montage.  With this option specified, the montage size will default to the size of file if no size
             restrictions were specified.  Alternatively, if file is "trans", the background will be made transparent.

     -X, --ignore-aspect
             By default, the montage thumbnails will retain their aspect ratios, while fitting into thumb-width/-height.  This options forces them
             to be the size set by --thumb-width and --thumb-height.  This will prevent any empty space in the final montage.

     -H, --limit-height pixels
             Limit the height of the montage.

     -W, --limit-width pixels
             Limit the width of the montage, defaults to 800 pixels.

             If both --limit-width and --limit-height are specified, the montage will be exactly width x height pixels in dimensions.

     -o, --output file
             Save the created montage to file.

     -O, --output-only file
             Just save the created montage to file without displaying it.

     -s, --stretch
             Normally, if an image is smaller than the specified thumbnail size, it will not be enlarged.  If this option is set, the image will
             be scaled up to fit the thumbnail size.  Aspect ratio will be maintained unless --ignore-aspect is specified.

     -E, --thumb-height pixels
             Set thumbnail height.

     -y, --thumb-width pixels
             Set thumbnail width.

     -J, --thumb-redraw n
             Only relevant for --thumbnails: Redraw thumbnail window every n images.  In feh <= 1.5, the thumbnail image used to be redrawn after
             every computed thumbnail (so, it updated immediately).  However, since the redrawing takes quite long (especially for thumbnail mode
             on a large filelist), this turned out to be a major performance penalty.  As a workaround, the thumbnail image is redrawn every 10th
             image now by default. Set n = 1 to get the old behaviour, n = 0 will only redraw once all thumbnails are loaded.

INDEX MODE OPTIONS
     -@, --title-font font
             Set font to print a title on the index, if no font is specified, no title will be printed.

BACKGROUND SETTING
     feh can also be used as a background setter.  Unless you pass the --no-fehbg option, it will write a script to set the current background to
     ~/.fehbg.  So to have your background restored every time you start X, you can add "sh ~/.fehbg &" to your X startup script (such as
     ~/.xinitrc).  As of feh 2.13, this script is executable, so "~/.fehbg &" will work as well.

     For the --bg-center and --bg-max options, you can use the --geometry option to specify an offset from one side of the screen instead of cen‐
     tering the image.  Positive values will offset from the left/top side, negative values from the bottom/right.  +0 and -0 are both valid and
     distinct values.

     Note that all options except --bg-tile support Xinerama.  For instance, if you have multiple screens connected and use e.g.  --bg-center, feh
     will center or appropriately offset the image on each screen.  You may even specify more than one file, in that case, the first file is set
     on screen 0, the second on screen 1, and so on.

     Use --no-xinerama to treat the whole X display as one screen when setting wallpapers. You may also use --xinerama-index to use feh as a back‐
     ground setter for a specific screen.

     --bg-center
             Center the file on the background.  If it is too small, it will be surrounded by a black border

     --bg-fill
             Like --bg-scale, but preserves aspect ratio by zooming the image until it fits.  Either a horizontal or a vertical part of the image
             will be cut off

     --bg-max
             Like --bg-fill, but scale the image to the maximum size that fits the screen with black borders on one side.

     --bg-scale
             Fit the file into the background without repeating it, cutting off stuff or using borders.  But the aspect ratio is not preserved
             either

     --bg-tile
             Tile (repeat) the image in case it is too small for the screen

     --no-fehbg
             Do not write a ~/.fehbg file

FORMAT SPECIFIERS
     %f      Image path/filename

     %F      Escaped image path/filename (for use in shell commands)

     %h      Image height

     %l      Total number of files in filelist

     %L      Temporary copy of filelist. Multiple uses of %L within the same format string will return the same copy.

     %m      Current mode

     %n      Image name

     %N      Escaped image name

     %o      x,y offset of top-left image corner to window corner in pixels

     %p      Number of image pixels

     %P      Number of image pixels (kilopixels / megapixels)

     %r      Image rotation. A half right turn equals pi.

     %s      Image size in bytes

     %S      Human-readable image size (kB / MB)

     %t      Image format

     %u      Number of current file

     %w      Image width

     %v      feh version

     %V      Process ID

     %z      current image zoom

     %%      A literal %

CONFIGURATION
     feh has three config files: themes for theme definitions, keys for key bindings and buttons for mouse button bindings.  It will try to read
     them from $XDG_CONFIG_HOME/feh/, which (when XDG_CONFIG_HOME is unset) defaults to ~/.config/feh/.  If the files are not found in that direc‐
     tory, it will also try /etc/feh/.

     All config files treat lines starting with a "#" character as comments.  Note that mid-line comments are not supported.

THEMES CONFIG SYNTAX
     .config/feh/themes allows the naming of option groups, called themes.

     It takes entries of the form "theme options ...", where theme is the name of the entry and options are the options which will be applied when
     the theme is used.  Note that the options are not parsed by any shell. Therefore, filename expansion ("*.jpg" and similar) is not supported.
     Quoting with both single and double quotes works, though.

     An example entry would be "imagemap -rVq --thumb-width 40 --thumb-height 30 --index-info '%n\n%wx%h'".

     You can use this theme in two ways.  Either call "feh -Timagemap *.jpg", or create a symbolic link to feh with the name of the theme you want
     it to use.  For the example above, this would be "ln -s `which feh ` ~/bin/imagemap".  Now just run "imagemap *.jpg" to use these options.

     Note that you can split a theme over several lines by placing a backslash at the end of an unfinished line.

     Command line options always override theme options.

KEYS CONFIG SYNTAX
     .config/feh/keys defines key bindings.  It has entries of the form "action [key1 [key2 [key3]]]".

     Each key is an X11 keysym name as shown by xev(1), like "Delete".  It may optionally start with modifiers for things like Control, in which
     case key looks like mod-keysym (for example "C-Delete" for Ctrl+Delete or "C-1-Delete" for Ctrl+Alt+Delete)

     Available modifiers are C for Control, S for Shift and 1, 4 for Mod1 and Mod4.  To match an uppercase letter like "S" instead of "s", the
     Shift modifier is not required.

     Specifying an action without any keys unbinds it (i.e. the default bindings are removed).

     Note: Do not use the same keybinding for multiple actions.  feh does not check for conflicting bindings, so their behaviour is undefined.
     Either unbind the unwanted action, or bind it to another unused key.  The order in which you bind / unbind does not matter, though.

     For a list of the action names, see KEYS.

KEYS
     In an image window, the following keys may be used (The strings in [square brackets] are the config action names):

     a [toggle_actions]
             Toggle actions display (see --draw-actions)

     A [toggle_aliasing]
             Enable/Disable anti-aliasing

     c [toggle_caption]
             Caption entry mode.  If --caption-path has been specified, then this enables caption editing.  The caption at the bottom of the
             screen will turn yellow and can be edited.  Hit return to confirm and save the caption, or escape to cancel editing.  Note that you
             can insert an actual newline into the caption using ⟨CTRL+return⟩.

     d [toggle_filenames]
             Toggle filename display (see --draw-filename)

     e [toggle_exif]
             (only if compiled with exif=1) Toggle EXIF tag display

     f [save_filelist]
             Save the current filelist as "feh_PID_ID_filelist"

     h [toggle_pause]
             Pause/Continue the slideshow.  When it is paused, it will not automatically change slides based on --slideshow-delay.

     i [toggle_info]
             Toggle info display (see --info)

     k [toggle_keep_vp]
             Toggle zoom and viewport keeping. When enabled, feh will keep zoom and X, Y offset when switching images.

     m [toggle_menu]
             Show menu.  Use the arrow keys and return to select items, ⟨escape⟩ to close the menu.

     n, ⟨Space⟩, ⟨Right⟩ [next_img]
             Show next image. Selects the next image in thumbnail mode.

     o [toggle_pointer]
             Toggle pointer visibility

     p, ⟨Backspace⟩, ⟨Left⟩ [prev_img]
             Show previous image. Selects the previous image in thumbnail mode.

     q, ⟨Escape⟩ [quit]
             Quit feh

     r [reload_image]
             Reload current image.  Useful for webcams

     s [save_image]
             Save the current image as "feh_PID_ID_FILENAME"

     v [toggle_fullscreen]
             Toggle fullscreen

     w [size_to_image]
             Change window size to fit current image size

     x [close]
             Close current window

     z [jump_random]
             Jump to a random position in the current filelist

     <, > [orient_3, orient_1]
             In place editing - rotate the images 90 degrees (counter)clockwise.  The rotation is lossless, but may create artifacts in some image
             corners when used with JPEG images.  Rotating in the reverse direction will make them go away.  See jpegtran(1) for more about loss‐
             less JPEG rotation.  Note: jpegtran does not update EXIF orientation tags. However, feh assumes that you use the feature to normalize
             image orientation and want it to be displayed this way everywhere. After every rotation, it will unconditionally set the EXIF orien‐
             tation to 1 ("0,0 is top left").  Should you need to reverse this, see jpegexiforient(1).

     _ [flip]
             In place editing - vertical flip

     | [mirror]
             In place editing - horizontal flip.  Again, see jpegtran(1) for more information.

     0 .. 9 [action_0 .. action_9]
             Execute the corresponding action (0 = --action, 1 = --action1 etc.)

     ⟨Return⟩ [action_0]
             Run the command defined by --action

     ⟨home⟩ [jump_first]
             Show first image

     ⟨end⟩ [jump_last]
             Show last image

     ⟨page up⟩ [jump_fwd]
             Go forward ~5% of the filelist

     ⟨page down⟩ [jump_back]
             Go backward ~5% of the filelist

     + [reload_plus]
             Increase reload delay by 1 second

     - [reload_minus]
             Decrease reload delay by 1 second

     ⟨delete⟩ [remove]
             Remove current file from filelist

     ⟨CTRL+delete⟩ [delete]
             Remove current file from filelist and delete it

     ⟨keypad left⟩, ⟨Ctrl+Left⟩ [scroll_left]
             Scroll to the left

     ⟨keypad right⟩, ⟨Ctrl+Right⟩ [scroll_right]
             Scroll to the right

     ⟨keypad up⟩, ⟨Ctrl+Up⟩ [scroll_up]
             Scroll up

     ⟨keypad down⟩, ⟨Ctrl+Down⟩ [scroll_down]
             Scroll down.  Note that the scroll keys work without anti-aliasing for performance reasons, hit the render key after scrolling to
             antialias the image.

     ⟨Alt+Left [scroll_left_page]⟩
             Scroll to the left by one page

     ⟨Alt+Right [scroll_right_page]⟩
             Scroll to the right by one page

     ⟨Alt+Up [scroll_up_page]⟩
             Scroll up by one page

     ⟨Alt+Down [scroll_down_page]⟩
             Scroll down by one page

     R, ⟨keypad begin⟩ [render]
             Antialias the image.  Opens the currently selected image in thumbnail mode.

     ⟨keypad +⟩, ⟨Up⟩ [zoom_in]
             Zoom in

     ⟨keypad -⟩, ⟨Down⟩ [zoom_out]
             Zoom out

     *, ⟨keypad *⟩ [zoom_default]
             Zoom to 100%

     /, ⟨keypad /⟩ [zoom_fit]
             Zoom to fit the window size

   MENU KEYS
     The following keys bindings are used for the feh menu:

     ⟨Escape⟩ [menu_close]
             Close the menu

     ⟨Up⟩ [menu_up]
             Highlight previous menu item

     ⟨Down⟩ [menu_down]
             Highlight next menu item

     ⟨Left⟩ [menu_parent]
             Highlight parent menu item

     ⟨Right⟩ [menu_child]
             Highlight child menu item

     ⟨Return⟩, ⟨Space⟩ [menu_select]
             Select highlighted menu item

BUTTONS CONFIG SYNTAX
     .config/feh/buttons.  This works like the keys config file: the entries are of the form "action [binding]".

     Each binding is a button name.  It may optionally start with modifiers for things like Control, in which case binding looks like mod-button
     (for example C-1 for Ctrl + Left button).

     Note: Do not use the same button for multiple actions.  feh does not check for conflicting bindings, so their behaviour is undefined.  Either
     unbind the unwanted action, or bind it to another unused button.  The order in which you bind / unbind does not matter, though.

     For the available modifiers, see KEYS CONFIGURATION SYNTAX.

   BUTTONS
     In an image window, the following buttons may be used (The strings in [square brackets] are the config action names):

     [reload]
             Reload current image

     1 ⟨left mouse button⟩ [pan]
             pan the current image

     2 ⟨middle mouse button⟩ [zoom]
             Zoom the current image

     3 ⟨right mouse button⟩ [menu]
             Toggle menu

     4 ⟨mousewheel down⟩ [prev]
             Show previous image

     5 ⟨mousewheel up⟩ [next]
             Show next image

     Ctrl+1 [blur]
             Blur current image

     Ctrl+2 [rotate]
             Rotate current image

     unbound [zoom_in]
             Zoom in

     unbound [zoom_out]
             Zoom out

MOUSE ACTIONS
     Default Bindings: When viewing an image, mouse button 1 pans the image (moves it around) or, when only clicked, moves to the next image
     (slideshow mode only).  Quick drags with less than 2px of movement per axis will be treated as clicks to aid graphics tablet users.  Mouse
     button 2 zooms (click and drag left->right to zoom in, right->left to zoom out, click once to restore zoom to 100%) and mouse button 3 opens
     the menu.

     CTRL+Button 1 blurs or sharpens the image (drag left to blur, right to sharpen); CTRL+Button 2 rotates the image around the center point.

     A note about pan and zoom modes: In pan mode, if you reach a window border but haven't yet panned to the end of the image, feh will warp your
     cursor to the opposite border so you can continue panning.

     When clicking the zoom button and immediately releasing it, the image will be back at 100% zoom.  When clicking it and moving the mouse while
     holding the button down, the zoom will be continued at the previous zoom level.  The zoom will always happen so that the pixel on which you
     entered the zoom mode remains stationary.  So, to enlarge a specific part of an image, click the zoom button on that part.

SIGNALS
     In slideshow mode, feh handles the following signals:

     SIGUSR1
             Switch to next image

     SIGUSR2
             Switch to previous image

USAGE EXAMPLES
     Here are some examples of useful option combinations. See also: ⟨http://feh.finalrewind.org/examples/⟩

     feh /opt/images
             Show all images in /opt/images

     feh -r /opt/images
             Recursively show all images found in /opt/images and subdirectories

     feh -rSfilename /opt/images
             Same as above, but sort by filename. By default, feh will show files in the order it finds them on the hard disk, which is usually
             somewhat random.

     feh -t -Sfilename -E 128 -y 128 -W 1024 /opt/images
             Show 128x128 pixel thumbnails, limit window width to 1024 pixels.

     feh -t -Sfilename -E 128 -y 128 -W 1024 -P -C /usr/share/fonts/truetype/ttf-dejavu/ -e DejaVuSans/8 /opt/images
             Same as above, but enable thumbnail caching in ~/.thumbnails and use a smaller font.

     feh -irFarial/14 -O index.jpg /opt/images
             Make an index print of /opt/images and all directories below it, using 14 point Arial to write the image info under each thumbnail.
             Save the image as index.jpg and don't display it, just exit.  Note that this even works without a running X server

     feh --unloadable -r /opt/images
             Print all unloadable images in /opt/images, recursively

     feh -f by_width -S width --reverse --list .
             Write a list of all images in the directory to by_width, sorted by width (widest images first)

     feh -w /opt/images/holidays
             Open each image in /opt/images/holidays in its own window

     feh -FD5 -Sname /opt/images/presentation
             Show the images in .../presentation, sorted by name, in fullscreen, automatically change to the next image after 5 seconds

     feh -rSwidth -A "mv %F ~/images/%N" /opt/images
             View all images in /opt/images and below, sorted by width, move an image to ~/image/image_name when enter is pressed

     feh --start-at ./foo.jpg .
             View all images in the current directory, starting with foo.jpg.  All other images are still in the slideshow and can be viewed nor‐
             mally

     feh --start-at foo.jpg *
             Same as above

     feh --info "exifgrep '(Model|DateTimeOriginal|FNumber|ISO|Flash)' %F | cut -d . -f 4-" .
             Show some EXIF information, extracted by exifprobe/exifgrep

     feh --action 'rm %F' -rl --max-dim 1000x800
             Resursively remove all images with dimensions below or equal to 1000x800 pixels from the current directory.

TILING WINDOW MANAGERS
     feh was created with a floating window layout in mind.  However, as of 2.0.1, it has limited support for tiling window managers.

     Specifically, the --scale-down and --auto-zoom options will detect a tiling environment and scale the image up / down to the current window
     size.  Unfortunately, this causes every image to be rendered twice: First in a normal fashion, and then (after noticing that the window is
     being tiled) again with the correct zoom level.

     This is a known bug and will hopefully get fixed some time. For now, it can be avoided by using --geometry 500x500 (or any other geometry).
     This will have the same behaviour as --scale-down, but without the flickering.

DEPENDENCIES
     feh requires the jpegtran and jpegexiforient binaries (usually distributed in "libjpeg-progs" or similar) for lossless rotation.

     To view images from URLs such as http://, you need feh compiled with libcurl support (enabled by default).  See the VERSION section.

BUGS
     Thumbnail mode is somewhat inefficient, and because of that not nearly as fast as it could be.

     --scale-down does not take window decorations into account and may therefore make the window slightly too large.

   REPORTING BUGS
     If you find a bug, please report it to ⟨derf+feh@finalrewind.org⟩ or via ⟨http://github.com/derf/feh/issues⟩.  You are also welcome to direct
     any feh-related comments/questions/... to #feh on irc.oftc.net.

     Please include the feh version ⟨the output of "feh --version"⟩, steps to reproduce the bug and, if necessary, images to reproduce it.

FUTURE PLANS
     Plans for the following releases:
     ·   Make zoom options more intuitive

LICENSE
     Copyright (C) 1999, 2000 by Paul Duncan.  Copyright (C) 1999, 2000 by Tom Gilbert (and various contributors).  Copyright (C) 2010-2014 by
     Daniel Friesel (and even more contributors).

     Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Soft‐
     ware"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distrib‐
     ute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the follow‐
     ing conditions:

     The above copyright notice and this permission notice shall be included in all copies of the Software and its documentation and acknowledg‐
     ment shall be given in the documentation and software packages that this Software was used.

     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MER‐
     CHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
     LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
     DEALINGS IN THE SOFTWARE.

     Current developer: Daniel Friesel ⟨derf@finalrewind.org⟩

     Original author (no longer developing): Tom Gilbert ⟨feh_sucks@linuxbrit.co.uk⟩

     See also: http://feh.finalrewind.org

BSD                                                              November 07, 2015                                                             BSD

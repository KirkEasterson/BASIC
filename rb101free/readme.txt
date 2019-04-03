Run BASIC Personal Server - Release notes

Installation under Linux:

Since we don't have an actual Linux installer for Run BASIC yet,
simply extract to a convenient folder.

Starting Run BASIC:

-cd to the Run BASIC folder
-Type ./rbp rb.im

Note: If Run BASIC hangs on startup make sure there are no other
 applications running on port 8008.

Run BASIC v1.0.1 build 2.44 release notes - Nov 4, 2008
--------------------------------------------------------------------

-More fleshing out of Run BASIC documentation

-Added some more example programs and enhancement of others.

-Added code to transfer values from a program that uses RUN to start
another program.  The values are: UserInfo$, UrlKey$, UserAddress$,
ProjectRoot$, ResourceRoot$, and #request

-Added NullColumn and NullColumn$ global variables which define the
values for NULL values returned from a QueryResultRow object.  The
user can change this from zero and empty string respectively.

-Fixes a bug in the SQLite interface where a runtime error is thrown
if a SELECT is performed immediately after opening a database for
the first time without disconnecting and reconnecting.

-Fixed a bug in the compiler where SELECT CASE isn't followed by
END SELECT and the error isn't properly reported.

-Improved compile error reporting for malformed SUBs and FUNCTIONs.

-Changed the SHELL$() function to use the default shell instead of
the C shell, which isn't installed by default in many Linuxes.

-Fixed the Launch in Browser button to work in more Linux distros.

-Changed the preferences tab to set the login key to be 'login' if
the homepage app is set and the user forgets to set the login key.

-Enhanced the SMTPSENDER to allow the specification of sender
fullname using this format "John Doe<john@doe.net>"

-Fixed a bug with USING() function which wasn't being consistently
typechecked.  The following would not compile:

  a$ = using("##.###", 3.1)

-Fixed a bug which was causing applications to hang after half an
hour of inactivity.


Run BASIC v1.0.1 build 2.42 beta 3 release notes - Sep 25, 2008
--------------------------------------------------------------------

-Extended the PASSWORDBOX statement so that width can be specified
by adding an optional size parameter, like so:

  'create a password box 15 wide
  passwordbox #pwb, "abc123", 15

-Fixed a bug in the UPLOAD statement which was throwing a
Message Not Understood error.

-Extended the RUN statement so that it can also be used to run
plain source files that end in .bas and not just project files.

-First version made available for Linux.  Tested on Ubuntu.

-Fixed a bug where the httpget$(url$) function was only returning
the value of url$

-Made some adjustments to force coercion of floating point values
to double precision instead of single precision.

-Changed the default number of displayed precision for floating
point values to 9 digits instead of 6.

-Fixed a bug where the UPLOAD statement was throwing an exception
when inside of a DIV block.

-Added support for SQLite for Power PC Macs. Tested on 10.3.x and
10.4.x on G4 Macs.  Not supported on 10.2.x.

-Added a shell$(expr$) function which sends expr$ to a command line
shell and returns the text output.

-Fixed a bug with the date$() and time$() methods on the file
accessor which would sometimes fail with Message Not Understood
error.

-Added a #nextrow() method to the SQLite database accessor.  This
object can then be queried for individual column values like so:

  #row = #dbAccessor #nextrow()
  print #row name$()
  print #row age() 

-Extended the documentation (still more to come).


Run BASIC Personal Server - Release notes

Run BASIC v1.0.1 build 2.38 beta 2 release notes - July 12, 2008
--------------------------------------------------------------------

-First Mac release which has been tested on OS 10.5 for Intel.

-Some new and updated example projects

-Added a HEAD statement similar to the HTML statement but which
allows a program to embed output into the HEAD section of a web
page.  This is useful for Javascript and CSS, amongst other things.

  HEAD "This will appear at the top of the page"

The CLS statement will clear the contents of the HEAD statement.

Note: Embedded programs cannot render to the HEAD.

-Added a BUTTON statement which works just like a LINK statement but
instead inserts a submit button into the page:

  button #bttn, "Click me", [buttonAction]
  wait

[buttonAction]
  print "done"
  wait

-Added an IMAGEBUTTON statement, which can display a graphic file as
a button.  It has a tooltip method so you can specify popup help for
the button.

  imagebutton #run, "/runbutton.png", [run]
  #run tooltip("Run")
  wait

[run]
  print "Running..."
  wait

-Added an HTTPPOST$() function to enable POSTing to HTTP servers.

  print httppost$("http://www.house.gov/htbin/wrep_findrep", _
    "state=MAMassachusetts&zip=01721&zip4=1238")

-Added a #request object which wraps the last request.  The object
is global.  For now there is just a single method GET$() which
returns a named property from the submitted form.

  html "<textarea name='message'>Type something here</textarea>"
  button #submit, "Submit", [go]
  wait

[go]
  print #request get$("message")
  wait

-Added an SMTPSENDER statement which creates an object for sending
email using an SMTP server.

  smtpsender #aSender, "mail.server.com"
  #aSender password("trytoguess")
  fromAddr$ = "myaccount@server.com"
  toAddr$ = "mybuddy@gmail.com"
  #aSender send(fromAddr$, toAddr$, _
      "Do you want some pie?", _
      "Apple please, with vanilla ice cream!")

-Extended the TEXTBOX statement with an additional optional
parameter that specifies the size of the widget in columns.

  textbox #box, "Here is some content", 35


Run BASIC v1.0.1 build 2.35a beta 1 release notes - March 7, 2008
--------------------------------------------------------------------

-Added the ability to specify a default html or htm file for the
home page application so now the server will allow you to have a
regular HTML file as a welcome screen, and you can link to RB apps
from that page if you want.

-Run BASIC was not serving static files when running under Windows
2000. Fixed.

-When logging out of a Run BASIC development session, the browser
no longer redirects to localhost unless it should.

-When RB reports a compile error, the link to the help file is no
longer broken.

-Clicking the close X button on the console window now presents an
opportunity to cancel the close action.

-Graphics rendered inside of a DIV would in certain circumstances
be rendered after the DIV. Fixed.

-Sometimes rendering a TABLE would result in an out of bounds
exception. Fixed.

-DefaultDir$ and Platform$ were not being declared global by
default. Fixed.

-Use of the UPLOAD statement was causing badly formed XHTML to be
generated, and this would cause any links rendered on the page
to cause the application to return to the login page when clicked.
This meant there was no way to abort an upload operation by
defining a link to do so.

-Use of CSSCLASS inside a DIV was causing Run BASIC to hang. Fixed. 

-Fixed a bug where the HTTPGET() function was failing when a Run
BASIC server would call itself or another Run BASIC server on the
same machine.

-Removed a restriction on the number of permitted parameters for SUBs
and FUNCTIONs.  Was 5.  Now unlimited.

-Added a Save As button to the Run BASIC toolbar.  Makes a new
project with the specified name.

-Added a Refresh button to the Run BASIC toolbar which reloads the
editor with the contents of the disk file.  This is useful if you
want to use a different editor to write your Run BASIC programs.

-Tweaked the compiler to permit CR+LF, CR, and LF line breaks in
the code.  This is handy to support different browsers and editors.

-Fixed a bug in the DECHEX$() function so that it won't break when
non a integer value is used.

-Fixed a bug in the MID$() function where a runtime exception would
be thrown in the positional parameters are outside the size of the
string being operated on.  Now if you specify out of bounds values
MID$() will return an empty string.

-Modified the SETKEY() method so that it doesn't set the ID value
in the anchor tag.

-Added a SETID() method to set the ID value in generated HTML for
the following web widgets: LINK, CHECKBOX, TABLE, LISTBOX, TEXTBOX,
TEXTAREA, PASSWORDBOX.  By default the ID will be the same as the
widget's handle.

-Extended the help files, especially about built-in functions.


Version 1.0 build 2.33h - Jan 5, 2008
----------------------------------------------------------------------

-Run BASIC was defaulting to the EST -5 time zone.  Fixed.

-When reading floating point values from SQLite query results, Run
 BASIC was appending a letter d indicating double float format.
 Removed.

Version 1.0 build 2.33g - Dec 27, 2007
----------------------------------------------------------------------

-Fixed the change password feature so that it only requires a single
 Accept and no longer requires that the Preferences page Accept button
 also be clicked.

-The sessionexpired.html page was located in the wrong place. Moved it
 to the public folder and tweaked it so that it worked when using Run
 BASIC from a remote computer.


Version 1.0 build 2.33f - Dec 22, 2007
----------------------------------------------------------------------

-SETFOCUS() was not working for textarea objects.  Fixed.

-Changed the RowIndex variable to start at zero instead of one.

-Fixed a bug in the ON ERROR GOTO mechanism which was causing an
 infinite loop if the specified handler did not exist.

-Removed the unimplemented LOC() function from the docs and removed
 its keyword from the compiler's token list.

-Added a compile-time check to make sure that global variable names
 cannot conflict with user function names because this causes some
 confusion with the way assignment works.


Version 1.0 build 2.33e - Dec 19, 2007
----------------------------------------------------------------------

-Added a ProjectsRoot$ variable which points to the folder where
 projects are stored.

-Added a ResourcesRoot$ variable which points to the folder where
 web servable files are placed.

-Added a RowIndex variable to get the numeric index of a table or
 database accessor link when it is clicked.

-Added the RMDIR() and MKDIR() functions and a KILL statement.

-Fixed a bug that was causing large page loads to fail on IE6 and IE7.

-Added a SETFOCUS() method to textboxes and textareas.

-Fixed several parser bugs.

-Added support for branch labels as handlers for table and database
 accessor links.

-Fixed the UPLOAD statement, which was not saving the uploaded file
 to disk.

-Modified the rendering of graphic files so that they are written to
 the images folder in the resources root folder.

-Fixed a bug where any database accessor that is rendered more than
 once per web page was always rendering the last state of the
 accessor.

Beta 5, build 2.32p release notes - Nov 9, 2007
----------------------------------------------------------------------

Some of the example programs have been modified to work with the new
treatment of object variables.  This amounted to defining some object
variables to be global.  Also there were a couple of examples that
needed to have PRINT statements added after RENDER statements.

The documentation has also been expanded with more expected by general
release.

-Added a #null variable which can't be assigned to, so it's always null.
 This handy for testing to see if something is null:

    if #thisVar <> #null then do something

-Added the following handy methods to graphic objects

    #graphic width()    'how many pixels wide is the graphic?
    #graphic height()   'how many pixels high is the graphic?
    #graphic stringwidth(str$)   'how many pixels wide is str$

-Fixed the date$() function so that it can return a numeric value for
 a date when given a date as a string in either of these two formats:

  print date$("4/1/2007")
  print date$("1 Apr, 2007")

-The complete code for REDIM was missing from beta 4.  Fixed.

-Changed the icon from the Smalltalk one to one designed for Run BASIC.

-Changed the type of tag used with the toolbar buttons to make the
 IDE useful in Safari.

-Added a Resources Root field to the Preferences tab which specifies
 where web file resources are served from.  This provides a location
 separate from the projects root to improve security.  Put HTML,
 image, and other files in here if you want them to be served up by
 the Run BASIC web server.

-Added a Server Port field to the Preferences page.  When changing the
 port Run BASIC will open a new browser pointing at the new port.

-Changed the RENDER statement so that it doesn't execute a CR after
 rendering.  This is to make it more consistent with the way other UI
 artifacts are rendered.  Placing a semicolon at the end of a RENDER
 statement will now produce a syntax error.

-Removed some more limits imposed by the free version

-Changed the INPUT statement so that it does not keep the old value of
 the variable if the user just hits Enter but instead uses either a
 zero or an empty string appropriately.

-Made object variables (aka handles) behave like string and numeric
 variables in their scoping.  They are now no longer global by default.
 Also, they can be declared global like other variables can:

    global #myObject, myNumber, myString$

 Object variables can now be unassigned in which case they hold onto
 a null object.  You can test for null by sending isnull() to any
 object variable:

    if #someHandle isnull() then do something

-Added a LOADGRAPHIC command which not only loads an image file but
 also creates a graphic object for it which understands all the methods
 of a graphic object.

    loadgraphic #handle, imageFilePath$

-Widget objects were not throwing exceptions when a program would try
 to call a method that wasn't supported.  Fixed.

-Added a debug$() method to objects so that you can tell what they are.
 This works with null objects too:

   'initially it is null
   print #anObject debug$()

   'now make it a graphic object
   graphic #anObject, 10, 10
   print #anObject debug$()

-Added a proper Run BASIC about box.

-Removed most of the configuration settings in the server console
 window.  Run BASIC will be configured through the web browser.

-Changed the error message for out of bounds on arrays to "Index out of
 bounds"

-Fixed a bug which was preventing SQLITECONNECT from working when a
 database accessor is passed into a SUB or FUNCTION.

-Fixed the UPLOAD statement which was still saving uploaded files into
 the virtual file system of the free site.

-Fixed the OPEN statement which was crashing when used inside a SUB or
 FUNCTION.

-Fixed a bug which causing a palette related error when loading some
 kinds of graphic files using LOADIMAGE

-Fixed a bug that was causing the last code changes made since a run
 or save to be lost if the user switched tabs in the IDE.


Beta 4, build 2.32m release notes - Oct 6, 2007
----------------------------------------------------------------------

-Modified SQLite and table objects to use TH tags for the column
 headers.  Added THCLASS() methods to both kinds of objects.

-Using CSS with embedded programs was causing the server to crash.
 Fixed.

-Added a FILES statement, which returns a file accessor object
 having the following methods:

 HASANSWER(), NEXTFILE$(), ROWCOUNT(), NAME$(), SIZE(), DATE$(),
 TIME$(), ISDIR(), RESET(), DATEFORMAT(), TIMEFORMAT()

-Added an XMLPARSER statement which returns an XML accessor object
 having the following methods:

 ELEMENTCOUNT(), KEY$(), VALUE$(), ATTRIBCOUNT(), ATTRIBKEY$(),
 ATTRIBVALUE$(), #ELEMENT()

-The compiler was permitting duplicate SUB and FUNCTION names.
 Fixed.

-The _app URL key was changed to app (removing the _) in beta 3 but
 no mention was made in the docs.  Now corrected.

-A problem where the editor would incorrectly adopt the name of
 an existing project if an attempted save using an existing project
 name was cancelled, is now fixed.

-Added the following new methods to different objects

 SQLite object - CAPTIONCLASS(), THCLASS(), ALLCLASS()
 Table object - LINK(), CAPTIONCLASS(), THCLASS(), ALLCLASS()
 Textbox object - TEXT(), PRINT(), PRINTLN()
 Textarea object - TEXT(), PRINT(), PRINTLN()
 
-Added an option to the Preferences tab to enable the saving of an
 extra copy of the source each time it is saved.  The second copy
 of the file has date and time information in the filename so as
 to provide a lightweight versioning mechanism.  No UI for loading
 a specific version of the file is included yet.

-LINE INPUT was crashing at the end of file instead of throwing a
 runtime exception. Fixed.

-Tweaked the way line breaks are handled to eliminate the double
 spacing problem on Firefox.

-Changed some of the CSS tags for the IDE by adding runBasic to
 their names.  This is to help prevent tag collisions by user's
 own tags.  More tags will be renamed.

-Logging out of the IDE wasn't expiring the session.  Fixed.

-Saving code in the IDE wasn't properly closing the file.  Fixed.

-The MOD operator was being treated with case sensitivity by the
 compiler.  Fixed.

-Added REDIM statement

-Changed the IDE so that it terminates the current running program
 when loading a different project.

-Eliminated output limits and array size limits that are a part of
 security for the public demo site.

-The IDE now allows you to switch between the different tabs without
 forcing you to terminate the currently running program on the
 Project tab so now you can access the help page or the other tabs
 without stopping your program.


Beta 3, build 2.32f release notes - Sep 8, 2007
----------------------------------------------------------------------

-Replaced the exit confirmation with one more specific to Run BASIC

-Added some simple help and 'About' information to the Help tab.

-Added a resources folder, moved some files there from the Run
 BASIC root folder and changed references to these files in the
 calcCSS and blogCSS example projects

-Replaced the use of css with cssid in the blogCSS project

-Fixed a bug in the accessing of arrays, which exhibited itself
 when a rendering a table into a web page.

-Fixed a bug in the project save code, which was inserting an extra
 delimiter character in the file path.

-Added support for ONERRORGOTO [branchLabel].  The handler must be
 a branch label at the outmost scope (no handlers local to subs
 or functions).  RESUME is not supported.  See the testOnerrorgoto
 example project.

-Fixed a bug parsing the httpget$() function which was causing the
 function to be parsed as an array name if it wasn't typed in all
 lowercase letters.

-Added several useful runtime variables:

  Name          Sample data
  UserInfo$     "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)"
  Platform$     "win32"
  UrlKeys$      "app=appName&param1=value1&param2=value2"
  UserAddress$  "184.11.231.1" 

-Added a setKey("keyValue") function to links.  Look at the runWiki
 example project to see it used.  When a link is clicked the global
 variable EventKey$ will be set to the link's key or to the handle
 name of link if no key has been set.  EventKey$ is handy if you have
 opted to use a branch label for the link's event handler, but if
 you have chosen to use a sub instead, then the link's handle name
 or key will be passed in as the sole parameter of the sub.

 for x = 1 to 10
   link #aLink, "Option "; x, handleClick
   #aLink setkey("link"; x)
 next x

 We will add the setkey() function to other GUI objects in further
 betas.

-The date$() and time$() functions have been brought up to standards
 with Liberty BASIC.  In fact now you can specify a custom format
 for the date$() function which is something you couldn't do with LB.

 For example:  print date$("mm-dd-yyyy")

-Added an option Home Page App to the preferences tab to specify an
app to serve as the default one instead of the login screen.

-Added a Login key option for the user to specify a URL parameter
 to force the login screen to appear when the Home Page App is set
 (so you can still log in .

 http://localhost:8008/app=myLoginKey

-Added support for the binary file mode. See the httpget example. 

-Fixed a bug that caused the sieve2.bas program to crash

-When restarting Run BASIC it would forget the chosen apps to serve.
 This is now fixed.

Beta 2, build 2.32 release notes - Aug 20, 2007
----------------------------------------------------------------------

-Fixed some hard coded references in the server which caused the
server to fail when not in the presence of the software development
tools

#OCPDFGen#

##What it does##
This very basic library allows developers to create well-formatted text PDF files on iOS devices from CSS-formatted HTML.  The HTML is parsed using the excellent DTCoreText framework from Cocoanetics, which then turns the HTML string into an NSAttributedString.  A CoreText formatter is used to format the text onto pages, and full pagination support is enabled.

##Why you need it##
This code is great for creating PDF files on the fly without the use of a server.  I think that speaks for itself.

In my own projects I've often had to write PDF rendering code, and have benefited from using other's implementations on forums.  I thought I'd contribute my own work back.

##Supported Functionality##
The current CoreText PDF formatter does not include the image or high-level functionality that the DTCoreText libraries do.  So no img, hr, table commands.  Most text functions have been implemented by DTCoreText, and are rolled into the NSAttributedString that is parsed from the HTML.

##Usage##
The usage is very simple.  Open the Demo app and you'll quickly see how it works.  You provide the app your HTML as UTF8 formatted NSString.  It will take that HTML, parse it, place it on a PDF context, and save the PDF file to the app's Documents folder.  The class will then return the path to this PDF file to your app.  In the demo app, I hand the path off to a UIWebView so you can demo how the PDF looks.

The class also handles NSAttributedString if you've already generated that.  Though if you can already generate the NSAttributedString, I'd suggest just taking the CT framesetter in the app, and separating it out into its own class....  No need for the relatively heavy DTCoreText.

You can also supply a straight NSString if you're OK with Arial font and standard formatting...

##Installation##
Drag the DTCoreText folder into your project.  If you have enabled ARC, then DTCoreText will be happy.  If not, then you'll have to add the -fobjc-arc flag to all of the DTCoreText files in the "Compile Sources" section of the Build Phases tab of your target.  Then drag in OCPDFGenerator, include it in the files where you need to render PDF's, and leave it be.

(Side Note: DTCoreText depends on ARC.  I don't like ARC, so I've just enabled it for the files in DTCoreText in the demo project.)

##License##
This code is released under the BSD license.  You can use it in commercial and non-commercial code with attribution.


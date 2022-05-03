Yes, it's in English. The fellow who translates is busy with his studies. If you want to help, raise an issue on the repo. The quickest way to translate is to use a machine translator, proofread side by side with the source document, and make corrections when you think it's wrong or clumsy in the target language.

# Print extension

[Marketplace page](https://marketplace.visualstudio.com/items?itemName=pdconsec.vscode-print)

[English version](https://github.com/PeterWone/vsc-print) by Peter Wone

[ENGLISH](README.md) | [FRENCH](README.fra.md) | [Add a language](how-to-add-a-language.md)

## Markdown and source code, styled for print

* Print source code
* Print Markdown fully rendered

Source code gets line numbers and syntax colouring. Markdown is rendered with VS Code's preview rendering pipeline &mdash; many Markdown extensions work with printing.

## Platform independent printing

Print-jobs are rendered as styled HTML and served from an embedded webserver. When you print, your local web browser is launched to load the print-job and give you printing options like page orientation and margin size. So if you have a local browser that can print, and VS Code can launch it, you're in business. Known user platforms include Windows, Linux and OSX. 

### Troubleshooting on first launch

Print worked for thirty thousand people out of the box, but sometimes local settings and permissions can spoil the fun. Here are the problems we've seen so far. If something else is wrong, or you have an improvement idea, we invite you to log an issue on the GitHub repository.

#### Nothing seems to happen

If you try to print and nothing happens, restart VS Code. If it still doesn't work, your system may have a configuration or permission problem that won't let the browser launch. The default Firefox browser on Ubuntu gives trouble out of the box. Install Chromium (or Chrome, Edge, Brave...) and make it the default browser. If you don't want to make Chromium the default browser, read the manual for details of how to use a specific browser for printing and use Chromium to print.

#### Browser launches but no page loads

Your system settings are likely interfering with the embedded webserver. Aggressively locked-down network settings can do this. It's probably permissions. Whoever interfered with networking permissions should troubleshoot this.

#### Browser launches and shows an error message instead of a print-job

Examine the error message. Generally it's some sort of permission denied on aggressively locked down systems.

## Classic user experience

![Toolbar snap with print icon](https://user-images.githubusercontent.com/5498936/53408273-d853d480-3a09-11e9-8936-d37189dce8c5.PNG)

The print icon on the toolbar prints the document in the active editor.

If you have a text selection that crosses at least one line-break you can right click and choose `Print` from the context menu to send just the selection to the printer. In the absence of a multi-line selection the entire document is printed. You can control the position of `Print` in this menu, or remove it altogether.

![context-menu-editor](https://user-images.githubusercontent.com/5498936/53408378-05a08280-3a0a-11e9-8e88-0088089e0d07.png)

Or you can right-click on a file in the file explorer pane and choose Print from the context menu.

![context-menu-file-explorer](https://user-images.githubusercontent.com/5498936/53408376-05a08280-3a0a-11e9-9912-31e869db64d5.png)

## Features

Printing on Mac, Linux and Windows

* Entirely local in operation, no dependence on cloud services (third party Markdown extensions may introduce remote dependencies)
* Syntax colouring in a wide range of familiar colour schemes 
* Optional line numbering
* Adjustable line spacing (1, 1.5, 2)
* Print a selection of code with line numbers matching the editor
* Specify a browser other than your default
* Markdown documents are rendered when you print them (or not, there's a setting)
* Works with Microsoft remote host extensions for SSH, WSL and Docker containers

## Requirements

You'll need a web browser and access to a printer.

This extension is tested with Windows 10 with current builds of Chrome, Edge and Firefox.
I can't test on a Mac because I don't own one. Likewise I don't have any systems running Windows XP, 7 or 8.
If you use an untested combination then report bugs with test documents and snaps of failed outcomes.

## Extension Settings

VS Code Printing is highly configurable. Settings can be modified by going to Code > Preferences > Settings > Extensions > Printing.

**A detailed breakdown of these settings can be found in [the manual](https://github.com/PeterWone/vsc-print/blob/master/manual.md).**

## Choice of browser

The browser used will affect your experience.  

### Recommended for printing

Any Chromium derived browser should be fine. The following are known to work well.
* Brave
* Chromium
* Chrome
* Edge

### Not recommended for printing

* Firefox doesn't close the browser after printing completes.
* Edge Classic is no longer supported.
* Internet Explorer is not supported.

## Known Issues

### Markdown extensions and remoting

To use Print with a remote host you must install it **on the remote host**. 

To get the benefit of a Markdown extension when printing a document from a remote host, the Markdown extension must be built with an `extensionKind` of `workspace` _and_ it must be installed to the remote host. Most such extensions are not built for `workspace` but can be trivially fixed by the author. Raise an issue on the repo of the extension you want. 

Chrome may retain your printer, paper size and margin selections between print jobs.

Some Chrome command line options cause errors to be reported, even though printing succeeds. 

### Spaces in paths

On Windows you can't supply command-line options on the alternate browser path because we automatically put quotes around your path in case of spaces in file or folder names. (On other platforms auto-quoting is not done and you must manually escape spaces in file and folder names.) Work around this by creating a batch file in the same directory as the browser executable and use this to specify the options you require. For the browser path, supply the path to the batch file. Don't forget to pass through the URL parameter.

### Interference from Chrome plugins

Some Chrome plugins interfere with print job styling. While it is possible to suppress plugins with `--disable-plugins` this doesn't work when there is already a running instance of Chrome. The `--incognito` switch suppresses plugins when there is a running instance, but has its own problems.

For better results burn some disk space and install another browser such as Chromium, and use this for printing. You may be able to achieve a similar result without needing two browsers by using profiles on Edge.

### Indirect Internet dependencies

The Math+Markdown extension (installs the KaTeX plugin) requires an internet connection for stylesheets and fonts. You must also configure a stylesheet reference. Details are in the manual.

## Release Notes

### 0.9.14

- Emergency bugfix for printing unsaved files
- Emergency bugfix for printing files with Azure Uris that are not backed by a complete filesystem

### 0.9.13

- Emergency bugfix for printing a selection

### 0.9.12

- Emergency bugfix for resolution of local resources referenced by Markdown

### 0.9.11

- Total rewrite of file management in support of remote file systems
- Glob brace expressions can be nested
- Exclusion is forced for
  - `**/*.{exe,dll,pdb,pdf,hex,bin,png,jpg,jpeg,gif,bmp}` 
  - `{bin,obj}`
- Change to licence terms refusing licence to persons who fail to read the manual or seek assistance on by raising an issue on the GitHub repository

### 0.9.9
- Localise messages
- Improve settings UX for folder print exclusion and inclusion glob lists
- Guarantee exclusion of known unprintable file types
- Embed stylesheets and improve stylesheet setting UX
- New settings for customisation of Markdown rendering

### 0.9.8

- Adjust tag line to ensure that Markdown is mentioned when it is clipped.
- Capitalise all references to Markdown in readme file.
- Remove automatic quoting of alternate browser path due to incompatibility with Linux.
- Add German localisation

### 0.9.7

- Fix missing assets due to broken update in Microsoft's extension packaging and publishing tool (reversion to an earlier version resolved the missing assets)

### 0.9.6

- Change marketplace tag line.

### 0.9.5

- Security updates
- Work-around new bug in nodejs. The error handler is now always invoked when the browser is launched, and it is necessary to check whether the error object is null. This has caused spurious errors to be reported even though printing succeeds.
- Update readme to promote the (apparently rare) ability to print rendered Markdown. Thanks to Andy Barratt for suggesting this in his review.

### 0.9.4
- Update assets to compensate changes in Visual Studio Code 1.56
- PR101 display error message when browser launch fails, fix thanks to [baincd](https://github.com/baincd)
- PR97 rendered Markdown path fixes, fix thanks to [baincd](https://github.com/baincd)
- PR96 correct extensionKind UI setting in package.json, fix thanks to [baincd](https://github.com/baincd)
- PR94 update README to clarify browser differences and recommendation, fix thanks to [baincd](https://github.com/baincd)
- PR92 implements webserver timeout, thanks to [baincd](https://github.com/baincd)

### 0.9.3
- Further updates for language support
- Issue 88 Trying to print a new file that does not exist in the filesystem would cause an error message, a regression caused by internal changes in support of folder printing, fix thanks to [baincd](https://github.com/baincd)
- Issue 87 Blank lines don't print correctly, fix thanks to [baincd](https://github.com/baincd)

### 0.9.2
- Fix missing documentation and language translation issues

### 0.9.0
- Various dependencies updated to mitigate security risks.
- Syntax colouring fix for multi-line strings and comments, thanks to [gji](https://github.com/gji) closes #85 and #63
- Changed default stylesheet from vs2015 (a dark theme) to Atelier Dune.
- Added support for printing entire folders thanks to [alainx277](https://github.com/Alainx277).

### 0.8.3

- Updated `highlight.js` to latest version on advice from the keepers of `highlight.js`.
  - Removed potential vulnerabilities to HTML documents containing toxic script
  - Addresses minor colourisation issues (see #63)

### 0.8.2

- Removed port acquisition announcement setting as ports are no longer under user control.
- Corrected issue 68, an exception occurring when printing an editor buffer that does not have a corresponding file on disk, by typing the command.

### 0.8.1

- Because the host operating system now chooses the port for the embedded webserver, the webserver is created on first use and retained until the extension deactivates, so that the port allocation does not change. Code to decommissione the webserver after processing a request was not removed in 0.8.0 and is removed in 0.8.1 removing the risk of an unexpected change of port.

### 0.8.0
- Various issues describing high CPU use at extension startup are resolved by use of Webpack. 
- Port selection for the embedded webserver is now fully delegated to the host operating system. As a result the port range settings are no longer necessary and have been removed.
- No longer dependent on the portfinder package.

### 0.7.15

- Issue 64 - local images were broken because Microsoft changed VS Code. Markdown rendering no longer rewrites resource references to prefixed filepaths, they are now passed through unchanged. The extension now handles mapping to the filesystem.

### 0.7.14

- Issue 51 - add configuration in support of WSL, courtesy of [sburlap](https://github.com/sburlappp)
- Issue 54 - respect editor font when printing code

### 0.7.13

- Issue 48 - fix MD image path glitch.
- Update dependencies to address known vulnerabilities.

### 0.7.12

- Issue 40 - prevent double file extension producing an unhandled exception in the page generator stalling the embedded webserver resulting in an empty white browser window for a page load that does not complete.
- Issue 41 - handle unexpected exceptions in the page generator by delivering the error stack as the page content, thereby vastly improving diagnostic information in issues.

### 0.7.11

- Issue 39 - correction to inappropriately scoped regular expression causing colons to be escaped in the entire document when they should be escaped only in URLs.

### 0.7.9

- Issue 36 - corrected a problem with the internal rendering pipeline rewriting URLs to use a vscode internal protocol. This caused image references to work in the preview but fail in the browser.

### 0.7.8

- Issue 35 - stylesheet cache path incorrectly constructed on non-Windows file systems. This has now been corrected.

### 0.7.7

- Issue 33 - the editor tab-size setting was incorrectly retrieved and therefore not respected. This has now been corrected.
- Issue 34 - printing was failing for direct invocation (press `F1` then type Printing: Print finally press `Enter`). This has now been corrected.

### 0.7.6

- Localised to French.
- The Russian "localisation" is a stub (still in English) pending translations.
- Menu and icon availability now determined from editorLangId rather than resourceLangId. This should allow printing of unsaved documents and unrecognised file types per issues 31 and 32.

### 0.7.1

Now using VS Code's Markdown rendering pipeline.
- faster load
- smaller memory footprint
- Markdown extensions like [Markdown+Math](https://marketplace.visualstudio.com/items?itemName=goessner.mdmath) take effect when printing

### 0.7.0

- Bump minor version as 0.6.13 introduced new settings changing the UX
- Fix support for extended character sets and mixed languages in printed source code (#29) with thanks to Ekgart Vikentiy for reporting this.

### 0.6.13

Stub release because there's no other way to patch the readme.

### 0.6.12

- Settings to allow the user to move the range in which the embedded webserver chooses ports
- Moved default port range into the correct range for dynamic ports (was library default)
- Separate manual thanks to Nat Kuhn

### 0.6.9

- UTF-8 for extended charsets.
- Support images on local paths.

[ac WEB DESIGN](http://www.ac-webdesign.ch/) reported both these issues and provided test content.

### 0.6.8

- Control whether the embedded web server announces which port it acquires (off by default).
- Render Markdown with the same engine VS Code uses for preview.

### 0.6.7

Report acquired port to user with toast.

### 0.6.5

- Context menu position is now a setting.
- New store graphics.

### 0.6.2

Fixes command categories so they appear as

- Print: Browse for stylesheet
- Print: Print

The commands are present and functional in 0.6.1 but are not correctly categorised.

Colour scheme stylesheets are no longer selected from a combo-box. Instead there is a new command `Print: Browse for stylesheet` that spawns a file-browse dialog and updates the setting. If you choose a file outside the stylesheet cache it is copied into the cache so you don't become dependent on network-local resources.

Earlier versions occasionally had problems with port collisions causing printing to fail. A manual retry or three always fixed it but this was ugly. Correcting the problem was the primary focus of 0.5.3, and I am pleased to finally remove it from known issues.

Also addressed is [issue #17](https://github.com/PeterWone/vsc-print/issues/17) which moves responsibility for language detection from highlightjs (the library used for syntax colouring) to VS Code, falling back to highlightjs when an incompatible language code is produced.

Microsoft Edge always prompts for permission to close the browser after printing, which can be annoying.
Firefox doesn't prompt, it just plain doesn't close the browser, which is beyond annoying. As a result, Chrome is the recommended browser for printing.

### 0.6.2

Apply categories to commands.

### 0.6.1

Documentation tweak.

### 0.6.0

- Colour scheme stylesheet setting is no longer presented as a combo-box. Instead, there is a command that presents a file-browse dialog and updates the setting.
- Language detection falls back to highlightjs when VS Code produces an incompatible language identifier.

### 0.5.3

- Tab size respects editor setting.
- Responsibility for language detection moved from highlightjs to VS Code.


Rules for writing the User Manual:


1. All images will be already scaled with GIMP or Photoshop when they are included in manual with an <image> element. This is necessary because if we add the image/@scale attribute the image will not be displayed correctly in JavaHelp. Also scaling it may make the text look bad at edges.

2. Maximum width of images: 820 pixels. Maximum height of images: 750. For larger width or height scaling is necessary in XML (the image/@scale attribute) or in PDF which will NOT be done.

3. Use "you" instead of "I", ex: "You should go to menu Options ..." instead of "I go to menu Options ...". Exception: the Common Problems chapter where the question is formulated as: "I get a crash on Mac OS X when I try to start Oxygen. What should I do?"

4. List punctuation. Do not use ; to end list items (this is an old-fashioned approach that is not used in modern English). If each list item is a sentence, end it with a period. If each item is a sentence fragment, don't add any punctuation. Make sure all the items in the list are either sentences or fragments. Don't mix sentences and fragments in a list. Always use the same punctuation for every item in a list.

5. For review comments and questions, use Oxygen comments. When a decision is made that future authors might need to know about, record it in the text as a draft-note. Oxygen comments should be removed once they are dealt with. draft-notes should remain in the text so that we don't lose the history. 

6. Context sensitive help is connected to the interface by including the topic ids in the corresponding Java classes. (In other words, the code connects to ids in the docs, not the docs to ids the code as is the case in other systems. Topic ids should therefore remain stable as much as possible. Also, the topic id must match the file name of the topic file, minus the extension.

7. Representing the name of directories on the user's system: 

* To represent the Oxygen install directory in a file path, use [OXYGEN_DIR]
* To represent the Oxygen plugin install directory, use [OXYGEN_PLUGIN_DIR]
* To represent a framework directory with an unknown name, use [FRAMEWORK_DIR]
* To represent the Berkley DBXML directory: [DBXML_DIR]
* To represent the JDK install directory: [JDK_DIR]
* To represent a customization directory: [CUSTOMIZATION_DIR]
* To represent the user's home directory: [HOME_DIR]
* To represent the transformation output directory: [OUTPUT_DIR]
* [DITA_MAP_BASE_DIR]
* To represent other directories, use the same convention: [NAME_DIR], standardise the usage across the doc set, and add it to this list.

Don't create  placeholders for directories whose names are known, but whole location is not. Start the path at the directory whose name is local to the system. That is, don't write [FRAMEWORKS_DIR], write [OXYGEN_DIR]/frameworks.

8. Don't use <filepath> for variables that happen to represent paths, use <varname>. Don't use <filepath> for field values that happen to be pathnames, particularly if they include editor variables that stand for directory names, use <codeph>.

9. Don't use <uicontrol> for variable names just because the appear in the UI. Use <varname>
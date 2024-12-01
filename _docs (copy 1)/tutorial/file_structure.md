---
title: File Structure
sidebar: tutorial
next_doc: 
prev_doc: 
summary: Explaining the file structure of the website.
---

* TOC
{:toc}

# How Are The Files Structured?

The files are structured in a specific way so that the generator knows how to function. Understanding this structure will allow you to make many changes to your website. For this tutorial, I will be using Linux naming conventions, but it should be easy enough to understand for other operating systems. File systems are designed in a tree-like manner. There is a root node, and there can be directories in this node. 

> **Note:** You can design the website pretty much in any way you want. However, this will require some experimentation and skill with web development and Ruby.

## Directories with Files You Should Change

### Root

The root directory is the main base directory that the file is stored in. 

![ A screenshot of the root directory, showing its structure as described below.](/template-information-site/assets/images/tutorial/dir_contents_root.jpg)

> **Note:** In order to run the Git commands to push your work, your terminal should be in this root directory.

Let's go over important files that you will be editing for your website that are here. If a file is not listed here, it's best not to change it.

* ``404.html`` - This is the web page that is displayed if someone tries to access a page that does not currently exist.
* ``about.md`` - This is the markdown for the "About" page.
* ``_config.yml`` - This is a configuration file to determine how to run the website. [Please refer to the configuration settings for more details](/docs/tutorial/config).
* ``cv.md`` - This is the markdown for the "CV" page.
* ``index.md`` - This is the markdown for the front page.
* ``post.md`` - This is the markdown for the home page of the blog.
* ``README.md`` - This file is not part of the website, rather, it is used to explain information about the repository. Its contents are displayed below your files on GitHub.

### Assets

This directory stores assets used to display your webpage, such as important JavaScript and CSS files. Most of these files you will want to leave alone unless you know what you're doing. However, image files can be changed and added, such as ``.png``, ``.jpg``, ``.jpeg``, ``.gif``, ``.svg`` and ``.ico``. You can also reference them on your website.

> **Reminder:** You need to pay attention to the file extension. If you are trying to copy one file over another with the same filename for example, make sure they have the same extension too! If they don't, they're not considered the same file by the filesystem. Make sure the file extension is correct in your headers and image references too!

In this directory, the following files are used for their given purposes. If a file is not listed, it's best not to touch it unless you're a developer.

![ A screenshot of the assets directory, showing its structure as described below.](/template-information-site/assets/images/tutorial/dir_contents_assets.jpg)

* ``blog_photo.png`` - This is the image used for the sidebar of the blog.
* ``favicon.ico`` - This is the icon that appears next to the title of the website in the tab of the browser.
* ``img_me.jpg`` - This is the picture used on the About page. You can change what image to use here by changing the location of the image defined on line 6 of ``/about.md`` in the root directory.
* ``photo.png`` - This is the image used by default for the front page. You can change what image to use here by changing the location of the image defined in the ``photo:`` definition of the header of ``/index.md`` in the root directory.

Files in the ``/images`` subdirectory can be referenced in your documents, blog posts, and other places on your website. I like to organize ``/images`` further so that blog posts, documents, etc. all have their images stored in different places.

You can reference images in your text by doing markdown in this format:

```
![ Alt text for low vision and slow internet users ](/[base_directory]/assets/images/[file_directory]/[filename])
```

Where:
* ``base_directory`` is the base of your site, after the domain suffix, like ``.com`` or ``.org``. For example, for this website, it is ``template-information-site``, because this is what appears after the ``.com`` but before the actual page listing.
* ``file_directory`` is the path inside of the ``assets/images`` directory that leads to your image.
* ``filename`` is the exact filename of your image, including the extension.

If you did everything right, you should see an image like this:

![ A green parrot used as an example image of posting image assets. ](/template-information-site/assets/images/tutorial/parrot_test.jpg)

> **Reminder:** Don't forget about alt text! It's important that all images are described both in their content and their function to the reader, so that visually impaired and slow-internet-connection users can use your website too!

### _data

The files in this directory are data files that are used to structure certain data, such as how sidebars and the navigation bar are generated, and how text is generated for blog sections.

![ A screenshot of the data directory, showing its structure as described below.](/template-information-site/assets/images/tutorial/dir_contents_data.jpg)

These files are ``.yml`` files, which use special formatting to indicate content depth. [You can learn more about .yml files here](https://badgernested.github.io/template-information-site/docs/tutorial/file_types#data-files).

In this directory, the following files are used for their given purposes.
* ``blog_links.yml`` - You can add authors and topics onto your blog posts and you can easily search for posts based on those subjects. This file has the text that is displayed for each of those options for those subjects. See for example [the blog posts about the author Guattari](https://badgernested.github.io/template-information-site/author/guattari/), or [the blog posts about the subject of linguistics](https://badgernested.github.io/template-information-site/topic/linguistics/).
* ``footer.yml`` - This contains information about the link data placed on the bottom of the page. You can have a title, a description, and three columns of links.
* ``home.yml`` - This file contains the sidebar information shown on the home page.
* ``sample_subject.yml`` - This file contains the sidebar information for the "Understanding Birds" document series.
* ``sample_time.yml`` - This file contains the sidebar information for the "History of Gallunesia" document series.
* ``topnav.yml`` - This file contains the definition for the top navigation bar. It is split into single items and dropdown lists.
* ``tutorial.yml`` - This file contains the sidebar information for the "Tutorial on Use" document series.

As you can see, you can make a ``.yml`` file based on another sidebar and use it as a template to design your own. But keep in mind that ``.yml`` formatting can break easily, so be careful while editing and don't forget to use backups.

> Reminder: If you feel nervous about changing these files because of its specific structure, try saving a backup (just copy the old file before you make your changes) and then try changing it. If it completely breaks, just replace the backup. If you really screw things up you can just revert to the last functioning commit.

### _docs

All the files and subdirectories in this directory are used to store documents, such as this document here. Documents are different than blog posts because they are undated, and they are structurally organized rather than organized by tags.

The link to the document page is the same as ``/docs/[directories]/[filename]``

Where:

* ``directories`` is the path between the  ``docs`` directory to your file.
* ``filename`` is the file name, without the extension.

For example, this page is stored in ``_docs/tutorial/file_structure.md`` and can be accessed at ``https://badgernested.github.io/template-information-site/docs/tutorial/file_structure``, where ``https://badgernested.github.io/template-information-site/`` is the root of this website, and ``docs/tutorial/file_structure`` is where this page is stored.

### documents

This directory stores files that can be directly downloaded. For example, ``.pdf`` file downloads can be stored here, and then linked to. When a user clicks that link, they will download the file. On the server, the file is stored in ``/documents/[directories]/[filename]``

Where:

* ``directories`` is the path between the  ``documents`` directory to your file.
* ``filename`` is the file name, with the extension.

### _posts

Posts are blog posts, and have dates and tags to better organize them. You can have as many posts as you would like. It's a good idea to start a new post from an existing post, and copying its data, then clearing out its content, because then you can have the header data easily available.

In order for a post to generate, it must have ``YYYY-MM-DD-[post_title].md`` as its format, where:

* ``YYYY`` is the year number, as a 4 digit number.
* ``MM`` is the month number, as a 2 digit number. If the month is less than 10, it includes a 0 before it (for example, ``03``).
* ``DD`` is the date number, as a 2 digit number. If the date is less than 10, it includes a 0 before it (for example, ``03``).
* ``post_title`` is the title of your post. This is used for links, not for displaying on the post page.

Additionally, take note of the header on the top of posts:

```
---
title:  "The Happy Virus: Dawkins, Guattari, and the Mass Meme Machine"
summary: "A contagious virus infects the Selfish Gene."
date:   2023-11-15 01:44:05 -0500
tags: theory
topics: linguistics
about_authors: hjemslev
---
```

These variables mean different things:

* ``title`` is what is displayed as the title on the blog, search and other site features.
* ``summary`` is what is displayed on the blog or the search as a summary of the post's contents.
* ``date`` is a date in YYYY-MM-YY HH:mm:ss tz format. Personally, I just update the date. Note that if the date is in the future, it will not generate the post until generation is run when the date is in the past.
* ``tags`` are the tags to group this post into.
* ``topics`` are the topics to group this post into.
* ``about_authors`` are the authors to group this post into.

After this header, you can write anything you want, similar to other ``.md`` files.

## Directories with Files Developers Should Update Only

These are directories used for more technical parts of the website. You can edit these, but you should use caution and should reserve editing to people who know web development.

### _includes

This directory includes HTML components that can be included into other templates during generation.

### _layouts

Layouts are complete HTML templates that populate a markdown file's content where the string ``{{content}}`` is located. They are what is referenced in the ``layout`` parameter in markdown headers - this is how you indicate which layout is used for a kind of file. Typically, you should use the same kind of layout as other files in the same directory are using.

### pdf

This is an unused directory that will later be used for experimenting with server-side PDF generation from pages.

### _plugins

These are Ruby plugins that modify the generation behavior of the website.

> **WARNING:** Do not touch these unless you really know what you're doing!

### _sass

These are styling template sheets that are used to determine various styling on the website, such as how big boxes are, or what color things are. Currently, the file list is as follows:

* ``alert.scss`` - Used for alert styling.
* ``colors_base.scss`` - Used for light mode colors.
* ``colors_dark.scss`` - Used for dark mode colors.
* ``custom.scss`` - Custom CSS routines that don't really fit elsewhere.
* ``footer.scss`` - The CSS of the footer.
* ``headings.scss`` - CSS for headings, like h1, h2, h3 etc.
* ``mobile.scss`` - CSS for screens with narrow widths, like phones in vertical mode.
* ``navbar.scss`` - CSS for the navigation bar.
* ``navtabs.scss`` - CSS for the navigation bar tabs.
* ``sidebar.scss`` - CSS for the sidebar on the side of pages and documents.
* ``syntax_highlighting.scss`` - CSS for how code is highlighted in code syntax.
* ``table.scss`` - CSS for table generation.
* ``transition.scss`` - CSS for transitions.
* ``transition-none.scss`` - CSS for reduced motion.
* ``workflowmaps.scss`` - CSS for the workflow maps. Unused in this version.

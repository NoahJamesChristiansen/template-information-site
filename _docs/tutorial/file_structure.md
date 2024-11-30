---
title: File Structure
sidebar: tutorial
include_sidebar: true
layout: document
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

![ A screenshot of the root directory, showing its structure as described below.](/template-information-site/assets/images/tutorial/dir_contents_assets.jpg)

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

### _data

### _docs

### documents

### _posts

## Directories with Files Developers Should Update Only

These are directories used for more technical parts of the website. You can edit these, but you should use caution and should reserve editing to people who know web development.

### _includes

### _layouts

### pdf

### _plugins

### _sass

---
title: File Types
sidebar: tutorial
include_sidebar: true
layout: document
next_doc: 
prev_doc: 
summary: Explaining the file types used to create the website.
---

* TOC
{:toc}

# File Types

File types help tell the file system what to do with a specific kind of file. It can tell if it is an image, a piece of text, or a website file, for example. This list helps you tell which file type is which.

## Markdown Files

Markdown files end with ``.md`` or ``.markdown``. They are written in **Markdown** format and are generated into pages. These files typically also have something called a **header**. This is text on the top of a file that explains important information about what to do with the file. You can tell where the header is because it looks like this:

```
---
layout: cv
title: Test
[...]
---
```

## Data Files

Data files are files that are used to explain certain data about how a part of the website should be rendered. Usually, data files are stored as ``.yml`` files. These files use spaces to carefully align parts of the data to make it clear what it's doing. [You can learn more about .yml files here](https://www.redhat.com/en/topics/automation/what-is-yaml). Here is an example of a ``.yml`` data file:

```
## Topnav single links
## if you want to list an external url, use url instead of url.
## the theme will apply a different link base.

navbar_singleitems:
- items:
  - title: Home
    url: http://badgernested.github.io/template-information-site/
  - title: Blog
    url: /post


navbar_dropdowns:
- title: Topnav dropdowns
  folders:
    - title: Education Samples
      folderitems:
        - title: Understanding Birds
          url: /docs/sample_subject/intro
        - title: History of Gallunesia
          url: /docs/sample_time/intro
        - title: Tutorial on Use
          url: /docs/tutorial/intro
    - title: About
      folderitems:
        - title: About Me
          url: /about.html
        - title: CV
          url: /cv.html
```

A few basic tips for reading this file:

* Lines starting with ``##`` are not read at all. They are comments, and are ignored by the parser.
* For each layer you want to nest your data, you need to have two spaces representing an indent.
* If you have the top layer of a new item in a list, make sure you use ``- `` to indicate it. Notice the space after the dash.

> **Reminder:** If you feel nervous about changing these files because of its specific structure, try saving a backup (just copy the old file before you make your changes) and then try changing it. If it completely breaks, just replace the backup. If you really screw things up you can just revert to the last functioning commit.

``.xml`` files also store data, but typically you will leave these files alone.

## Website Files

These are files that are used to render the website. There are a lot of different kinds of files that have specific functions.

### Page Files

Page files are ``.html`` files. These are the kinds of files that are used to structure the webpages. These can either be the output files of the ``.md`` or ``.markdown`` files, or you can have them in the root directory and the generator will include them normally. 

### Color and Style Files

Styling files either use ``.css`` extension, or ``.sass`` extension. The difference is that ``.sass`` generates ``.css`` files for the website to use, so it can use a couple extra things that ``.css`` files traditionally cannot use, such as imports and variables. For this probject, ``.sass`` files allow us to separate the ``.css`` file into various functions, such as navbar, sidebar, CV etc. as well as separate light and dark modes, mobile layouts and reduced motion layouts.

### Image and Media Files

Image files are stored as ``.png``, ``.jpg``, ``.jpeg``, ``.gif``, ``.svg`` or some other kinds of files. Most of these files are **raster** images, where each pixel is colored in like a grid. ``.svg`` is difference since it is a **vector** image, meaning it is drawn from lines and shapes, and can scale to many sizes. 

> **Reminder:** You need to pay attention to the file extension. If you are trying to copy one file over another with the same filename for example, make sure they have the same extension too! If they don't, they're not considered the same file by the filesystem. Make sure the file extension is correct in your headers and image references too!

Media files include files like ``.wav``, ``.ogg``, ``.flac``, ``.mp3``, ``.mp4``, ``.mkv`` among others.

> **Important:** Large media files, especially video files, should not be hosted on GitHub/GitLab. You will rapidly exceed your filesize limits. Instead, host these on external sites. YouTube is an acceptable option for videos and offers embedding, for example.

### JavaScript and Ruby

``.js`` files are JavaScript files, and ``.rb`` files are Ruby files. What they have in common is they are ``code files``. JavaScript runs in your browser, while Ruby is used to change how the generator works. It's best that if you don't have programming experience to leave these ones alone.

### Other Files

Some files in the directory serve a different purpose entirely. ``.sh`` are script files for Linux, and ``.bat`` are script files for Windows. Some files don't have any extension at all and are quite special, so let's go over each one:

* ``Gemfile`` - This file contains plugins that are necessary to run the website. Don't edit this unless you know what you're doing!
* ``LICENSE`` - This is the license that the software is distributed under. Don't change this.
* ``NOTICE`` - This is a notice file that is distributed along with the license. Don't change this.
* ``rakefile`` - This is a structural file used for producing the website. Don't touch this.


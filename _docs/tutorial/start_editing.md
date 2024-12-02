---
title: Getting Started with Editing
sidebar: tutorial
next_doc: docs/tutorial/file_types
prev_doc: docs/tutorial/config
summary: An introduction on how to edit .md files to generate pages.
---

* TOC
{:toc}

# Understanding Markdown Files

Pages in Jekyll generated websites are created using markdown files (``.md`` or ``.markdown``). They read the syntax of the files and generate appropriate HTML based on what you put in there.

This way, editing various kinds of elements that are commonly used on websites can be very easy for users inexperienced in web development.

## Using Markdown

Markdown is very easy to use. You simply "mark" text you want to be formatted in a certain way using pre-defined structural text elements. As a result, you can edit all files in a text editor, reliably and predictably.

> **Notice: Do not use a word processor** because these programs add additional bytes that will mess with Markdown parsing.

The other pages in this section of the tutorial will go over basic usage of markdown, but if you are looking for more help, [you can check out the Markdown Cheat Sheet](https://www.markdownguide.org/cheat-sheet/).

Note that not all markdown featured on that cheatsheet is usable in Jekyll. Some are just not supported by the used markdown generator. Make sure you review the output of the Markdown before labeling your website as finished!

### If Markdown Doesn't Work...

You can always use HTML if the Markdown for a specific structure does not work properly. For example, superscript is not currently supported by the kramdown markdown processor used in Jekyll. So, you will need to use something like this:

```
<sup>[superscript]</sup>
```

to create a superscript. HTML has a lot more capabilities than Markdown so you can always resort to it if Markdown fails, but as you can see, it uses a lot of characters and is kind of ugly looking.

## Components

Each page is separated into two components - the **header** and the **content**.

### Header

The header is information that explains to the generator how to generate a website. It is placed on the top of the file and contains a list of variables. Here is the sample header used for the CV page for this website:

```
---
layout: cv
title: John Doe
subtitle: Professor of Arcane Territorial Studies, PhD.
permalink: /cv.html
pdf: documents/CynicalTheories_PunishedOtto.pdf
sidebar: generic
about: I am a professor and researcher working in the field of Arcane Territorial Studies, specializing in Symbolic and Ornithology studies, employed by the University of Bantam, located in South Gallunesia.
email: test@test.com
phone: +1 123 456 7890
website: https://punishedfelix.com
no_photo_text: JD
photo: assets/photo.png
photo_alt_text: Image of me
---
```

As you can see, the header is separated by the rest of the file by wrapping its contents between ``---``. This tells the generator where the header starts and ends. Everything below the second ``---`` counts as content. Any variable that is specified here will override any defaults that are set. If there is no default set and a variable is not set, it will just be empty and treated as ``false``.

### Common Header Variables

#### layout

This determines which layout as defined in the ``_layouts`` directory to use for a certain page. In some cases, such as ``cv.md``, you want to use a custom layout so that the page displays differently than other pages.

#### permalink

#### title {#title_def}

The title of the page, as shown in searches, blog listings, etc.

#### subtitle {#ubtitle_def}

The subtitle of the page. Not frequently shown, but might appear on some pages like CV.

#### sidebar {#sidebar_def}

Which sidebar to use, as defined in ``_data``. If left empty, there is no sidebar.

#### date

This variable stores when a post was created, manually. The value is stored in ``YYYY-MM-DD HH-mm-ss TZ`` format. 

For example, ``2023-09-22 00:35:05 -0500`` is a valid value for the ``date`` variable.

#### summary

The summary of the page, document or blog post, which appears on the search screen or your blog.

#### photo

The path to the photo shown in the sidebar.

#### photo_alt_text

The alt text for the photo shown in the sidebar. This text should be descriptive and explain the purpose of the image.

#### no_photo_text

The text that will be displayed if you don't want an image in the sidebar, but want to display text instead.

#### prev_doc

The link to the previous document in the series. Used only for documents, not blog posts.

#### next_doc

The link to the next document in the series. Used only for documents, not blog posts.

#### tags

The tags that are connected to this blog post. Only used for blog posts, and allows you to sort posts by tag.

#### topics

The topics that are connected to this blog post. Think subjects like "science", "math", "literature" etc... Only used for blog posts, and allows you to sort posts by these topics.

You will need to define the text that displays on the topic page in ``_data/blog_links.yml``.

#### about_authors

The authors that are discussed in this blog post. Only used for blog posts, and allows you to sort posts by these authors.

You will need to define the text that displays on the author page in ``_data/blog_links.yml``.

#### pdf

The link to a pre-rendered PDF file for some pages, like the CV.

### Content

Content is the bulk of your page. This is where you will write the content that users came here to see! This is where you will use your markdown skills to render the content that you want to publish.

You can use markdown or HTML here. Keep in mind that this content is placed where the content is defined in the layout. 

# A Note on Accessibility

Accessibility is very important to help make your pages usable to disabled users and more friendly to use for everyone. I am currently continually improving accessibility in the main layout of this website, but its important to keep in mind the following tips:

* Make sure all information that is important to understanding things is available in text. 
* All images should include alt text that is descriptive and matches the purpose of the image in the context of visual readers.
* Use the appropriate markdown or HTML element to display information like tables instead of images.
* Use proper headings.
* Wrap foreign language words in ``<span lang=""></span>`` tags, so that they can be read properly by screenreaders. For example: ``<span lang="fr">merci beaucoup</fr>``.



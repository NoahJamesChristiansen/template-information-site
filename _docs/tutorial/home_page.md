---
title: Home Page
sidebar: tutorial
next_doc: docs/tutorial/navbar
prev_doc: docs/tutorial/images
summary: Explaining how the Home Page works.
---

* TOC
{:toc}

# Homepage

The **homepage** is the first page that visitors will see when visiting your website. To access it on this demo, you can go to ``https://badgernested.github.io/template-information-site/`` in your browser. As you can see, you don't need to add anything special to the URL, it's the landing page of the website.

## Header

The header determines how certain parts of the home page render. Here is a copy of this website's home page header for reference:

```
---
title: "My Little Corner of the Internet"
permalink: index.html
sidebar: home
type: homepage
class: first
photo: /assets/photo.png
photo_alt_text: A photograph of me, a man with a nice haircut and well trimmed facial hair, trendy glasses, a black sweater and a fashionable beige coat.
---
```

This is a summary of the variables used in the header:

* ``title`` - The title that is displayed on the top of the page and in the titlebar in your browser.
* ``permalink`` - The exact link that lands you to this page. Don't edit this for the home page - ``index.html`` IS the homepage!
* ``sidebar`` - What sidebar to use, from the ``_data`` directory. There's no need to change this, but you can if you want to construct your own custom sidebar.
* ``type`` - What type of page this is. Don't change this.
* ``photo`` - The photo to display in the sidebar.
* ``photo_alt_text`` - The alt text for the photo in the sidebar.

## Content

This page is rendered very similarly to any other page's content. You can put whatever you want here, but it should probably be short and help direct users towards important parts of the website.

## Sidebar {#sidebar_def}

The content of the sidebar is determined by ``_data/home.yml`` by default. You can edit this content to include more pages, or whatever you want, really. Let's go over the basic contents of this document.

* ``sidebarTitle`` - This is the big text that appears on the top of the side bar, that is set to "John Doe" in the demo.
* ``related_resources_title`` - This is the text that appears under the list of links. In the demo, it's set to "Quick Links".
* ``related_resources_list`` is a list of websites. For each website definition:
    * ``title`` is the text that is displayed in the link for the user.
    * ``jurl`` is the link to the page you want to go to. If this link contains ``http`` or ``https``, it will be treated as an external link. Otherwise, it will be relative to either the current directory if no leading ``/``, or relative to the base domain if it has a leading ``/``, for example, this website's base domain is ``https://badgernested.github.io/``.


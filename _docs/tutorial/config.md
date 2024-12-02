---
title: Global Configuration
sidebar: tutorial
next_doc: 
prev_doc: 
summary: How to set up configurations for the website.
---

* TOC
{:toc}

# Understanding _config.yml

``_config.yml`` is a file that is used to configure your website before it runs. It tells Jekyll exactly how to set up important variables that control your website. You can set these variables to change how your site functions, change what front matter is produced, or how strings appear in the output.

> **Note:** If you have Jekyll running locally on your computer and generating the pages locally, you should rerun ``bundle exec jekyll exec`` to reload the variables. This is not a problem if you're editing GitHub since every commit will run its own job which runs this script every time.

# Variable List

This is a list of variables in the file so you can know what each part of the file does.

## port

This indicates the **port number** of the website. The port number is a number from 0-65535 that allows the computer to send messages on it. Think of it as different mailboxes for internet information to go through - this way your website doesn't conflict with other processes. [To learn more about port numbers, you can go here.](https://en.wikipedia.org/wiki/Port_(computer_networking))

4000 is the default value and shouldn't really be changed unless you know what you're doing. 

> **Reminder:** Ports up to 1024 are reserved, so don't use them here.

## language

This is the language of the website, used for localization of the original theme. It's no longer used here so you can ignore this. If you need localization, please contact me and I'll help walk you through the process.

## format

This is a feature that can be used on a server based configuration to produce PDF files of pages. However, since we are running on GitHub Pages or something similar, you can't use this feature, so you should leave this alone.

## paginate

This is how many pages the blog will display at a time in the paginator.

## favicon

This is the path to the file that displays the little icon next to the title of your page in the tab in your web browser.

## home_url

This is the base URL that will lead to your homepage if you go there. For example, if you go to ``https://badgernested.github.io/template-information-site/``, it will be the home page of this website.

There is a copy of this variable commented out that has it set to ``http://localhost:4000/``. This is useful for local testing, if you have it set up. Uncomment this line and comment out the other line to test locally. Make sure you update before pushing, or else styles and scripts won't work properly.

## source_code_url

This is the URL that is the link to the source code as hosted on GitHub.

## blog_logo

This is the path to the file that displays in the blog section of your website.

## blog_logo_alt_text

This is alt text for ``blog_logo``. Make it meaningful and descriptive, it's for low vision/slow internet connection users of your website.

## search_in_topnav

If true, the search button will appear in the top right corner of the screen on wider displays and in the dropdown menu on narrow displays.

## sidebars

This is a list of all your sidebars in your application. This is important if you're using automated links for some reason.

## link_type

This determines if the links.html script uses jurl or hurl values for the sidebar data. This can be accessed at ``/linkstest.html``, but doesn't seem to be used for anything yet.

## show_feedback

Whether or not the "Feedback" link appears in the top navigation bar.

## feedback_email

The email message where the feedback will be sent.

## exclude

This is a list of directories and files that will be excluded from export. Don't change this unless you know what you're doing, or else you might get some weird effects.

## defaults

This sets default variables to headers if they are not defined, for certain locations and groups. For example, pages, by default, use the ``default`` layout, while documents use the ``document`` layout by default.

## Markdown Variables

### highlighter

The highlighter to use for syntax highlighting, used for displaying code. Don't change this unless you know what you're doing.

### markdown

The markdown generator to use. Don't change this unless you know what you're doing.

### kramdown

Settings for Kramdown, the markdown generator set by default. Don't change this unless you know what you're doing.

## sass

Settings for rendering sass into ``.css`` files. Don't change this unless you know what you're doing.

## collections

Collections are a Jekyll functionality that allows you to create collections of pages and have them output by the generator. You should leave this alone if you don't know what you're doing, but you can add to it to add more kinds of collections in the future. [To learn more about collections in Jekyll, click here](https://jekyllrb.com/docs/collections/).

## plugins

The list of currently enabled plugins. You should have these both here and in your ``gemfile``. Don't change this unless you know what you're doing.

## uistring

This is a list of UI strings found throughout the program, so you can edit text that appears on multiple pages.

### title

The title of the website, as displayed in the tab in your browser.

### description

The description of your website, which is useful meta information about your website.

### copyright

Copyright notice.

### tableofcontents

The string that appears before the table of contents on pages with a TOC.

### expandall

The string for "Expand All" seen in sidebars.

### collapseall

The string for "Collapse All" seen in sidebars.

### search_placeholder_text

The placeholder text in the searchbar that displays if you don't have any text currently typed in the search box.

### no_search_results_found

The text for when no search results are found.

### feedback_link_name

The text that appears for the Feedback link on the navigation bar.

### feedback_subject_line

The text that appears for the subject line for the email generated by clicking on the Feedback link on the navigation bar.

### feedback_body

The text that appears for the body for the email generated by clicking on the Feedback link on the navigation bar.

> **Note:** Do not use spaces here.

### blog

The title of your blog.

### datetime_format

The format used for dates throughout the site. [You can reference this document to better understand how to format dates on this template](https://www.scaler.com/topics/stfrtime-ruby/#ruby-strftime-function-cheat-sheet).

### continue_reading

The text to continue reading for next/previous links in documents.

### continue_prev

The text for the previous link in documents.

### continue_next

The text for the next link in documents.

### doc_last_updated

The string for when the document was last updated.

### months

A list of month names.


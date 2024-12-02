---
title: Navigation
sidebar: tutorial
next_doc: 
prev_doc: 
summary: Explaining how to configure the top navigation bar.
---

* TOC
{:toc}

# Navigation

The navigation bar is on the top of the website. In desktop mode, it looks like a long bar with several menu options on top. In mobile mode, it looks like a banner with a few buttons in the middle, which can display the menu, sidebar, and home buttons easily, as well as go to the top of the page.

## Mobile Layout

The mobile layout is somewhat different, to accomodate the lack of space. On the top, you will see 4 buttons:

<div style="margin-top:10px;margin-bottom:10px;"><span class="fa fa-bars fa-2x" style="display:inline;margin-left: 30px;margin-right: 15px;"></span><span style="color: inherit;display: inline-block;height: 30px;vertical-align: middle;margin: 0px;">This bars icon displays the menu.</span></div>
<div style="margin-top:10px;margin-bottom:10px;"><span class="fa fa-book fa-2x" style="display:inline;margin-left: 30px;margin-right: 15px;"></span><span style="color: inherit;display: inline-block;height: 30px;vertical-align: middle;margin: 0px;">This book icon displays the sidebar.</span></div>
<div style="margin-top:10px;margin-bottom:10px;"><span class="fa fa-arrow-up fa-2x" style="display:inline;margin-left: 30px;margin-right: 15px;"></span><span style="color: inherit;display: inline-block;height: 30px;vertical-align: middle;margin: 0px;">This up arrow icon scrolls to the top of the page.</span></div>
<div style="margin-top:10px;margin-bottom:10px;"><span class="fa fa-home fa-2x" style="display:inline;margin-left: 30px;margin-right: 15px;"></span><span style="color: inherit;display: inline-block;height: 30px;vertical-align: middle;margin: 0px;">This house icon goes to the home page.</span></div>

## Structure

The navigation definition is stored in ``_data/topnav.yml``. The navigation is split into several regions so that it can be easily organized.

### Single Page Links

All of the links that do not have dropdowns are listed first. They are organized under ``navbar_singleitems`` as objects within the ``items`` array. The structure of each item is as follows:

* ``title`` - The string that is displayed in the navigation bar.
* ``url`` - The URL to the page. If it has ``http`` or ``https`` in the address, it is treated as an external link.

### Dropdown Menus

After the single page links are rendered, the dropdown menus are created. When these menus are clicked, multiple options can be selected from.

Each drop down is listed under the ``folders`` array. Each folder has a ``title`` and a list of ``folderitems``. Each one of these ``folderitems`` is exactly like how the signle page links are set up.

> **Note:** Make sure you are careful about whitespace (spacing) in YAML. YAML requires that each level deep is represented by two spaces.

### Feedback

Feedback is an optional feature that allows users to send you an email about feedback on your website. Feedback is controlled in ``_config.yml`` with the following variables:

* ``show_feedback`` - If this is ``true``, the feedback button will be created.
* ``feedback_email`` - This is the email that the feedback is sent to.
* ``feedback_link_name`` - This is the text "Feedback" that appears on the navigation bar.
* ``feedback_subject_line`` - The default subject line of the feedback email.
* ``feedback_body`` - The default body of the feedback email.

### Search

Search is an optional feature that allows users to search clientside for information across the entire website. It can be a bit slow if it runs on the client like with GitHub pages, so you may want to disable it. Search is controlled in ``_config.yml`` with the following variables:

* ``search_in_topnav`` - If this is ``true``, the search bar will appear in the navigation bar.
* ``search_placeholder_text`` - This is the placeholder text for the search bar.

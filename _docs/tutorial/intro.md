---
title: Getting Started
sidebar: tutorial
include_sidebar: true
layout: document
next_doc:
prev_doc: 
summary: An introduction on how to set up your website with this template.
---

> **Note! This project is a work-in-progress. Some pages may be missing or not work. It takes time to write these, so please hang in tight!**

* TOC
{:toc}

# How Does It Work?

This website template uses a pipeline to help deploy its website to the internet. It will allow you to modify text files to create a website easily and quickly, all while owning all the code to generate it whenever you want.

## What is Static Generation?

This website is a **statically generated** website. This means that it is a website that takes a bunch of files, puts them together and outputs all the files as HTML files, instead of dynamically producing them like with PHP, JSP. Effectively, you are navigating a bunch of HTML pages that have been output by the generator.

This website is generated using a generator called [Jekyll](https://jekyllrb.com/). This generator assembles all the parts in the website directory to produce the output, which is stored in ``_site``.

The contents of ``_site`` are not pushed to the repository and are not really part of your source code. Instead, it is generated when the build process is run. When you push your code to the GitHub repository, it runs this build process. If it's successful, it will deploy your website with the code output by this process.

## What is GitHub Pages?

[GitHub Pages](https://pages.github.com/) is a free service offered by [GitHub](https://github.com/) that allows you to host websites on its servers. You can access your page through a link that looks like this: ``https://[github-user-name].github.io/[project-name]/``

> **Tip**: If you name your project **[github-user-name].github.io**, it will default to being just **https://[github-user-name].github.io**.

You can also use other websites like [GitLab](https://gitlab.com/) for hosting pages in a similar manner, however GitLab may be harder to configure for free.

## What is Git?

[Git](https://git-scm.com/) is open source version control software that allows you to update code in a repository that is compatible with it. GitHub, GitLab and others work with git so that you can update files on your local machine on a remote repository hosted on their websites.

Advantages of using Git version control software include: 
* It is open-source and free to use.
* It is widely used and well documented. You can find many answers on StackOverflow about this software.
* You can easily collaborate with other people, developers and even automate some tasks with a bot if you so wanted.
* You can redistribute your code easily, making it easy to share your texts with other people in new formats.
* Services like GitHub or GitLab are well supported and have many useful applications, and Git gives a means to use it easily.
* You can revert back the state of your project to a previous state if you mess up your files. 

# Advantages

For websites like blogs, CVs, lists of links or documentation, static generation is one of the widely preferred means to produce websites. It is free, open source, documented and easy to set up as a developer. It's very easy to update the website once you get the hang of things, and you will never have to open a browser just to update page text or add a new blog post (although it might be a good idea to check!).

Another great thing about doing websites this way is that you can, in theory, host it anywhere you want and do whatever you want with it. You just need the host computer to support Ruby, Python and a few other software requirements to generate the pages and host them on server software. If you are running on a server, you can also have the server execute tasks with REST commands, allowing Jekyll to completely automate generation of the website while having backend capabilities.

Finally, you are not obliged to the terms and services of anything other than whoever you are hosting the website on. That means you can do whatever you like with your website as long as you have the capabilities to do it yourself or with a web developer.

# Disadvantages

All of the code is designed to work client-side, since GitHub/GitLab Pages does not allow you to run custom server code outside of the building code, which means you cannot do important tasks like storing a database, uploading files, or other tasks that require a server.

Static generation is easy for developers, but can be challenging to people who are not familiar with code. This guide will make things a lot easier to work with though.

Sometimes setting up the website to generate locally on your machine can be frustrating because of conflicting Ruby and Python versions, especially on Windows. However, this is not necessary for implementation of this template, and is more important for developers. 

# Are there other options?

You can also deploy this website to a server yourself to extend its functionality. This is useful if you need server-side functionality, such as working with a database or with special programs like PDF generation. If you would like to do so, [check out upgrades here](/docs/tutorial/upgrades).

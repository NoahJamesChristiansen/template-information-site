---
title: Formatting
sidebar: tutorial
next_doc: docs/tutorial/images
prev_doc: docs/tutorial/file_types
summary: How to format the text in markdown for posts and documents.
---

> **Note for Screenreader Users**: This page uses formatting as examples to explain how to implement them. Keep this in mind, since this might make the content listing a little weird.

* TOC
{:toc}

# Introduction to Formatting

Text formatting allows you to do all sorts of cool things. You can do **bold text like this**, or *italicized text like this*, for example. You can even ~~strike out text~~.

> Or you could do a super interesting quote in a box, like this.

You can make lists in two different ways.

1. Maybe you want to have items in an ordered list.
2. This is an example of an ordered list.

Or you can make them unordered, too:

* Sometimes, an unordered list is more useful.
* This is good for things you would sort like grocery items, where the order doesn't matter.

Maybe you want to talk about a specific ``variable`` that appears in the code. 

```
// You can even write code in boxes like this.
System.out.println("Free me from my Java prison.");
```

If you need a horizontal rule, that's also an option:

---

[Maybe you want to link to a page inside your own website](intro). [Or maybe external to the website](https://www.wikipedia.org/). You can do anything your heart desires.

You can also make tables:

| Birds | Dogs |
| ----------- | ----------- |
| Jay | Husky |
| Hawk | Retriever | 
| Swan | Poodle | 
| Pelican | Shih Tzu | 

Look, I figured out how to do footnotes![^1]

[^1]: This is the footnote, just in case you were wondering. It appears on the bottom of the content area.

Lets say you want to do a dictionary, you could do something like this:

Bird (n)
: An animal that has two feet and two wings that flies around causing trouble.

Dog (n)
: Man's best friend, unless owned by a cop.

We will discuss how to use all of these.

# Markdown

## Text

Using text formatting can be a **really** great way to *make your work stand out*. 

### Bold

Bold text is surrounded by ``**``. So for example, if we look at the following sentence:

The **big** brown fox **jumped** over the lazy **hen**.

You can see in the code where the bolded text is:

```
The **big** brown fox **jumped** over the lazy **hen**.
```

### Italics

Italicized text is surrounded by ``*``. So for example, if we look at the following sentence:

The *big* brown fox *jumped* over the lazy *hen*.

You can see in the code where the bolded text is:

```
The *big* brown fox *jumped* over the lazy *hen*.
```

### Strikethrough

Strikethrough text is surrounded by ``~~``. So for example, if we look at the following sentence:

The ~~big~~ brown fox ~~jumped~~ over the lazy ~~hen~~.

You can see in the code where the bolded text is:

```
The ~~big~~ brown fox ~~jumped~~ over the lazy ~~hen~~.
```

### Definitions

Definitions are useful elements to use on glossary pages to automatically format text to be nicer to look at. Here's an example:

Dog (n)
: Man's best friend, unless owned by a cop.

Markdown:

```
Dog (n)
: Man's best friend, unless owned by a cop.
```

### Footnotes

Footnotes are useful if you want to point out where you sourced your information, help provide a better explanation of a difficult concept, or if you just want to be really annoying and insecure and try to write yourself out of a hole. Whatever your intention may be, footnotes are here to help you out with that.

Footnotes will always make the footnote contents appear at the bottom of the page and are easily accessible. Here is an example:

This is the second footnote on the page.[^2]

[^2]: This second footnote also appears on the bottom of the page.

Markdown:

```
This is the second footnote on the page.[^2]

[^2]: This second footnote also appears on the bottom of the page.
```

## Headers

Headers are the way you organize parts of your pages. Think of it in the same way that Wikipedia uses its headers. You want to organize your pages in a useful way using headers.

To start, there are 6 levels of headers, and each level is indicated by how many ``#`` characters you start the line with. For example, if you want to have a level 3 header (which is smaller than a level 2 and level 1 header), you would use ``###`` like this:

```
### This is my header!
```

And it would display like this:

### This is my header!

Notice how this header appears in the table of contents.

### Good Practices with Headers

Its important to make sure that you follow good practices with your headers, so that your content is a lot more readable. Use headers as if you are designing each page with a table of contents, because this is how some users will navigate your pages. Make sure you use headers instead of bold text or custom text, since that is very confusing to users and only presents a visual change instead of a functional one.

## Table of Contents

A table of contents is an object that generates links based on each header you used through the document. This is part of the reason why proper header use is so important!

You can only insert one table of contents onto a page, so I have not rendered it here. You can view it at the top of the page. You can insert a table of contents with the following markdown:

```
* TOC
{:toc}
```

## Links

To do links, you will want to surround the text of the link with ``[]`` brackets, and the link itself right afterwards with ``()``. 

To link to a local page, you don't have to include the ``https://`` part. For example:

[This links to the intro page.](intro)

[This links to the CV page.](/cv)

Markdown:

```
[This links to the intro page.](intro)

[This links to the CV page.](/cv)
```

> **Note:** If you include the ``/`` character, the path will start from the base of your website, so for example, ``https://badgernested.github.io``. If you don't, it will be the same directory as the page you are linking from. So in this case, it will link from ``https://badgernested.github.io/template-information-site/docs/tutorial``.

You can also link sites to external websites.

[This is the Wikipedia page on Markdown.](https://en.wikipedia.org/wiki/Markdown)

Markdown:

```
[This is the Wikipedia page on Markdown.](https://en.wikipedia.org/wiki/Markdown)
```

> **Note:** It's a good idea to avoid link text like "Click here!" since this can be confusing to screen reader users. Instead, have the link explain what its purpose is more clearly.

## Lists

In web development, there are two kinds of lists. Ordered lists are lists where the list's order matters and its organized like 1, 2, 3 etc. while unordered lists are lists where the list's order doesn't matter and it's just a list of items.

To do an ordered list, just list the number, for example like ``1. ``, and list off each of your items, like so:

1. This is the first item.
2. This is the second item.
3. This is the third item.

Markdown:

```
1. This is the first item.
2. This is the second item.
3. This is the third item.
```

You can do an unordered list by using the ``*`` character instead:

* Oranges
* Apples
* Bananas

Markdown:

```
* Oranges
* Apples
* Bananas
```

## Code

Sometimes, you will either want to show code in your content. Oftentimes, it's just a single ``variable`` that needs to be highlighted. To highlight this ``variable``, you just do the following:

``variable``

Markdown:

```
``variable``
```

Other times you will need whole blocks of code. This will require you to use slightly different formatting, called a "fenced" code block:

```
// This is a fenced code block.

int value = 0;
System.out.println("Help, I'm trapped in Java!");
if (value > 9){
    sendHelpToPlayer(true);
}
```

Markdown:

~~~
```
// This is a fenced code block.

int value = 0;
System.out.println("Help, I'm trapped in Java!");
if (value > 9){
    sendHelpToPlayer(true);
}
```
~~~


## Tables

Tables are pretty complicated to make.

For a table, the first row is treated as a **header** row. This way it is separated from the rest and its easy to see what each column represents.

Each row has its elements separated by a ``|`` character. You need to also make sure the last element in a row is closed off with a ``|`` character. What is very nice is you can have as many columns as you need, although you should consider the width of the content area before going *too* crazy.

After the first row, the data is displayed as if it is data.

See the example to get a better idea:

| Birds | Dogs | Big Cats | Insects | Sea Creatures | Mythicals |
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| Jay | Husky | Jaguar | Cockroach | Orca | Cockatrice |
| Hawk | Retriever | Lion | Beetle | Giant Squid | Dragon |
| Swan | Poodle |  Tiger | Grasshopper | Swordfish | Griffon |
| Pelican | Shih Tzu | Cougar | Silverfish | Shark | Tsuchinoko |

Markdown:

```
| Birds | Dogs | Big Cats | Insects | Sea Creatures | Mythicals |
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| Jay | Husky | Jaguar | Cockroach | Orca | Cockatrice |
| Hawk | Retriever | Lion | Beetle | Giant Squid | Dragon |
| Swan | Poodle |  Tiger | Grasshopper | Swordfish | Griffon |
| Pelican | Shih Tzu | Cougar | Silverfish | Shark | Tsuchinoko |
```

## Formatting

To add a horizontal rule, simply type in ``---`` on the line by itself.

---

```
---
```

# HTML

## Superscript

To add a superscript, use the ``sup`` HTML tag.

Hello there!<sup>(Do not actually respond, he is not friendly)</sup>

HTML:

```
Hello there!<sup>(Do not actually respond, he is not friendly)</sup>
```

## Subscript

To add a subscript, use the ``sub`` HTML tag.

Hello there!<sub>(He is underground and cannot hear you)</sub>

HTML:

```
Hello there!<sub>(He is underground and cannot hear you)</sub>
```

## Highlight

To highlight, use the ``mark`` HTML tag.

I am a <mark>psychotherapist</mark>.

HTML:

```
I am a <mark>psychotherapist</mark>.
```

# Footnotes

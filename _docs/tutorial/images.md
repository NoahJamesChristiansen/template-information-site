---
title: Images and Media
sidebar: tutorial
next_doc: 
prev_doc: 
summary: How to properly use images and media on your website.
---

* TOC
{:toc}

# Using Media

## Images

### Using Alt Text

## Audio and Video

### Embedding from Other Websites

You can embed media from other websites, for example, Youtube.

#### YouTube

You can get the embed code by going to the video you want to embed by clicking "Share" on the video. You should see a screen that looks like this:

![ The screen after you click "share" on YouTube. ](/template-information-site/assets/images/tutorial/embed1.jpg)

Embed is the first, far left option. Click that, and you should see a screen that looks like the following:

![ The screen after you click "embed" on YouTube. The embed text is circled in red on the right side of the screenshot. ](/template-information-site/assets/images/tutorial/embed2.jpg)

The text circled in red on the right side of the screen is the text you want to copy. If you copy this text and place it in your document, it will look something like this:

<iframe width="560" height="315" src="https://www.youtube.com/embed/iYGtheC7314" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

> **Note:** If you want to remove the tracker information, remove the part in the ``src`` definition after ``?si=``. This is tracker information. In this example, the tracker information was removed. You're welcome!

Markdown:

```
<iframe width="560" height="315" src="https://www.youtube.com/embed/iYGtheC7314" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
```

### Self-Hosting

Optionally, you can host the audio or video file yourself on your GitHub or your own server.

> **Note:** Try to avoid hosting large video and audio files yourself, especially on GitHub. These files can get pretty big. Restrict your file size below 10 MB to prevent problems.

#### Audio

You can embed audio using HTML tags.

First, you should add your audio files to ``documents``. Make sure you have an ``.ogg`` format and ``.mp3`` format, so that browsers can select which format is best. Then, you can link them here.

<audio controls>
  <source src="/template-information-site/documents/sanctuary.ogg" type="audio/ogg">
  <source src="/template-information-site/documents/sanctuary.mp3" type="audio/mpeg">
  Your browser does not support the audio tag.
</audio> 

Audio description: A pleasant 8-bit song.

Markdown:

```
<audio controls>
    <source src="/template-information-site/documents/sanctuary.ogg" type="audio/ogg">
    <source src="/template-information-site/documents/sanctuary.mp3" type="audio/mpeg">
    Your browser does not support the audio tag.
</audio> 
```

#### Video

You can embed video using HTML tags.

First, you should add your video files to ``documents``. Then, you can link them here.

<video width="320" height="240" controls>
    <source src="/template-information-site/documents/felix_movie.mp4" type="video/mp4">
    <track src="/template-information-site/documents/felix_movie_subtitles.vtt" kind="subtitles" srclang="en" label="English">
Your browser does not support the video tag.
</video> 

Description: Felix's life is going crazy while Gilles watches in dismay. He always is available to help out a friend by giving him moral support. The music is 8-bit music.

Markdown:

```
<video width="320" height="240" controls>
    <source src="/template-information-site/documents/felix_movie.mp4" type="video/mp4">
    <track src="/template-information-site/documents/felix_movie_subtitles.vtt" kind="subtitles" srclang="en" label="English">
Your browser does not support the video tag.
</video> 
```

### Audio and Video Accessibility Practices

#### Transcription

All audio, including audio in video, should be accompanied with a transcript so that people can go through the contents in a text friendly format, if appropriate.

There are ways to add caption tracks to video hosted on websites like YouTube. Additionally, you can use a ``.vtt`` file, which defines captions for video files hosted online. These are managed with the ``<track>`` tag. You can attach it to a video like this:

```
<track src="/template-information-site/documents/felix_movie_subtitles.vtt" kind="subtitles" srclang="en" label="English">
</video> 
```

[To learn more on how to write your own .vtt files, click here](https://developer.mozilla.org/en-US/docs/Web/API/WebVTT_API#displaying_vtt_content_defined_in_a_file).

#### Audio Description Text

If your audio in your video is particularly important in signifying important events, you should also include these sound effects in your transcription, so that hearing-impaired users and users without audio can tell important details.

#### No Autoplaying

Remember, to never make music or video auto-playing on load, and to make sure that audio/video controls are easily visible and accessible in your layout so that they can be easily turned on or off. Also, in addition to a transcript, the text around the audio or video should explain the content of the audio or video, so that users can be aware of the audio/video's contents before accessing the media.

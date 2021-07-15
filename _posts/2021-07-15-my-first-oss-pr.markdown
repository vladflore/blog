---
layout: post
title: My first OSS PR
permalink: /my-first-oss-pr
author: Vlad
---

Software developers write code...or at least they should, provided they can escape the long boring meetings which finish with no conclusions or, God forbid, with the next appointment...to discuss more.

When we monetize this action of writing code, we usually do it as part of a job, which comes with its pros and cons, and such we have to stay in the legal framework of that working contract. This legal framework might very well prevent us from contributing to Open Source Software(OSS), so make sure to read the fine print!

Other than that, we do not get the chance to work with technologies we might want to get ourselves more familiar with, and this makes sense, but what if you *really* want to?

[Open Source Software] for the win!

Contributing to OSS can be a daunting business, especially if the thing you want to contribute to is well known, is maintained by many developers, is under heavy development, or is just complex. Nonetheless you can still contribute!

In my case, I took on a *good first issue* in a project hosted on GitHub called [Pluto.jl], which is, as its owner describes it, *simple reactive notebooks for Julia*.

What's Julia, you ask?

Well, for the impatient, it is a fast, dynamic, reproducible, composable, general, open source programming language, with an ecosystem covering visualization, data science, machine learning, scientific domains, parallel computing and, of course, general purpose development *and* web development. For the curious, check [julialang.org].

Coming back to the OSS project, my contribution was more of an esthetic one, changing the way a set data structure is rendered, specifically displaying its elements in a chunk-wise manner. This change involved writing some Julia code, some React/JavaScript code and some HTML and CSS code.

It's important to mention, that Julia is not my main programming language, I did *meet* Julia in late 2020, but didn't do any serious development in it, and neither is React as a JavaScript framework. Nevertheless, I was able to implement the change and [get it accepted into the main branch, which got released shortly after](https://github.com/fonsp/Pluto.jl/pull/926).

I mentioned above, that contributing to OSS can be a daunting business, but, despite that, there are still ways to make the process more comfortable, here is how you could do it:
- improve the documentation, by correcting typos, adding examples, explaining notions in a clearer way etc.
- improve the code coverage
- go for the issues, which are labeled with *good first issue*, the Pluto.jl repository uses this label to let people know of stuff which can be worked on if you hadn't worked before on such projects
- browse the issues and see if you can find one, which makes sense to you, without having to go into the eerie implementation details

Start small and don't give up, keep persevering, and your __first Pull Request(PR)__ will be accepted in no time.

Contributing to OSS, doesn't necessarily bring you money, but it does bring you experience, which you can eventually monetize. With a community as Pluto.jl has, you can get all the experience you need.

May your contributions be easily accepted and your work recognized!

Happy coding!

Vlad

[Open Source Software]: https://en.wikipedia.org/wiki/Open-source_software
[Pluto.jl]: https://github.com/fonsp/Pluto.jl
[julialang.org]: https://julialang.org/
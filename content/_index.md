+++
title = "Nerdsomeness - Journal"
date = 2024-04-01
draft = false
+++

<!-- NEW POST ON TOP -->

## {{ date_format(date="2024-04-27") }} ( ´･･)ﾉ(._.`)
> {{ date_format_journal(date="2024-04-27T21:39:27") }}

- Ah! I fell sick (past few days). (ToT)/\~\~\~
- Re-visiting some tutorials. (⌐■_■)
- Nothing interesting, but I am really really motivated and full on energy to learn a lot!! b(￣▽￣)d
- What else? Aaaa~! I always forget important things! I want to write things I want to say as soon as they pop in my head, but it's not possible as I don't have access to my computer all the time.
	- So, I might clone this repository (where this **zola** site is) into my phone and as I already got **Termux** installed, I can write from my phone (even though it's pain to write on small-potato phone). （︶^︶）


## {{ date_format(date="2024-04-24") }} ల(´= ◡ =｀)
> {{ date_format_journal(date="2024-04-24T09:57:27") }}

- Yesterday finished one of the *8 hour Python tutorial* by **freeCodeCamp** and deployed a weather app as the final project on *render.com*. ( ◎⃝⃘∀◎⃝⃘ )
- And about today, been scrolling through the Python Docs as thinking of working on a project (don't want to tell what it is..). So, I was trying to find (kind of 'research'?) some packages in standard library that can do the job, instead of seeking for 3rd-party ones.｜−・;）
- You know what, at the end, ended up using the 3rd-party library. XD
- Ow, found this amazing website/project called [Open Book Project](https://openbookproject.net/). (ෆ`꒳´ෆ)
- There's a lot.. I mean, there are a lot of things to learn and do, but only one life-. ( ｡_｡)

## {{ date_format(date="2024-04-22") }} (\*￣▽￣\*)
> {{ date_format_journal(date="2024-04-22T23:28:01") }}

- Aaaah~! Been really into Linux rabit-hole.. to be specific, into self-hosting and stuff. What? (\~￣▽￣)\~
- So, basically, was really into self-hosting and endlessly trying different solutions for it. Like, self-hosting your own git hosting website (i.e. Gitea, GitLab, etc.).
- Had so many trial and errors and FINALLY ended up using **DietPi**. I might write a Blog post about it (soon™, i don't know..). (lll￢ω￢)
- That's why wasn't able to write (and commit writing) my daily Journal. Also, "cherry on top", my WSL installation broke (i have no idea). That's the another reason not being able to write. (｡•́-ก̀｡)
- Oh, and most important thing for today: I started to read "[Eloquent JavaScript - 4th Edition](https://eloquentjavascript.net/) by **Marijn Haverbeke**. ٩(◦`꒳´◦)۶

## {{ date_format(date="2024-04-07") }} (┬┬﹏┬┬)
> {{ date_format_journal(date="2024-04-07T08:38:14") }}

- I swear to god, I don't remember any time when I felt this useless and hopeless at the same time. (٭°̧̧̧꒳°̧̧̧٭) 
- I feel like crying aloud while banging my head on the wall..（ ; ; ）
- What else is left in this world? 

> {{ date_format_journal(date="2024-04-07T23:54:43") }}

- I read a book (e-book/pdf) called "An introduction to programming with bash" (by David Both at Opensource.com) today.
- Learnt a new word "*pointy-haired bosses*" - **PHBs**. XD
- A Bash Script to check if a file exists or not and if it exists and is empty or not:

```bash
#!/bin/bash

# First argument must be a filename.
File=$1

if [ -z $1 ] ; then
        echo "Please enter a filename!"
else
        if [ -s $File ] ; then
                echo "'$File' exists and contains data."
        elif [ -e $File ] ; then
                echo "'$File' exists and is empty."
        else
                echo "'$File' does not exist."
        fi
fi
```

## {{ date_format(date="2024-04-04") }} (´。＿。｀)
> {{ date_format_journal(date="2024-04-04T22:11:59") }}

- Made just a minor contribution to an open-source project called `pyvts`. It was just fixing typo in docs.. (＞▽＜)
- Aaa-! I am not being able to commit to my promises to myself. Like, it's only 4 months in and I am not writing Personal Journals (Offline ones) that I had in my this year's resolutions. (´;ω;｀)
- Also, I am working in a Python project to do some integrations with VTube Studio and (as mentioned above) using `pyvts` for it. But I don't know where to take it and even what is needed. IT ALREADY SOUNDS CONFUSING, never mind. ( : ౦ ‸ ౦ : )
- Wah~.. forgot to mention important one for today: I came to know about this Gaming Engine - [Cocos](https://www.cocos.com/en). (☆▽☆)
- Like think for a moment; how many cool and amazing things exists in this world and we don't even have time to explore or even get to know them. Only one life feels so stupid to have..god~ I wanna do everything! (｡•́-ก̀｡)

## {{ date_format(date="2024-04-03") }} ￣へ￣
> {{ date_format_journal(date="2024-04-03T21:15:01") }}

- Today I went into the learning rabbit-hole. Basically it was ML (Machine Learning) and AI (Artificial Intelligent).
- And you know what's the fun part? I got overwhelmed and ended up with 'fried potato' brain. (～﹃～)~zZ
- Oh, out of context here, but it's kinda sad that how great people out there make/start something, give their everything to it, just like growing a child. And at the end, they (have to) abandon it.. (´;︵;`)

## {{ date_format(date="2024-04-02") }} (๑•̀ㅂ•́)و✧
> {{ date_format_journal(date="2024-04-02T07:11:23") }}

- Aaaaaa-! I created [**Bash Scripts**](https://github.com/Nerdsomeness/Blog/tree/main/scripts) to kinda automate the entry/creation of Journal and Blog and it kinda cool how everything makes sense.
- I was able to figure out everything on my own (≧∀≦). Though, looked online for regular expressions to test it.
- Really feeling proud of myself even though didn't do much today. („• ֊ •„)
- Oh, **Discord** got an updated today and there was "Loot Boxes" thing and the reward was "joker" profile decoration. I think it's April Fool's joke as it at the end mentioned "..you wasted your time opening Lootboxes". (｡￫∀￩｡)

{{ img(id="/Nerdsomeness/journal/April 02, 2024/discord-loot_boxes.png", alt="Discord Loot Boxes", title="Discord Loot Boxes", width="673", height="314", class="center") }}


## {{ date_format(date="2024-04-01") }} (^///^)
> {{ date_format_journal(date="2024-04-01T03:56:00")}}

- Finally, today deployed my **Zola** Blog/Journal to **GitHub Pages**.
- Ah, it shouldn't be that much headache if **GitHub** hadn't flagged my account. (°ー°〃)
- Wait, it's "April 1st" and I'm being serious as -! xD
- Also, there are a lot of things needs to be done in this site.. like, the translation button- Ahm- nm. (´ｰ∀ｰ`)

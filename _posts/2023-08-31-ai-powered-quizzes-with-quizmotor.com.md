---
layout: post
title: "QuizMotor - Using AI to generate simple quizzes on any topic"
categories: tech
---

There's a few technologies I've been wanting to try out lately:  GPT's Chat API, Google's [Cloud Run](https://cloud.google.com/run), [HTMX](https://htmx.org) and (if I can get it working - still WIP ) GraalVM with [Spring Boot Native](https://docs.spring.io/spring-boot/docs/current/reference/html/native-image.html).

I had an idea for a simple site that would let me use all of these technologies together - generate quizzes using GPT and power a simple webapp hosted on Cloud Run (backed with a serverless database - [Firestore](https://firebase.google.com/docs/firestore) - to keep overheads near zero), I'm calling it quizmotor.com and the _beta_ is live now - ~check it out [here](https://quizmotor.com)~. (**update:** ok, had to take it offline in 2024 - too much spam!)

### Why these technologies?
I've this nagging feeling the current frontend _du jour_ is bloated and a complete overkill for simple interactivity. Not to sound like a grey-neckbearded-old-programmer I like my server side rendering and the promise of HTMX is to keep a simple server-side stack with minimal frontend code.

I like the idea of small projects with zero overhead, but potential to scale from day-1, so Cloud run + Firestore/Datastore can both scale hugely if needed but will have almost no cost to just keep the site running, and no admin overhead of a server running. They also both support really simple clean CI/CD flows in GH actions - no DB migrations, blue/green deployments with trivial rollbacks.

The part I haven't nailed is the native image and GraalVM - the [promise here](https://brightinventions.pl/blog/spring-boot-and-the-holy-graalvm/) is super fast start-up times for the Docker container in Cloud run, a current issue is the first request to the site in a while will experience a slow first page load - not great.

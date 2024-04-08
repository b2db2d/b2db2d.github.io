# Always Be Careful

## Always remember to test the changes before committing

Make sure to check all the changes made before committing with a fork

So, each issue should only address one problem

If you have to define a large framework, indicate it in tens

The next level of refinement for that issue is in hundreds

Similarly, if there are further divisions, use thousands

At this point, the refined issue must always refer to the previous unit issue

00: UI

000: UI - mainView

0000: UI - mainView - animation

## When a problem occurs, think about how to debug it immediately

Always organize debugging-related issues

Separate crash-related issues

## Having a problem means there is an error

Always check the red marks to find where the error is before fixing it and pushing

Remove all yellow marks before committing as they may cause confusion in the code

### While waiting for approval on a pull request, open another issue.

Usually, only submit 2-3 issues

One is for long-term (taking several weeks) and two are for short-term (simple issues).

---

# Issue Creation

branch:

ver: (folk - mouse right - Copy commit SHA)

screenshot

description:

---

# GitHub Workflow

Do the work locally

Enable fork

Create a new branch with the name

! [https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9746f967-9b4c-4593-a1ba-2e463111d671/Untitled.png]

feature/issue number-issue keyword

! [https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bb894802-d919-470e-8f9d-cce71529fa3f/Untitled.png]

After pressing local change, check which part has been modified in Unstaged

Double-click on the parts you want to push (to be delivered) and move them to staged.

Then push and go to the site

(If the location of origin/develop is different, rebase here and force push)

! [https://s3-us-west-2.amazonaws.com/secure.notion-static.com/eea9d438-83da-421d-8b2d-90211827d9fd/Untitled.png]

Go to Pull requests

! [https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4e4f74a2-912b-4865-ab82-f501f26e7c39/Untitled.png]

When creating a pull request, use `resolving#issue number` or `ref #issue number` in the title.

The ref command is usually used when receiving other issues during work or when the issue in progress is related to the issue being changed by another person.

Example: Brief title (resolving #22)

## In case of receiving feedback

If you receive feedback

! [https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f7c1aec1-3524-433a-8a41-87bee9126ce0/Untitled.png]

Comments will be added like this, and they will disappear automatically when you reflect on the corresponding parts.

If the comments are not gone because other parts have been modified, inform the other person through a reply.

---

! [https://s3-us-west-2.amazonaws.com/secure.notion-static.com/336d08d9-104d-4694-af4b-aba6ddf1b35f/Untitled.png]

! [https://s3-us-west-2.amazonaws.com/secure.notion-static.com/abc66ebd-b7b3-4691-9aee-12dbad664607/Untitled.png]

---

# Issue Management

### Use rebase like a hierarchy

Each step includes the process before merging

If you want more details, refer to the referenced issue (why was it modified? how was it modified? - The process and reasons are included, so pay attention to them)

### Sync now

After submitting a pull request, check for comments and sync (check the base)

Commit the modifications again, and if there are still comments, reply to them so that you become the last author.

---

# Git Information

rebase - Clean because the history changes (so it should be pushed with force push)

merge - The history remains the same and the branch remains the same

## Rebase

### How to do it

In a state where the desired branch is checked out from the fork (a changeable state)

Perform rebase on the branch you want to rebase (right-click)

> Q: Do I have to push and then request a pull request after submitting new(origin/feature/38-roompage) to the current location of my branch? After that, should I rebase to origin/develop and force push, and then merge and fix the conflicts?
A: No, the order is reversed.
> 
> 
> First, rebase to develop before making a pull request to develop.
> 
> It is correct to rebase to develop before making a pull request,
> 
> After making a pull request, if another branch is merged into develop, resolve the conflicts when rebasing to develop again.
> 

### Cherry-pick

Similar to merge, but used when you only want to combine one commit

### Amend

Function to modify and recommit the previous commit immediately

### How to resolve conflicts (while rebasing)

The premise is that you fully understand the code...

The recommended way is to use merge, but it is recommended to use kdiff through merge in external merger

When going through kdiff, all the commented Korean text gets corrupted, so if you accidentally wrote in Korean,

Go to Settings - Configure - Regional Settings

And set File Encoding for A to utf8.

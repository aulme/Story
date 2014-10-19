Story
=====

A simple script to save and retrieve the name/number of your current task/story/etc. 'Story' here refers to an agile user story, but can be used with any sort of tasks.

#What is Story for?
You can include the current story number as part of your prompt so you won't forget it. You can also write a git hook to include it as part of each commit.

#How to use Story?
1. `Get-Story` gets the current story number. You can include this into your prompt.
2. `Set-Story x` sets the story to "x". This sets the CURRENT_STORY environmental variable, which you can also use in git hooks.

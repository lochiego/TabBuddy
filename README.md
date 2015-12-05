# Pre-work - Tipster

TabBuddy is a tip calculator application for iOS.

Submitted by: Eric Gonzalez

Time spent: 6:00 hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] Added light/dark theme
- [X] Use slider to adjust tip percent rather than segmented control

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/YyzHOMY.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [GifGrabber](http://www.gifgrabber.com/).

## Notes

Describe any challenges encountered while building the app.
I attempted to use a number formatter to apply formatting to the text input, which caused inability to modify bill amount in certain conditions. Eventually realized it would be better to go without.
Updating the currency based on region changes was problematic, since viewDidAppear does not get called when an app re-enters foreground. Eventually realized I needed to plug in to the application lifecycle and trigger the message.
Finding a good way to display the slider values took some time. Having tick marks was problematic as it tended to interfere with the text labels and would have been a pain to apply theming to. Instead went with a display of the current value above the slider.

## License

    Copyright 2015 Eric Gonzalez

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
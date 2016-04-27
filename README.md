# Group Milestone 4 - *Recommend Me*

**Recommend me** is an app that recommends restaurants and activities to you. We’ve been there before just after we just got done doing something with friends or family. Like watching a movie or eating at a restaurant. We then try to decide what the group should do next. Recommend Me app suggests activities or restaurants for your group, and gives out detailed information and locations on a map to those places.

## APIs Used
- [ ] YELP search API will be used for searching local businesses near the user 
- model class Yelp Client
  Stores properties - Business name, address, distance
- Google Maps API - Recommend Me app will send a url of the coordinates from obtained by Yelp to create a Google maps URL. The app will check if Google Maps is in fact installed by checking if a google maps url can be pushed.

## User Stories

The following **required** functionality is completed:


- [x] Initial Settings page that at first ever start of the application ask users preferences of activities they like and dislike doing.
- [x] Main Menu view controller where the user can select from to which item they want to do a recommend search from.
- [x] Main Menu uses UI Gesture Recognizers to swipe to different view controllers.
- [x] Advanced search to fine-tune both activities and restaurants.
- [x] Detail view controller of the selected places.
- [x] About page to give credit to the people who help create this and the technologies that must be credited to.

The following **optional** features are implemented:
- [ ] Opens Google Maps to give user detailed navigation directions and street views.
- [ ] Infinity scroll loading of new results.
- [ ] Custom recommend me thumbs up that presistent with its own external database. So that other Recommend Me users can know this place is highly-praised.
- [ ] Push notification to let them know that one of their friends have thumbs up a place.
- [x] Animation and transitions to the different areas of the application.

Added **optional** features that were implemented beyond ones listed above:
- [x] Opens up a map view of the business in a view controller with a button that can take you to Apple Maps for navigation.
- [x] Can go directly to a phone app to dial the business.
- [x] Grabs GPS coordinates from user's current location and attempts to display places closer to them based on the sliders selected on the main menu view controller.


## Walkthrough March 23rd:
![group1](https://cloud.githubusercontent.com/assets/14221032/14008540/09d5bc74-f13f-11e5-955d-ef786fbb691c.gif)


## Walkthrough March 30th:
![sprint2](https://cloud.githubusercontent.com/assets/14221032/14167464/6219a422-f6d0-11e5-8cdb-b79ea6b858f0.gif)

## Walkthrough April 6th 100% Required Stories:
![sprint3a](https://cloud.githubusercontent.com/assets/14221032/14344370/093f5aea-fc5c-11e5-96a3-0d650476ada4.gif)


## Walkthrough April 13th Optional + Polish
![sprint4](https://cloud.githubusercontent.com/assets/14221032/14516894/9a0c2c5a-01bc-11e6-8aa4-1214c46f5698.gif)

## Walkthrough Demo Day Ready!

<img src='https://i.imgur.com/Gu2g2oe.gif' width='' alt='Video Walkthrough' />

Note: Advanced Settings doesn't go anywhere at the moment.

    Copyright [2016] [Team Recommend Me]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

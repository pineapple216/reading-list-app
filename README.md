# Reed App
Reed is a social reading list which allows users to both upload and share web articles. Each user will have a personal list of articles which is shared with the entire social system.

##Overview


### Users
Users will login to the app using a Twitter authentication. Users will retain their twitter username, essentially using the same handle in Twitter as they do in **Reed**.  Users have the ability to create and modify **Lists**. Users also have the ability to follow other users which have authenticated to the **Reed** system.

### Lists
Each user is responsible for managing their own list. A list is comprised of 6 main states:.

- **Listed**  Any article that is added through the Safari Web Extension

- **Faved**  Any already **Listed** article that has ultimate importance. Articles can be unfazed as well which will remove the **Faved** flag and essentially return the article to simply just a **Listed** state.

- **Shared** Any article that has been added to a list from another **Reed** user.

- **Duplicated**  Any article that has been added via the Safari Web Extension, but has already been added by another **Reed** user that the current user is following.

- **Deleted**  Any article that is manually archived by the user. These articles are only visible to the user which deleted them, and no longer visible to the entire community. These articles will permanently auto-delete after a set amount of time


##MVP

###Goals
* [ ] Save from Safari (Share extension)
* [ ] Copy and paste link to save
* [ ] Read the article itself (Internal web view)
* [ ] Able to flag an article as read
* [ ] Able to favorite an article (and unfavorite)
* [ ] Follow other users and see their lists
* [ ] Three lists for the user. "To Read", "Have Read", "Favorites"

###iOS9 Wishlist
>
1. Transition to Safari View Controller
2. Port to Swift 2.0

##Design

###Logo
> ![](https://d1zjcuqflbd5k.cloudfront.net/files/acc_396957/sgSb?response-content-disposition=inline;%20filename=Screen%20Shot%202015-07-20%20at%202.21.17%20PM.png&Expires=1437416582&Signature=NPQUkdagpLlkhrU3Bu-CuUCc0Q8Tveg~WMbC-f~bdxEbYgEaM9~UT0Yh2IRfPJDIxi-4N9O1u06k50F17ZpZCVPVQSaj63fXjd9miJ965HkQ~YJpInEtriV~sMM0ojpgPqeglH8CSrOAQ6sAk1pW2D~3oALXdkVwVesX~71IdXc_&Key-Pair-Id=APKAJTEIOJM3LSMN33SA)

###Mockup
> ![](https://d1zjcuqflbd5k.cloudfront.net/files/acc_396957/1j1oB?response-content-disposition=inline;%20filename=screen_shot_2015-07-05_at_11.20.47_am.png&Expires=1437416770&Signature=DVjiTPkoVH6WANhbw2ulPpJ7pJBnla-O9GHLRr0qhFvm1VrIEd4hDODbzglulV6MtuBjxTzm1K3ph~VrK30AX2dreVNVMPcbqewyHt9zYxBx7arJ4U2cCiHGk8DTh8dWsFy~GmDxhZ1m681dlT2k83wK8FV57JpVoQR3J8bVseM_&Key-Pair-Id=APKAJTEIOJM3LSMN33SA)

###Type

>[Born](http://www.carlosdetoro.com/born/) — Titles


>[Questrial](http://www.fontsquirrel.com/fonts/questrial) — Body

###Colors
> Black — #050608

> Red — #A70E16
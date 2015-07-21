# Reed App
Reed is a social reading list which allows users to both upload and share web articles. Each user will have a personal list of articles which is shared with the entire social system.

##Overview


### Users
Users will login to the app using a Twitter authentication. Users will retain their Twitter username, essentially using the same handle in Twitter as they do in **Reed**.  Users have the ability to create and modify **Lists**. Users also have the ability to follow other users which have authenticated to the **Reed** system.

### Lists
Each user is responsible for managing their own list. A list is comprised of three main states:

- **To Read**  Any article that is added through the Safari Web Extension.
- **Have Read**  Any article that is viewed via the **To Read** list.
- **Favorites**  Only articles that are in the **Have Read** section can be tagged as a favorite. Articles can be unfavorited as well which will remove the article from the **Favorites** list and will essentially return the article to the state of **Have Read**.


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
> ![](http://i.imgur.com/LwQBbzem.png?1)

###Mockup
> ![](http://i.imgur.com/fPco5Dam.png?1)

###Type

>[Born](http://www.carlosdetoro.com/born/) — Titles


>[Questrial](http://www.fontsquirrel.com/fonts/questrial) — Body

###Colors
> Black — #050608

> Red — #A70E16
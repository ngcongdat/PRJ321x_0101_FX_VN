# Project 3

This project of `PRJ321x_0101_FX_VN`. I build it by Netbean IDE. Project request to build a web app. App is required details of project:


## Build template: 
 
- `login.jsp`: Create a form for login use POST method. This form is sent info to `loginProcess` servlet.
- Servlet `loginProcess`: Handling login process of user. `Username` and `password` will be saved in `MAP`. You must be created `Map`. When user send login request, you must be validated all fields of login form (`username` is not null, `user` must be exist on `Map`). If valid, allow user access to `index.jsp`. If not, return to `login.jsp` and show errors.
- `index.jsp`: User must be logged to access, this page includes:
    - `profile.jsp`: show infomation of user.
    - `userCounter.jsp`: show all user logged in.
- `Welcome` page: Include link to `login.jsp` page and `sign-up.jsp` page. With guest, display `Welcome to the board`, and with user, display `Welcome back!`.
- Build `sign-up` page: Guest can register user on your website. Required infomation to register user
    - `username`: Don't include `$#@%^&*` characters and must be least 6 characters.
    - `password`: Must be included 1 uppercase character, 1 number, 1 special character and must be least 8 characters.
    - User must be saved in `Map`
    - `username` must be not exist.
- All page be required login to access. If user don't login, redirect to `login.jsp`.

## Happy Coding. Good luck!

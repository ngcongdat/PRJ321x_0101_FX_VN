# Project 2

This project of `PRJ321x_0101_FX_VN`. I build it by Eclipse IDE. Required details of project:


## Build template: 
 
- Create some page as `page1.jsp` and `page2.jsp`. 
- From website: [StartBootstrap](https://startbootstrap.com/template-categories/all/), choose a template and use it for your project.
- Build layouts for your project, examples: `header.jsp`, `footer.jsp`, `righter.jsp`, v.v... Layouts will use for every page of your website.
- Use all layouts for two page `page1.jsp` and `page2.jsp`. Add some welcome content to check. 

### **Note:** Your website must be responsive.

## Redirect: 
 
- Build a JSP (ex: `login.jsp`) to get `username` and `password`.
- Build a Servlet (ex: `ControllerServlet`) to check username and password is correct. If correct, redirect user to other page (ex: page1.jsp, page2.jsp). If incorrect, redirect user to `login.jsp` again and display notify `Username and password is wrong`.

(Please create username is **`system`** and password is **`java`**). 

## Check form: 
 
Build a page to register courses. Just username is  **`admin`** and password is **`passw0rd`**, redirect to `CourseForm.jsp`. Form `CourseForm.jsp` has some info:
- Text field `name`: Don't empty and don't include `numbers`
- Text field `age`: Must be between `18` and `40` characters.
- Combobox `country`: 5 values (VietNam, USA, England, China, France).
- List view `courses`: 5 values (C#, Java, C++, Python, Ruby on Rail).
- Checkbox `languages`: 3 values (Vietnamese, English, French).
- `Submit` button: Send all values of fields to `CourseValidation`. Check validate all input. If valid, show all info. If not valid, show notify errors. 
- `Cancel` button: Return welcome page.

## Happy Coding. Good luck!

CREATE DATABASE IF NOT EXISTS myblog;

USE myblog;

-- Create Users table
CREATE TABLE IF NOT EXISTS Users(
   userID INT AUTO_INCREMENT,
   username VARCHAR(255) NOT NULL,
   password VARCHAR(32) NOT NULL,
   PRIMARY KEY (userID)
);

-- Insert value into Users table
INSERT INTO Users(username, password) VALUES ('mode', 'mode');
INSERT INTO Users(username, password) VALUES ('admin', 'admin');

-- Create Categories table
CREATE TABLE IF NOT EXISTS Categories(
   categoryID INT AUTO_INCREMENT,
   title TINYTEXT NOT NULL,
   description TINYTEXT,
   CONSTRAINT PK_CategoryID PRIMARY KEY (categoryID)
);

-- Insert value into Categories table
INSERT INTO Categories(title, description) VALUES ('Java', 'Articles about Java');
INSERT INTO Categories(title, description) VALUES ('JavaScript', 'Articles about JavaScript');
INSERT INTO Categories(title, description) VALUES ('NodeJS', 'Articles about NodeJS');
INSERT INTO Categories(title, description) VALUES ('React', 'Articles about React');
INSERT INTO Categories(title, description) VALUES ('Ruby', 'Articles about Ruby');
INSERT INTO Categories(title, description) VALUES ('Python', 'Articles about Python');

-- Create Posts table 
CREATE TABLE IF NOT EXISTS Posts(
   postID INT AUTO_INCREMENT,
   title TINYTEXT NOT NULL,
   description TINYTEXT NOT NULL,
   content MEDIUMTEXT NOT NULL,
   category INT NOT NULL,
   user INT NOT NULL,
   dateCreate DATETIME NOT NULL,
   dateUpdate DATETIME,
   CONSTRAINT PK_PostID PRIMARY KEY (postID),
   CONSTRAINT FK_UserPost FOREIGN KEY (user) REFERENCES Users (userID),
   CONSTRAINT FK_PostCategory FOREIGN KEY (user) REFERENCES Users (userID)
);

-- Insert value into Posts table
INSERT INTO Posts(title, description, content, category, user, dateCreate) 
VALUES 
(
	'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
	'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
	'<h2 style="margin: 0px 0px 10px; padding: 0px; font-weight: 400; line-height: 24px; font-size: 24px; background-color: rgb(255, 255, 255);"><font face="Courier">Why do we use it?</font></h2><p style="text-align: justify; margin: 0px 0px 15px; padding: 0px; font-family: " open="" sans",="" arial,="" sans-serif;="" background-color:="" rgb(255,="" 255,="" 255);"="">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using <u>Lorem Ipsum</u> is that it has a more-or-less normal distribution of letters, as opposed to using "Content here, content here", making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for "lorem ipsum" will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose <strike>(injected humour and the like)</strike>.</p><h2 style="text-align: center; margin: 0px 0px 10px; padding: 0px; line-height: 24px; font-size: 24px;"><font face="Courier" style=""><span style="background-color: rgb(85, 59, 255);"><font color="#fffefe" style="">Where</font></span><span style="font-weight: 400; background-color: rgb(255, 255, 255);"> does it come from?</span></font></h2><p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: " open="" sans",="" arial,="" sans-serif;="" background-color:="" rgb(255,="" 255,="" 255);"=""><b>Contrary</b> to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at <i>Hampden-Sydney College in Virginia</i>, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section <sup>1.10.32</sup>.</p><p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: " open="" sans",="" arial,="" sans-serif;="" background-color:="" rgb(255,="" 255,="" 255);"=""></p><ul><li>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</li></ul><p></p><h2 style="margin: 0px 0px 10px; padding: 0px; font-weight: 400; line-height: 24px; font-size: 24px; background-color: rgb(255, 255, 255);"><font face="Courier" color="#ff2424">Where can I get some?</font></h2><p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: " open="" sans",="" arial,="" sans-serif;="" background-color:="" rgb(255,="" 255,="" 255);"="">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don"t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn"t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate <sub>Lorem Ipsum</sub> which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p><p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: " open="" sans",="" arial,="" sans-serif;="" background-color:="" rgb(255,="" 255,="" 255);"=""><a href="https://www.lipsum.com/">Read more</a></p>',
	1,
    2,
	NOW()
);
INSERT INTO Posts(title, description, content, category, user, dateCreate) 
VALUES 
(
	'Lorem Ipsum',
	'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
	'<h2><p style="margin: 0px 0px 15px; padding: 0px; text-align: justify;"><font face="Courier" style="" size="4"><span style="background-color: rgb(255, 47, 47);"><font color="#ffffff" style="">Lorem ipsum</font></span><span style="font-weight: 400; background-color: rgb(255, 255, 255);"> dolor sit amet, consectetur adipiscing elit. <i>Donec orci ante</i>, rutrum quis gravida at, auctor in nibh. Aenean sit amet mi eleifend, semper libero vel, finibus urna. Aliquam id dui a sem efficitur gravida a quis magna. Donec eleifend, velit at efficitur tincidunt, turpis nisi venenatis nulla, non convallis erat ante non mauris. Vivamus pretium arcu sed dui commodo, eget bibendum ex volutpat. Donec eget blandit elit. Sed in viverra nisl. Suspendisse potenti. Etiam consectetur orci a malesuada fringilla. <u>Nunc elementum consequat faucibus.</u> Quisque non eros eget neque gravida auctor. Integer tellus ex, suscipit id ligula vitae, auctor tempor ante. Curabitur a erat eu massa scelerisque ullamcorper. Sed varius libero a vestibulum bibendum. Pellentesque nec scelerisque lectus.</span></font></p></h2><blockquote style="margin: 0 0 0 40px; border: none; padding: 0px;"><h2><p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-weight: 400; background-color: rgb(255, 255, 255);"><font face="Courier" size="4"><sup>Cras</sup> tempus libero justo, in pellentesque magna pellentesque eget. Proin leo est, vestibulum vel luctus et, molestie eu justo. Fusce non ligula porttitor, blandit diam at, hendrerit nisl. Sed id libero dapibus massa consequat tempus et eu orci. Phasellus gravida, tellus vel suscipit efficitur, purus urna volutpat tortor, eget auctor lectus lacus et risus. Donec tristique mollis felis, in finibus est eleifend id. Ut scelerisque faucibus erat vitae suscipit. Sed et magna tortor. Mauris maximus convallis lorem, et elementum justo ultrices quis. Curabitur lacinia neque at finibus convallis. Ut eget pretium ipsum, nec congue orci.</font></p></h2></blockquote><h2><p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-weight: 400; background-color: rgb(255, 255, 255);"><font face="Courier" size="4"><strike>Proin in mi id ipsum interdum fringilla</strike>. Sed condimentum, massa in pretium porttitor, risus nisi fermentum magna, quis porta ex augue quis sapien. Nullam sed massa ac nunc auctor placerat. Nam eget sapien vitae tortor hendrerit auctor in nec mi. Nulla scelerisque erat vitae nisl imperdiet sollicitudin. Vestibulum nibh augue, elementum sed pretium eu, vestibulum in velit. Sed tristique nunc iaculis eros ornare mollis quis ut enim. Donec pretium aliquam nisl sed convallis. Sed ut vehicula eros.</font></p><p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-weight: 400; background-color: rgb(255, 255, 255);"></p><ol><li><font face="Courier" size="4">Proin lorem <sub>orci</sub>, semper nec rhoncus sed, fermentum at erat. Donec sit amet nisi eros. Pellentesque a vehicula nulla. Ut et felis in mi tristique mollis non id orci. In hac habitasse platea dictumst. Vestibulum a sagittis ipsum. Donec vestibulum massa quis dignissim hendrerit.</font></li></ol><p></p><p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; font-weight: 400; background-color: rgb(255, 255, 255);"><font face="Courier" style="" size="4" color="#4c38d0">Ut vel massa ut eros condimentum mattis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam lacus mi, imperdiet et elit nec, vehicula tincidunt enim. Curabitur molestie convallis ex, nec sagittis sem egestas vel. Vivamus eget mauris consectetur, iaculis orci sit amet, ultricies diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla a tempus dolor.</font></p></h2>',
	1,
    2,
	NOW()
);
INSERT INTO Posts(title, description, content, category, user, dateCreate) 
VALUES 
(
	'Origins and Discovery',
	'Lorem ipsum began as scrambled, nonsensical Latin derived from Cicero\'s 1st-century BC text De Finibus Bonorum et Malorum',
	'<p class="f4 cl-white mt0 mb16" style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; font-size: 1.1875em; font-family: " mercury="" ssm="" a",="" "mercury="" b",="" georgia,="" times,="" "times="" new="" roman",="" "microsoft="" yahei="" new",="" yahei",="" å¾®è½¯é??é»?,="" å®?ä½?,="" simsun,="" stxihei,="" å??æ??ç»?é»?,="" serif;="" line-height:="" 1.5;"=""><span style="background-color: rgb(255, 255, 255);"><font color="#0d0c0c">Until recently, the prevailing view assumed&nbsp;<em style="-webkit-tap-highlight-color: transparent; box-sizing: border-box;">lorem ipsum</em>&nbsp;was born as a nonsense text. â??It"s not Latin, though it looks like it, and it actually says nothing,â??&nbsp;<em style="-webkit-tap-highlight-color: transparent; box-sizing: border-box;">Before &amp; After</em>&nbsp;magazine&nbsp;<a href="https://www.straightdope.com/columns/read/2290/what-does-the-filler-text-lorem-ipsum-mean/" target="_blank" rel="noopener" title="Straight Dope â?? What Does the Filler Text Lorem Ipsum Mean?" style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; text-decoration-line: none; border-bottom: 1px solid rgb(211, 219, 228); transition: all 400ms cubic-bezier(0.16, 0.68, 0.43, 0.99) 0s;">answered a curious reader</a>, â??Its â??wordsâ?? loosely approximate the frequency with which letters occur in English, which is why at a glance it looks pretty real.â??</font></span></p><p class="f4 cl-white mv16" style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 1em; margin-bottom: 1em; font-size: 1.1875em; font-family: " mercury="" ssm="" a",="" "mercury="" b",="" georgia,="" times,="" "times="" new="" roman",="" "microsoft="" yahei="" new",="" yahei",="" å¾®è½¯é??é»?,="" å®?ä½?,="" simsun,="" stxihei,="" å??æ??ç»?é»?,="" serif;="" line-height:="" 1.5;"=""><span style="background-color: rgb(255, 255, 255);"><font color="#0d0c0c">As Cicero would put it, â??Um, not so fast.â??</font></span></p><p class="f4 cl-white mv16" style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 1em; margin-bottom: 1em; font-size: 1.1875em; font-family: " mercury="" ssm="" a",="" "mercury="" b",="" georgia,="" times,="" "times="" new="" roman",="" "microsoft="" yahei="" new",="" yahei",="" å¾®è½¯é??é»?,="" å®?ä½?,="" simsun,="" stxihei,="" å??æ??ç»?é»?,="" serif;="" line-height:="" 1.5;"=""><span style="background-color: rgb(255, 255, 255);"><font color="#0d0c0c">The placeholder text, beginning with the line&nbsp;<em style="-webkit-tap-highlight-color: transparent; box-sizing: border-box;">â??Lorem ipsum dolor sit amet, consectetur adipiscing elitâ??</em>, looks like Latin because in its youth, centuries ago, it was Latin.</font></span></p><p class="f4 cl-white mv16" style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 1em; margin-bottom: 1em; font-size: 1.1875em; font-family: " mercury="" ssm="" a",="" "mercury="" b",="" georgia,="" times,="" "times="" new="" roman",="" "microsoft="" yahei="" new",="" yahei",="" å¾®è½¯é??é»?,="" å®?ä½?,="" simsun,="" stxihei,="" å??æ??ç»?é»?,="" serif;="" line-height:="" 1.5;"=""><span style="background-color: rgb(255, 255, 255);"><font color="#0d0c0c">Richard McClintock, a Latin scholar from Hampden-Sydney College, is&nbsp;<a href="https://en.wikipedia.org/wiki/Lorem_ipsum" target="_blank" rel="noopener" title="Wikipedia â?? Lorem Ipsum" style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; text-decoration-line: none; border-bottom: 1px solid rgb(211, 219, 228); transition: all 400ms cubic-bezier(0.16, 0.68, 0.43, 0.99) 0s;">credited</a>&nbsp;with discovering the source behind the ubiquitous filler text. In seeing a sample of&nbsp;<em style="-webkit-tap-highlight-color: transparent; box-sizing: border-box;">lorem ipsum</em>, his interest was piqued by&nbsp;<em style="-webkit-tap-highlight-color: transparent; box-sizing: border-box;">consectetur</em>â??a genuine, albeit rare, Latin word. Consulting a Latin dictionary led McClintock to a passage from&nbsp;<em style="-webkit-tap-highlight-color: transparent; box-sizing: border-box;">De Finibus Bonorum et Malorum</em>&nbsp;(â??On the Extremes of Good and Evilâ??), a first-century B.C. text from the Roman philosopher Cicero.</font></span></p>',
	1,
    2,
	NOW()
);

select * from Users;
select * from Categories;
select * from Posts;
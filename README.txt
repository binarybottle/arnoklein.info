1. Edit files in MS Word

2. Use "Convert to HTML5 300 dpi png" template in DocConverter Pro
   https://docconverter.pro/Home/Dashboard
   to convert each of the .docx files to html

3. Download the compressed directories

4. Move all *.html pages into a www parent folder:

mkdir www
mv index/index.html www/
mv cv/cv.html www/
mv brain/brain.html www/
mv mind/mind.html www/
mv design/design.html www/

5. Create an images folder and rename all images folders as subfolders:

mkdir www/images
mv index/images www/images/index
mv cv/images www/images/cv
mv brain/images www/images/brain
mv mind/images www/images/mind
mv design/images www/images/design

6. Replace all references to "images/" in the html files to these new folders. 
   For example, in cv.html, replace "images/" with "images/cv/"

7. Add to each html file's <head>:

   <link rel="stylesheet" type="text/css" href="./style.css">

8. Load to webhost:

tar cvfz www.tar.gz www
scp www.tar.gz binarybottle@arnoklein.info:arnoklein.info/www.tar.gz
sshb 

9. Give recursive permissions:

chmod -R a+rx *

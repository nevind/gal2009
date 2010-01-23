@echo off

echo -
echo -----------------------
echo -    Redeploy GAL     -
echo -----------------------
echo -
echo Copying client...
echo -
copy D:\studia\gal2009\app\GalClient\bin\GalClient.swf D:\Programy\Tomcat6\webapps\gal\gal-client-0.1.swf /Y
echo -
echo Not copying html wrapper! Full deployment required for wrapper update...
echo -
echo Copying server classes...
echo -
xcopy D:\studia\gal2009\app\GalServer\bin D:\Programy\Tomcat6\webapps\gal\WEB-INF\classes\ /E /H /R /Y
echo -
echo Not copying server libraries! Full deployment required for libraries update...
echo -
echo Copying web application configuration...
echo -
xcopy D:\studia\gal2009\app\GalServer\src\main\webapp D:\Programy\Tomcat6\webapps\gal\ /E /H /R /Y
echo -
echo Touching watch file...
echo -
touch D:\Programy\Tomcat6\webapps\gal\WEB-INF\touchfile
echo -
echo -----------------------
echo -        Done         -
echo -----------------------
echo -

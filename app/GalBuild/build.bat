@echo off

echo -
echo -----------------------
echo -    Building GAL     -
echo -----------------------
echo -

call compile.bat

echo -
echo -----------------------
echo -     Deploying       -
echo -----------------------
echo -

call deploy.bat

echo -
echo -----------------------
echo -        Done         -
echo -----------------------
echo -

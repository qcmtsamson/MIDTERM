#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir temdir/static

cp midterm_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/templates/.

echo "FROM python" > tempdir/Dockerfiile
echo "RUN pip install flask" >> tempdir/Dockerfiile
echo "COPY ./static /home/myapp/static" >> tempdir/Dockerfiile
echo "COPY ./templates /home/myapp/templates" >> tempdir/Dockerfiile
echo "COPY midterm_app.py /home/myapp" >> tempdir/Dockerfiile
echo "EXPOSE 5050" >> tempdir/Dockerfiile
echo "CMD python3 /home/myapp/midterm_app.py" >> tempdir/Dockerfiile

cd tempdir
docker build -t midtermapp . 
docker run -t -d -p 5050:5050 --name midtermrun midtermapp 
docker ps -a
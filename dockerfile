#Copy the below template for creating Docker file from https://hub.docker.com/_/python

FROM python:3.10-slim-buster

WORKDIR D:\Scaler_DSML_Projects\DSML_Docker

COPY requirements.txt ./
RUN python3 -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "-m", "flask", "--app", "loan_application", "run", "--host=0.0.0.0" ]

#if we want to make the server available to the public, we need to include --host=0.0.0.0 in CMD
#run thie cmd in terminal to build dockerfile -> docker build -t anirudh047/dsml_docker_loan_app . (here -t is tag)
#Docker instance (dockerdetop app)should be open before building the image (i.e before running above cmd)
#after running above cmd, docker image will be created (run this cmd to view image -> docker images )
#run this cmd to run the image -> docker run -p 8000:5000 anirudh047/dsml_docker_loan_app ->here the port is redireded form 5000 to 8000 for our image
# to push the image to docker repository ->  docker push anirudh047/dsml_docker_loan_app
# first time login required to access docker repo -> docker login -u anirudh047
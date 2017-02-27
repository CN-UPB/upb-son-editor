FROM pgsandman2016/upb-son-editor-backend-base:v1

# load nginx config
COPY ./nginx.conf /etc/nginx/conf.d/nginx.conf

#install the son-editor-frontend
RUN git clone https://github.com/CN-UPB/upb-son-editor-frontend /var/www/
COPY ./constants.js /var/www/js/constants.js


#install the son-editor-backend
RUN git clone https://github.com/CN-UPB/upb-son-editor-backend app
RUN cp -R app /
WORKDIR /app
RUN pip install -e .
COPY ./config.yaml /app/src/son_editor/config.yaml

EXPOSE 80

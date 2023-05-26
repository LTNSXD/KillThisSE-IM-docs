FROM python:3.9 as tmp

WORKDIR /opt/tmp

COPY . /opt/tmp

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt

RUN mkdocs build

FROM nginx:latest

COPY --from=tmp /opt/tmp/site /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
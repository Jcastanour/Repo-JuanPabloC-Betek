FROM alpine:3.20
LABEL autor="prueba"
ARG VERSION=1.0
ENV APP_ENV=dev
WORKDIR /app
COPY archivo.txt /app/archivo.txt
RUN echo "version=$VERSION" > /app/version.txt
ADD archivo.txt /app/archivo2.txt
VOLUME ["/data"]
CMD ["sh", "-c", "echo APP_ENV=$APP_ENV && cat /app/archivo.txt && cat /app/version.txt"]

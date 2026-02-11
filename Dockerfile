FROM linuxserver/wireguard:latest

# Устанавливаем wstunnel
RUN apk add --no-cache curl \
    && curl -L https://github.com/erebe/wstunnel/releases/latest/download/wstunnel_linux_x86_64 \
       -o /usr/local/bin/wstunnel \
    && chmod +x /usr/local/bin/wstunnel

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]

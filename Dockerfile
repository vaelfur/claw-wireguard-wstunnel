FROM linuxserver/wireguard:latest

# Устанавливаем wstunnel + dos2unix (для фикса CRLF)
RUN apk add --no-cache curl \
    && curl -L https://github.com/erebe/wstunnel/releases/latest/download/wstunnel_linux_arm64 \
       -o /usr/local/bin/wstunnel \
    && chmod +x /usr/local/bin/wstunnel

# Копируем файлы
COPY wg0.conf /config/wg0.conf
COPY entrypoint.sh /entrypoint.sh

# Фиксим line endings и права
RUN dos2unix /entrypoint.sh && \
    chmod +x /entrypoint.sh && \
    chmod 644 /config/wg0.conf  # если нужно

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]

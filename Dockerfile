FROM debian:bullseye-slim

# Instale o BIND9
RUN apt-get update && apt-get install -y bind9

# Crie diretórios necessários e ajuste permissões
RUN mkdir -p /var/bind /etc/bind/zones && \
    chmod 775 /var/bind /etc/bind/zones

# Copie os arquivos de configuração e zona
COPY named.conf.local /etc/bind/
COPY named.conf.options /etc/bind/
COPY db.matheusmauricio.net /etc/bind/zones/

# Ajuste as permissões dos arquivos
RUN chmod 644 /etc/bind/named.conf.options && \
    chmod 755 /etc/bind /etc/bind/zones

# Exponha a porta DNS (53)
EXPOSE 53/udp

# Comando para iniciar o BIND9 em primeiro plano
CMD ["named", "-g"]

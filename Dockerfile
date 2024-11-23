# Use uma imagem base do Ubuntu
FROM ubuntu:20.04

# Instala as dependências necessárias
RUN apt-get update && apt-get install -y \
  wget \
  unzip \
  libssl-dev \
  && apt-get clean

# Baixa o servidor Minecraft Bedrock
RUN wget https://minecraft.net/en-us/download/server/bedrock -O bedrock-server.zip
RUN unzip bedrock-server.zip && rm bedrock-server.zip

# Exponha a porta 19132 (padrão do Minecraft Bedrock)
EXPOSE 19132/udp

# Comando para iniciar o servidor
CMD ["./bedrock_server"]

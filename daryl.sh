#!/bin/bash

## PRÉ-REQUISITOS:

## Instalando inteligência artificial Ollama (https://github.com/ollama/ollama):
# $ curl -fsSL https://ollama.com/install.sh | sh
# ou
# $ docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama

## Instalando piper (https://github.com/rhasspy/piper):
# Baixe o arquivo tar.gz para a plataforma do seu computador
# https://github.com/rhasspy/piper/releases/tag/2023.11.14-2
# $ tar -xvzf piper_arm64.tar.gz ~/opt/
# $ ln -s ~/opt/piper/piper ~/bin/piper
# Baixe a voz em português
# https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx
# https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx.json

# TODO: instalar programa para processar a voz através do microfone para transformá-la em texto (https://github.com/openai/whisper)

resposta=""

if [ $# -gt 0 ]
then

    filename="/tmp/.resposta_`date +%s`"
    curl -s http://localhost:11434/api/generate -d "{\"model\":\"phi3\",\"stream\":false,\"prompt\":\"${1}\"}" | jq .response > $filename

    resposta="$(cat $filename | sed 's/\*//g')"
else
  resposta="Olá, meu nome é Dariu. Como posso te ajudar?"
fi

printf %b "$resposta"
printf %b "$resposta" | piper -m ~/opt/piper/pt_BR/pt_BR-faber-medium.onnx --output-raw | aplay -r 20050 -f s16_le -t raw -

# arecord -r 192000 -f s16_le --buffer-time=1 - | aplay --buffer-time=1



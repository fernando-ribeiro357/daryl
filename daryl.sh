#!/bin/bash
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



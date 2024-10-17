#!/bin/bash
resposta=""

if [ $# -gt 0 ]
then
    filename="/tmp/.resposta_`date +%s`"
    curl -s http://localhost:11434/api/generate -d "{\"model\":\"gemma2\",\"stream\":false,\"prompt\":\"${1}\"}" | jq .response > $filename
   
    resposta="$(cat $filename | sed 's/\*//g')"

else

  resposta="Olá. Como posso te ajudar hoje?"

fi

printf %b "$resposta"
printf %b "$resposta" | piper -m /opt/piper/pt-BR/pt_BR-faber-medium.onnx --sentence_silence 0.5 --output_raw | aplay -r 20050 -Dplughw:1,0 -f S16_LE -t raw -
# arecord -r 192000 -f s16_le --buffer-time=1 - | aplay --buffer-time=1



# D.A.R.Y.L. 
Significa Data Analyzing Robot Youth Lifeform (Robô de Análise de Dados da Vida Jovem).

## Sobre
Script para utilizar Ollama e Piper para falar as respostas dos prompts à inteligência artificial

## PRÉ-REQUISITOS:

### Inteligência artificial Ollama (https://github.com/ollama/ollama):

`$ curl -fsSL https://ollama.com/install.sh | sh`

ou

`$ docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama`

### Piper (https://github.com/rhasspy/piper):
Baixe o arquivo tar.gz para a plataforma do seu computador
- https://github.com/rhasspy/piper/releases/tag/2023.11.14-2

Extraindo arquivos
`$ tar -xvzf piper_arm64.tar.gz --directory ~/opt/`

Criação do link simbólico para o executável no diretório bin do usuário
`$ ln -s ~/opt/piper/piper ~/bin/piper`

### Baixe a voz em português
- https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx
- https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx.json


> TODO: instalar programa para processar a voz através do microfone para transformá-la em texto (https://github.com/openai/whisper) 

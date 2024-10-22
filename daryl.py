#!/home/orangepi/daryl/venv/bin/python

import os
import re
import asyncio
from ollama import AsyncClient, ResponseError

def responder_prompt():
    ''' 
    Função para receber o prompt do usuário e fazer a 
    requisição assíncrona ao chat com o prompt fornecido 
    '''
    prompt = input('Entre com o prompt: ')
    asyncio.run(chat(prompt))
    print('\n\n')


def retira_aster(text):
    ''' 
    Função para retirar o caracter '*' do texto fornecido  
    '''
    return re.sub('\*', '', text)


async def chat(prompt):
    ''' 
    Função que implementa o cliente do Ollama  
    '''
    message = {'role': 'user', 'content': prompt}
    try:
        async for part in await AsyncClient().chat(model='llama3.1', messages=[message], stream=True):
            saida = retira_aster(part['message']['content'])
            print(saida, end='', flush=True)
    except ResponseError as e:
        print('Error:', e.error)


def main():
    '''
    Função principal que inicia o programa 
    '''
    os.system('clear')
    responder_prompt()


if __name__ == '__main__':
    main()



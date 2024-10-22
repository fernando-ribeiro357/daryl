#!/home/orangepi/daryl/venv/bin/python

import os
import re
import asyncio
from ollama import AsyncClient, ResponseError

def responder_prompt():
<<<<<<< HEAD
    ''' 
    Função para receber o prompt do usuário e fazer a 
    requisição assíncrona ao chat com o prompt fornecido 
    '''
    
    prompt = input('Entre com o prompt: ')
=======
    ''' Função para fazer a requisição ao Ollama com o prompt fornecido '''
    prompt = input('Entre com o prompt: ')
    # chat(prompt)
>>>>>>> 50b01aced58412941bbd47d1a12080eb57d8b976
    asyncio.run(chat(prompt))
    print('\n\n')


def retira_aster(text):
<<<<<<< HEAD
    ''' 
    Função para retirar o caracte '*' do texto fornecido  
    '''

=======
>>>>>>> 50b01aced58412941bbd47d1a12080eb57d8b976
    return re.sub('\*', '', text)


async def chat(prompt):
<<<<<<< HEAD
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

=======
  message = {'role': 'user', 'content': prompt}
  try:
    async for part in await AsyncClient().chat(model='gemma2', messages=[message], stream=True):
        saida = retira_aster(part['message']['content'])
        print(saida, end='', flush=True)
  except ResponseError as e:
    print('Error:', e.error)


def main():
    ''' Função principal que inicia o programa '''
>>>>>>> 50b01aced58412941bbd47d1a12080eb57d8b976
    os.system('clear')
    responder_prompt()

if __name__ == '__main__':
<<<<<<< HEAD
    main()
=======
    main()
>>>>>>> 50b01aced58412941bbd47d1a12080eb57d8b976

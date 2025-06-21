import google.generativeai as genai
import os

# Configura sua chave de API
# É uma boa prática carregar a chave de uma variável de ambiente para segurança
# export GOOGLE_API_KEY="SUA_CHAVE_DE_API" no seu .bashrc ou .profile
api_key = os.getenv("GOOGLE_API_KEY", "SUA_CHAVE_DE_API") # NUNCA coloque a chave aqui diretamente em produção
genai.configure(api_key=api_key)

# Inicializa o modelo Gemini
model = genai.GenerativeModel('gemini-1.5-flash')

print("Gemini CLI - Digite sua pergunta ou 'sair' para encerrar.")

while True:
    user_input = input("Você: ")
    if user_input.lower() == 'sair':
        break

    try:
        response = model.generate_content(user_input)
        print(f"Gemini: {response.text}")
    except Exception as e:
        print(f"Erro: {e}")

print("Sessão encerrada.")

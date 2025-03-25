CREATE DATABASE cripto;
-- Tabela de Usuários (Cadastro e Login)
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Artigos e Recursos Educativos (ChainXEducation)
CREATE TABLE chainXeducation (
    id_artigo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    conteudo TEXT NOT NULL,
    autor VARCHAR(100),
    data_publicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    categoria VARCHAR(100) -- Ex: "Blockchain", "Investimentos", "Criptomoedas"
);

-- Tabela de Simulador de Investimentos
CREATE TABLE simulador_investimentos (
    id_simulacao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT, -- FK para usuários
    nome_investimento VARCHAR(100), -- Ex: "Bitcoin", "Ethereum"
    valor_investido DECIMAL(15, 2), -- Ex: 1500.00
    taxa_retorno DECIMAL(5, 2), -- Ex: 5.25% ao ano
    data_simulacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabela de Histórico de Resultados do Simulador
CREATE TABLE resultados_simulador (
    id_resultado INT AUTO_INCREMENT PRIMARY KEY,
    id_simulacao INT, -- FK para simulador_investimentos
    valor_final DECIMAL(15, 2), -- Valor após simulação
    periodo INT, -- Período (em meses ou anos)
    FOREIGN KEY (id_simulacao) REFERENCES simulador_investimentos(id_simulacao)
);

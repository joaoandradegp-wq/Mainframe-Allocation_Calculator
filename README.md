<h1 align="center">☁️ Allocation Calculator</h1>

<p align="center">
Ferramenta para cálculo automático de alocação física em ambientes Mainframe.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Status-Legado-yellow">
  <img src="https://img.shields.io/badge/Linguagem-Delphi%207-blue">
  <img src="https://img.shields.io/badge/Tipo-Mainframe%20Utility-lightgrey">
</p>

<h2>📌 Sobre</h2>

<p>
O <b>Allocation Calculator</b> foi desenvolvido para automatizar cálculos de alocação utilizados em ambientes Mainframe.
</p>

<p>
A ferramenta elimina a necessidade de cálculos manuais envolvendo Tracks, Cylinders, Bytes, Block Size e comandos SPACE utilizados em JCL.
</p>

<p>
Com poucos dados informados pelo usuário, o aplicativo calcula automaticamente toda a estrutura física necessária para criação e dimensionamento de datasets.
</p>

<h2>⚙️ O que ele faz</h2>

<p>Durante o processamento, o aplicativo:</p>

<ul>
  <li>Calcula tamanho total em Bytes</li>
  <li>Converte automaticamente para KB, MB, GB e TB</li>
  <li>Calcula quantidade de Tracks</li>
  <li>Calcula quantidade de Cylinders</li>
  <li>Gera parâmetros SPACE prontos para JCL</li>
  <li>Calcula alocação primária e secundária</li>
  <li>Calcula Block Size otimizado</li>
  <li>Valida entradas inválidas automaticamente</li>
</ul>

<p>Tudo isso acontece automaticamente em uma única execução.</p>

<h2>🧠 Regras de cálculo</h2>

<p>A ferramenta utiliza regras clássicas de alocação física em Mainframe:</p>

<ul>
  <li><b>1 Track:</b> 48.000 bytes</li>
  <li><b>1 Cylinder:</b> 15 Tracks</li>
  <li><b>1 Cylinder:</b> 720.000 bytes</li>
</ul>

<p>Os cálculos são realizados automaticamente utilizando:</p>

<ul>
  <li>Total de registros</li>
  <li>Tamanho lógico do registro</li>
  <li>Block Size selecionado</li>
</ul>

<h2>📦 Cálculo de Block Size</h2>

<p>
O sistema possui cálculo automático de BLKSIZE baseado nos limites físicos mais utilizados em ambientes Mainframe:
</p>

<ul>
  <li>27990 bytes</li>
  <li>32760 bytes</li>
</ul>

<p>
O cálculo utiliza truncamento matemático para encontrar o maior múltiplo válido do tamanho lógico do registro.
</p>

<p>
Isso ajuda a maximizar aproveitamento físico do dataset e reduzir desperdício de espaço.
</p>

<h2>📊 Conversões automáticas</h2>

<p>O aplicativo converte automaticamente:</p>

<ul>
  <li>Bytes → KB</li>
  <li>KB → MB</li>
  <li>MB → GB</li>
  <li>GB → TB</li>
</ul>

<p>
Todos os valores são exibidos formatados automaticamente na interface.
</p>

<h2>📋 Geração automática de SPACE</h2>

<p>
O sistema gera automaticamente comandos prontos para utilização em JCL:
</p>

<p><b>Exemplo:</b></p>

<pre>
SPACE=(TRK,(150,1),RLSE)
SPACE=(CYL,(10,1),RLSE)
</pre>

<p>
Também gera versões para expansão secundária automática:
</p>

<pre>
SPACE=(TRK,(150,150),RLSE)
SPACE=(CYL,(10,10),RLSE)
</pre>

<h2>📊 Exemplo de processamento</h2>

<p><b>Entrada:</b></p>

<pre>
Quantidade de registros: 100000
Tamanho lógico: 300
</pre>

<p><b>Saída:</b></p>

<pre>
Bytes: 30.000.000
Tracks: 625
Cylinders: 42

SPACE=(TRK,(625,1),RLSE)
SPACE=(CYL,(42,1),RLSE)
</pre>

<h2>🚀 Como usar</h2>

<ol>
  <li>Informe a quantidade de registros</li>
  <li>Informe o tamanho lógico do registro</li>
  <li>Selecione o modo de Block Size</li>
  <li>Clique em <b>Calculate</b></li>
  <li>Veja os resultados automaticamente</li>
  <li>Copie os parâmetros SPACE gerados</li>
</ol>

<h2>🎯 O que isso resolve</h2>

<ul>
  <li>Evita cálculos manuais de alocação</li>
  <li>Reduz erros em parâmetros SPACE</li>
  <li>Facilita dimensionamento de datasets</li>
  <li>Agiliza criação de JCLs</li>
  <li>Melhora cálculo de Block Size</li>
  <li>Ajuda em capacity planning</li>
</ul>

<h2>⚠️ Validações</h2>

<p>O sistema possui validações automáticas para evitar erros:</p>

<ul>
  <li>Bloqueio de letras</li>
  <li>Bloqueio de caracteres especiais</li>
  <li>Validação de campos vazios</li>
  <li>Controle de execução incompleta</li>
</ul>

<p>
O cálculo só pode ser executado quando os campos obrigatórios forem preenchidos corretamente.
</p>

<h2>🖥️ Interface</h2>

<ul>
  <li>Entrada para quantidade de registros</li>
  <li>Entrada para tamanho lógico</li>
  <li>Seleção de Block Size</li>
  <li>Resultado formatado automaticamente</li>
  <li>Geração instantânea de comandos SPACE</li>
  <li>Área de saída para JCL</li>
  <li>Status operacional</li>
</ul>

<h2>🛠️ Tecnologias</h2>

<ul>
  <li>Delphi 7</li>
  <li>VCL (Visual Component Library)</li>
  <li>Windows API</li>
  <li>WinSkinData</li>
</ul>

<h2>📸 Preview</h2>

<p align="center">
  <img width="500" height="392" alt="image" src="https://github.com/user-attachments/assets/737870ed-a36c-4491-8afc-fd99a616e4ac" />
</p>

<h2>📥 Download</h2>

<p align="center">
  <a href="#">
    <img src="https://img.shields.io/badge/Download-Allocation%20Calculator-blue?style=for-the-badge">
  </a>
</p>

<p align="center">
Ferramenta criada para eliminar cálculos manuais de allocation em ambientes Mainframe ☁️
</p>

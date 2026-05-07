<h1 align="center">☁️ Allocation Calculator</h1>

<p align="center">
Ferramenta desenvolvida para automatizar cálculos de alocação utilizados em ambientes Mainframe, convertendo volumes de registros em parâmetros prontos para JCL, SPACE allocation e dimensionamento físico de datasets.
</p>

<p align="center">
O aplicativo elimina cálculos manuais envolvendo Tracks, Cylinders, Block Size e conversões de armazenamento, reduzindo erros operacionais e acelerando processos de criação de datasets em ambientes z/OS.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Status-Legacy-orange">
  <img src="https://img.shields.io/badge/Platform-Windows-blue">
  <img src="https://img.shields.io/badge/Language-Delphi%207-red">
  <img src="https://img.shields.io/badge/Environment-Mainframe-lightgrey">
</p>

---

## ✨ Funcionalidades

<table style="border: none; border-collapse: collapse;">

<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

### 📦 CÁLCULO DE ALOCAÇÃO

O sistema calcula automaticamente:

<ul>
<li>Total de Bytes</li>
<li>KBytes</li>
<li>MBytes</li>
<li>GBytes</li>
<li>TBytes</li>
<li>Quantidade de Tracks</li>
<li>Quantidade de Cylinders</li>
</ul>

Todos os cálculos são realizados automaticamente a partir da quantidade de registros e tamanho lógico informado pelo usuário.

<br>

</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

### 🧠 GERAÇÃO AUTOMÁTICA DE SPACE

O aplicativo gera automaticamente comandos prontos para utilização em JCL:

<ul>
<li>SPACE=(TRK,...)</li>
<li>SPACE=(CYL,...)</li>
<li>RLSE automático</li>
</ul>

Também calcula valores secundários de alocação para expansão dinâmica de datasets.

<br>

</td>
</tr>

<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

### ⚙️ CÁLCULO DE BLOCK SIZE

O sistema possui cálculo automático de Block Size baseado em:

<ul>
<li>27990 bytes</li>
<li>32760 bytes</li>
</ul>

O cálculo utiliza truncamento inteligente para encontrar o melhor múltiplo possível do tamanho lógico do registro.

<br>

Exemplo interno:

<ul>
<li>BLKSIZE otimizado para RECFM fixo</li>
<li>Aproveitamento máximo do bloco físico</li>
<li>Redução de desperdício de espaço</li>
</ul>

</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

### 📊 CONVERSÕES AUTOMÁTICAS

A aplicação converte automaticamente:

<ul>
<li>Bytes → KB</li>
<li>KB → MB</li>
<li>MB → GB</li>
<li>GB → TB</li>
</ul>

Os valores são exibidos formatados para facilitar análises operacionais e validações de capacidade.

<br>

</td>
</tr>

<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

### 🖥️ INTERFACE OPERACIONAL

Interface desenvolvida em Delphi 7 com foco em produtividade operacional:

<ul>
<li>Cálculo via botão ou ENTER</li>
<li>Bloqueio de caracteres inválidos</li>
<li>Seleção rápida via CTRL+A</li>
<li>Limpeza automática de sessão</li>
<li>Geração instantânea dos parâmetros</li>
</ul>

<br>

</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

### 🔒 VALIDAÇÕES AUTOMÁTICAS

O sistema impede entradas inválidas automaticamente:

<ul>
<li>Bloqueio de caracteres especiais</li>
<li>Bloqueio de letras</li>
<li>Validação de campos obrigatórios</li>
<li>Controle de execução incompleta</li>
</ul>

O botão de cálculo só é habilitado quando os parâmetros mínimos são informados corretamente.

</td>
</tr>

</table>

---

## 🧮 Regras de Negócio

<table style="border: none; border-collapse: collapse;">

<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

### 📐 CÁLCULO BASE

O sistema utiliza parâmetros físicos clássicos de Mainframe:

<ul>
<li>15 tracks por cylinder</li>
<li>48.000 bytes por track</li>
<li>720.000 bytes por cylinder</li>
</ul>

Fórmulas utilizadas:

<ul>
<li>Total Bytes = Quantidade × Tamanho Registro</li>
<li>Tracks = Bytes / 48000</li>
<li>Cylinders = Bytes / 720000</li>
</ul>

</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

### ☁️ SPACE PRIMARY E SECONDARY

O aplicativo gera automaticamente:

<ul>
<li>Primary Allocation</li>
<li>Secondary Allocation</li>
<li>RLSE</li>
</ul>

Exemplo gerado:

<pre>
SPACE=(TRK,(150,1),RLSE)
SPACE=(CYL,(10,1),RLSE)
</pre>

Também cria versões para expansão proporcional automática.

</td>
</tr>

<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

### 📦 BLOCK SIZE OTIMIZADO

O cálculo de BLKSIZE utiliza:

<ul>
<li>Truncamento matemático</li>
<li>Múltiplos válidos do LRECL</li>
<li>Limites físicos de bloco</li>
</ul>

Modos disponíveis:

<ul>
<li>27990</li>
<li>32760</li>
</ul>

O objetivo é maximizar utilização física do dataset sem ultrapassar limites do ambiente.

</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

### ⚡ EXECUÇÃO RÁPIDA

O cálculo pode ser executado:

<ul>
<li>Pelo botão Calculate</li>
<li>Pressionando ENTER</li>
</ul>

O sistema automaticamente:

<ul>
<li>Atualiza todos os campos</li>
<li>Gera comandos JCL</li>
<li>Calcula expansão secundária</li>
<li>Atualiza conversões de armazenamento</li>
</ul>

</td>
</tr>

</table>

---

## 📋 Saídas Geradas

<table style="border: none; border-collapse: collapse;">

<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

### 📄 OUTPUT OPERACIONAL

O sistema gera automaticamente:

<ul>
<li>Total de armazenamento</li>
<li>Quantidade de Tracks</li>
<li>Quantidade de Cylinders</li>
<li>BLKSIZE ideal</li>
<li>SPACE TRK</li>
<li>SPACE CYL</li>
</ul>

</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

### 🧾 COMANDOS PRONTOS

Os parâmetros gerados podem ser utilizados diretamente em:

<ul>
<li>JCL</li>
<li>IEFBR14</li>
<li>IDCAMS</li>
<li>ALLOCATE</li>
<li>Procedures</li>
<li>Rotinas Batch</li>
</ul>

</td>
</tr>

</table>

---

## 🖼️ Tecnologias Utilizadas

<ul>
<li>Delphi 7</li>
<li>VCL Components</li>
<li>Windows API</li>
<li>WinSkinData</li>
</ul>

---

## 📥 Download

<p align="center">
  <a href="#">
    <img src="https://img.shields.io/badge/Download-Allocation%20Calculator-blue?style=for-the-badge">
  </a>
</p>

---

<p align="center">
Desenvolvido para automatizar cálculos que normalmente eram feitos manualmente em ambientes Mainframe ☁️
</p>

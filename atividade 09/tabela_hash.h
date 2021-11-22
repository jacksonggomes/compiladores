#ifndef TABELA_HASH_H_INCLUDED
#define TABELA_HASH_H_INCLUDED

#define M 19

typedef struct {
	int matricula;
	char nome[50];
} Pessoa;

typedef struct no {
	Pessoa pessoa;
	struct no *proximo;
} No;

typedef struct {
	No *inicio;
	int tam;
} Lista;


Lista *tabela[M];

Pessoa criarPessoa();
void imprimirPessoa(Pessoa p);
void imprimirPessoa(Pessoa p) ; 
Lista* criarLista();
void inserirInicio(Pessoa p, Lista *lista);
No* buscarNo(int mat, No *inicio);
void imprimirLista(No *inicio);
void inicializar();
int funcaoEspalhamento(int mat);
void inserirTabela();
Pessoa* buscarPessoaTabela(int mat);
void imprimirTabela();

#endif // TABELA_HASH_H_INCLUDED

extends Node

var tenis = 1 #variavel que assume valor 1 e 2 e é utilizada para habilitar os habilidades adquiridas com o tenis
var vilao_morre = false #variavel booleana que indica se o vilão esta morto
var posicao_vilao = Vector2() #variavel com componentes (X,Y) que assumira o valor da posição do vilão
var dano = false #variavel booleana que armazena a informação de que o personagem está no processo de perder vida 
var ataque_do_vilao = false #variavel booleana que indica que o vilão esta batendo horizontalmente    #INUTIL!!!!!!
var vilao_sem_tenis_morre = false
var ataque_do_vilao_sem_tenis = false
var vida = 6# Variável que armaneza o número de vidas do jogador (inicia com 6)
var arma = false
var matou = false #??????????
var posicao_cigarro = Vector2()
var fase = 1
var posicao_do_jogador = Vector2()
var vida_do_cigarro = 200
var ta_valendo = false
var contagem_dano_cigarro = 0
var contagem_dano_esmoque = 0
var tunel_nicotina = false
var tunel_antes_boss_fight = false
var atirando = false
#variáveis usadas no diálogo
var entrou_jogo = false
var matou_cigarro = false
var antes_pegar_arma = false
var entra_boss_fight = false
var antes_nicotina = false
#var arma tambem e usada, mas esta definida logo acima
#var tenis tambem e usada, mas esta definida logo acima

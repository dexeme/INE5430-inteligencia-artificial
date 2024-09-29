;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sistema Especialista para Identificação de Pragas em Jardins e Pomares
;; Implementado em CLIPS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftemplate praga
   (slot nome)
   (slot aparencia)
   (slot aspecto_folhas)
   (slot cor_folhas)
   (slot flores)
   (slot caule)
   (slot tratamento)
   (slot tipo_tratamento))

(deffacts pragas
   ;; Pragas de Animais
   (praga
      (nome pulgao)
      (aparencia inseto_preto_ou_verde_esbranquicado)
      (aspecto_folhas enroladas)
      (cor_folhas amareladas)
      (flores nenhum)
      (caule nenhum)
      (tratamento mistura_agua_detergente_neutro)
      (tipo_tratamento organico))

   (praga
      (nome acaro_do_bronzeamento)
      (aparencia pequenos_aracnideos)
      (aspecto_folhas murchas)
      (cor_folhas marrons)
      (flores nenhum)
      (caule nenhum)
      (tratamento biopesticida_oximatrine)
      (tipo_tratamento quimico))

   (praga
      (nome lagarta)
      (aparencia corpo_cilindrico_verde)
      (aspecto_folhas picotadas)
      (cor_folhas nenhum)
      (flores nenhum)
      (caule nenhum)
      (tratamento mistura_cebola_alho_agua)
      (tipo_tratamento organico))

   (praga
      (nome caracol)
      (aparencia moluscos_com_casco)
      (aspecto_folhas esburacadas_com_limo)
      (cor_folhas nenhum)
      (flores nenhum)
      (caule nenhum)
      (tratamento bicarbonato_sodio_solo)
      (tipo_tratamento organico))

   (praga
      (nome besouro)
      (aparencia insetos_de_casco_escuro)
      (aspecto_folhas pequenos_furos)
      (cor_folhas nenhum)
      (flores nenhum)
      (caule nenhum)
      (tratamento solucao_agua_ervas_aromaticas)
      (tipo_tratamento organico))

   ;; Pragas de Fungos
   (praga
      (nome ferrugem_do_buxo)
      (aparencia nenhum)
      (aspecto_folhas nenhum)
      (cor_folhas circulos_alaranjados)
      (flores nenhum)
      (caule nenhum)
      (tratamento oleo_de_neem)
      (tipo_tratamento organico))

   (praga
      (nome mofo)
      (aparencia nenhum)
      (aspecto_folhas nenhum)
      (cor_folhas nenhum)
      (flores murchas_e_marrons)
      (caule nenhum)
      (tratamento extratos_aquosos_gengibre)
      (tipo_tratamento organico))

   (praga
      (nome oidio)
      (aparencia nenhum)
      (aspecto_folhas nenhum)
      (cor_folhas manchas_esbranquicadas)
      (flores nenhum)
      (caule nenhum)
      (tratamento mistura_bicarbonato_sodio_agua)
      (tipo_tratamento organico))

   (praga
      (nome mancha_negra)
      (aparencia nenhum)
      (aspecto_folhas nenhum)
      (cor_folhas manchas_negras_arredondadas)
      (flores nenhum)
      (caule nenhum)
      (tratamento poda_ramos_contaminados)
      (tipo_tratamento cultural))

   ;; Pragas de Bactérias
   (praga
      (nome murcha_bacteriana)
      (aparencia nenhum)
      (aspecto_folhas nenhum)
      (cor_folhas nenhum)
      (flores nenhum)
      (caule podre_e_mole)
      (tratamento poda_ramos_contaminados)
      (tipo_tratamento cultural))

   (praga
      (nome fogo_bacteriano)
      (aparencia nenhum)
      (aspecto_folhas queimadas)
      (cor_folhas marrons)
      (flores nenhum)
      (caule queimado)
      (tratamento biopesticida_fago)
      (tipo_tratamento quimico))
)

(deftemplate sintoma
   (slot aspecto_folhas)
   (slot cor_folhas)
   (slot flores)
   (slot caule))

(deffacts sintomas
   ;; Fatos de sintomas podem ser inseridos aqui com base no caso atual
)

(defrule diagnosticar-praga
   ?praga <- (praga
               (aspecto_folhas ?aspecto_folhas_praga)
               (cor_folhas ?cor_folhas_praga)
               (flores ?flores_praga)
               (caule ?caule_praga))
   ?sintoma <- (sintoma
               (aspecto_folhas ?aspecto_folhas)
               (cor_folhas ?cor_folhas)
               (flores ?flores)
               (caule ?caule))
   (test (and 
           (or (eq ?aspecto_folhas_praga ?aspecto_folhas) (eq ?aspecto_folhas_praga nenhum))
           (or (eq ?cor_folhas_praga ?cor_folhas) (eq ?cor_folhas_praga nenhum))
           (or (eq ?flores_praga ?flores) (eq ?flores_praga nenhum))
           (or (eq ?caule_praga ?caule) (eq ?caule_praga nenhum))))
   =>
   (printout t "Praga identificada: " ?praga:nome crlf)
   (printout t "Tratamento recomendado: " ?praga:tratamento " (" ?praga:tipo_tratamento ")" crlf)
)

;; Inserir fatos de sintomas para testar o sistema
(defrule insere-caso-exemplo-1
   =>
   (assert (sintoma
               (aspecto_folhas enroladas)
               (cor_folhas amareladas)
               (flores nenhum)
               (caule nenhum)))
   (printout t "Caso exemplo 1 inserido: Folhas enroladas e amareladas." crlf))

;; Outros casos de exemplo podem ser definidos aqui
(defrule insere-caso-exemplo-2
   =>
   (assert (sintoma
               (aspecto_folhas queimadas)
               (cor_folhas marrons)
               (flores nenhum)
               (caule queimado)))
   (printout t "Caso exemplo 2 inserido: Folhas queimadas e marrons, caule queimado." crlf))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Uso do sistema
;; Execute o comando (run) após a inserção dos sintomas para realizar o diagnóstico.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

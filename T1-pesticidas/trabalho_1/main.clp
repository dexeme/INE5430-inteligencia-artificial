;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sistema Especialista para Identificação de Pragas em Jardins e Pomares
;; Adaptado para perguntas interativas e sugestões baseadas nos sintomas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Definição do template 'Sintoma'
(deftemplate Sintoma
   (slot aspecto_folhas)
   (slot cor_folhas)
   (slot flores)
   (slot caule))

;; Definição do template 'Praga'
(deftemplate Praga
   (slot nome)
   (slot tratamento)
   (slot tipo_tratamento))

;; Regra para obter o aspecto das folhas
(defrule GetAspectoFolhas
   (declare (salience 9))
   =>
   (printout t "Como estão as folhas? (enroladas/murchas/picotadas/esburacadas/nenhum)" crlf)
   (bind ?resposta (read))
   (assert (Sintoma (aspecto_folhas ?resposta))))

;; Regra para obter a cor das folhas
(defrule GetCorFolhas
   (declare (salience 9))
   =>
   (printout t "Qual a cor das folhas? (amareladas/marrons/manchas_esbranquicadas/nenhum)" crlf)
   (bind ?resposta (read))
   (assert (Sintoma (cor_folhas ?resposta))))

;; Regra para obter o estado das flores
(defrule GetFlores
   (declare (salience 9))
   =>
   (printout t "Como estão as flores? (murchas/marrons/nenhum)" crlf)
   (bind ?resposta (read))
   (assert (Sintoma (flores ?resposta))))

;; Regra para obter o estado do caule
(defrule GetCaule
   (declare (salience 9))
   =>
   (printout t "Como está o caule? (podre_e_mole/queimado/nenhum)" crlf)
   (bind ?resposta (read))
   (assert (Sintoma (caule ?resposta))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Regras para identificar a praga baseada nos sintomas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Regra para diagnosticar pulgão
(defrule DiagnosticarPulgao
   (and (Sintoma (aspecto_folhas enroladas))
        (Sintoma (cor_folhas amareladas))
        (Sintoma (flores nenhum))
        (Sintoma (caule nenhum)))
   =>
   (assert (Praga (nome pulgao) (tratamento mistura_agua_detergente_neutro) (tipo_tratamento organico)))
   (printout t "Praga Identificada: Pulgão" crlf)
   (printout t "Tratamento recomendado: Mistura de água com detergente neutro (Orgânico)" crlf))

;; Regra para diagnosticar ácaro do bronzeamento
(defrule DiagnosticarAcaroBronzeamento
   (and (Sintoma (aspecto_folhas murchas))
        (Sintoma (cor_folhas marrons))
        (Sintoma (flores nenhum))
        (Sintoma (caule nenhum)))
   =>
   (assert (Praga (nome acaro_do_bronzeamento) (tratamento biopesticida_oximatrine) (tipo_tratamento quimico)))
   (printout t "Praga Identificada: Ácaro do Bronzeamento" crlf)
   (printout t "Tratamento recomendado: Biopesticida Oximatrine (Químico)" crlf))

;; Regra para diagnosticar lagarta
(defrule DiagnosticarLagarta
   (and (Sintoma (aspecto_folhas picotadas))
        (Sintoma (cor_folhas nenhum))
        (Sintoma (flores nenhum))
        (Sintoma (caule nenhum)))
   =>
   (assert (Praga (nome lagarta) (tratamento mistura_cebola_alho_agua) (tipo_tratamento organico)))
   (printout t "Praga Identificada: Lagarta" crlf)
   (printout t "Tratamento recomendado: Mistura de cebola, alho e água (Orgânico)" crlf))

;; Regra para diagnosticar ferrugem do buxo
(defrule DiagnosticarFerrugemBuxo
   (and (Sintoma (cor_folhas circulos_alaranjados))
        (Sintoma (flores nenhum))
        (Sintoma (caule nenhum)))
   =>
   (assert (Praga (nome ferrugem_do_buxo) (tratamento oleo_de_neem) (tipo_tratamento organico)))
   (printout t "Praga Identificada: Ferrugem do Buxo" crlf)
   (printout t "Tratamento recomendado: Óleo de Neem (Orgânico)" crlf))

;; Regra para diagnosticar mofo
(defrule DiagnosticarMofo
   (and (Sintoma (flores murchas_e_marrons))
        (Sintoma (cor_folhas nenhum)))
   =>
   (assert (Praga (nome mofo) (tratamento extratos_aquosos_gengibre) (tipo_tratamento organico)))
   (printout t "Praga Identificada: Mofo" crlf)
   (printout t "Tratamento recomendado: Extratos aquosos de gengibre (Orgânico)" crlf))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sugestão de tratamento e endereço de compra de produtos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Regra para endereços de tratamento
(defrule EnderecoTratamentoPulgao
   (Praga (nome pulgao))
   =>
   (printout t "Local de compra de produtos: Rua das Plantas, 123" crlf))

(defrule EnderecoTratamentoAcaro
   (Praga (nome acaro_do_bronzeamento))
   =>
   (printout t "Local de compra de produtos: Av. dos Biopesticidas, 456" crlf))

(defrule EnderecoTratamentoLagarta
   (Praga (nome lagarta))
   =>
   (printout t "Local de compra de produtos: Rua do Orgânico, 789" crlf))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Título do sistema
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule titulo
   (declare (salience 10))
   =>
   (printout t crlf crlf)
   (printout t "Sistema Especialista - Identificação de Pragas" crlf crlf))


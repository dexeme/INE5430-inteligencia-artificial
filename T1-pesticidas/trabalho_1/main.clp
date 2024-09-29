; Sistema Especialista - Gestão de Pragas em Jardins e Pomares

(deftemplate Praga
    (slot nome)
    (slot tipo)
    (slot tratamento))

(deftemplate Planta
    (slot aparencia)
    (slot aspecto_folhas)
    (slot cor_folhas)
    (slot flores)
    (slot caule))

(deftemplate Tratamento
    (slot tipo)
    (slot metodo))

(defrule titulo
  (declare (salience 100))
  =>
  (printout t "========================================================" crlf)
  (printout t "     Sistema Especialista - Gestão de Pragas" crlf)
  (printout t "========================================================" crlf)
  (printout t "Este sistema ajuda a identificar pragas em plantas com base" crlf)
  (printout t "nos sintomas fornecidos pelo usuário. O sistema irá fazer" crlf)
  (printout t "perguntas sobre os sintomas observados, e você deverá" crlf)
  (printout t "responder com 'S' (sim) ou 'N' (não)." crlf)
  (printout t "========================================================" crlf crlf))

; Função auxiliar para validar a entrada do usuário (permite S/s e N/n)
(deffunction valida-entrada (?pergunta)
   (printout t ?pergunta " (S/N)" crlf)
   (printout t ">>> ")
   (bind ?resposta (read))
   (while (not (or (eq ?resposta S) (eq ?resposta s) (eq ?resposta N) (eq ?resposta n))) do
      (printout t "Entrada inválida. Responda apenas com S (sim) ou N (não)." crlf)
      (printout t ?pergunta " (S/N)" crlf)
      (printout t ">>> ")
      (bind ?resposta (read)))
   (return ?resposta))

; Regras para coletar informações sobre a planta afetada com perguntas de S/N

(defrule GetAparenciaPulgao
  (declare (salience 90))
  =>
  (bind ?resposta (valida-entrada "O organismo parece um inseto preto ou verde esbranquiçado?"))
  (if (or (eq ?resposta S) (eq ?resposta s)) then
    (assert (Planta (aparencia inseto_preto_ou_verde_esbranquicado)))))

(defrule GetAparenciaAcaro
  (declare (salience 80))
  =>
  (bind ?resposta (valida-entrada "O organismo parece pequenos aracnídeos?"))
  (if (or (eq ?resposta S) (eq ?resposta s)) then
    (assert (Planta (aparencia pequenos_aracnideos)))))

(defrule GetAparenciaLagarta
  (declare (salience 80))
  =>
  (bind ?resposta (valida-entrada "O organismo parece um corpo cilíndrico verde?"))
  (if (or (eq ?resposta S) (eq ?resposta s)) then
    (assert (Planta (aparencia corpo_cilindrico_verde)))))

(defrule GetAparenciaCaracol
  (declare (salience 80))
  =>
  (bind ?resposta (valida-entrada "Você encontrou moluscos com casco?"))
  (if (or (eq ?resposta S) (eq ?resposta s)) then
    (assert (Planta (aparencia moluscos_com_casco)))))

(defrule GetAparenciaBesouro
  (declare (salience 80))
  =>
  (bind ?resposta (valida-entrada "O organismo parece insetos de casco escuro?"))
  (if (or (eq ?resposta S) (eq ?resposta s)) then
    (assert (Planta (aparencia insetos_de_casco_escuro)))))

(defrule GetAspectoFolhasEnroladas
  (declare (salience 70))
  =>
  (bind ?resposta (valida-entrada "As folhas estão enroladas?"))
  (if (or (eq ?resposta S) (eq ?resposta s)) then
    (assert (Planta (aspecto_folhas enroladas)))))

(defrule GetAspectoFolhasMurchas
  (declare (salience 70))
  =>
  (bind ?resposta (valida-entrada "As folhas estão murchas?"))
  (if (or (eq ?resposta S) (eq ?resposta s)) then
    (assert (Planta (aspecto_folhas murchas)))))

(defrule GetCorFolhasAmareladas
  (declare (salience 60))
  =>
  (bind ?resposta (valida-entrada "As folhas estão amareladas?"))
  (if (or (eq ?resposta S) (eq ?resposta s)) then
    (assert (Planta (cor_folhas amareladas)))))

(defrule GetCorFolhasMarrons
  (declare (salience 60))
  =>
  (bind ?resposta (valida-entrada "As folhas estão marrons?"))
  (if (or (eq ?resposta S) (eq ?resposta s)) then
    (assert (Planta (cor_folhas marrons)))))

(defrule GetCaule
  (declare (salience 50))
  =>
  (bind ?resposta (valida-entrada "O caule está podre ou mole?"))
  (if (or (eq ?resposta S) (eq ?resposta s)) then
    (assert (Planta (caule podre_e_mole)))))

; Regras para identificar a praga com base nas características observadas

(defrule IdentificarPulgao
  (Planta (aparencia inseto_preto_ou_verde_esbranquicado))
  (Planta (aspecto_folhas enroladas))
  (Planta (cor_folhas amareladas))
  =>
  (assert (Praga (nome pulgao) (tipo animal)))
  (printout t "Praga Identificada: Pulgão" crlf))

(defrule IdentificarAcaro
  (Planta (aparencia pequenos_aracnideos))
  (Planta (aspecto_folhas murchas))
  (Planta (cor_folhas marrons))
  =>
  (assert (Praga (nome acaro_do_bronzeamento) (tipo animal)))
  (printout t "Praga Identificada: Ácaro do Bronzeamento" crlf))

(defrule IdentificarLagarta
  (Planta (aparencia corpo_cilindrico_verde))
  (Planta (aspecto_folhas picotadas))
  =>
  (assert (Praga (nome lagarta) (tipo animal)))
  (printout t "Praga Identificada: Lagarta" crlf))

(defrule IdentificarCaracol
  (Planta (aparencia moluscos_com_casco))
  (Planta (aspecto_folhas esburacadas_com_limo))
  =>
  (assert (Praga (nome caracol) (tipo animal)))
  (printout t "Praga Identificada: Caracol" crlf))

(defrule IdentificarBesouro
  (Planta (aparencia insetos_de_casco_escuro))
  (Planta (aspecto_folhas pequenos_furos))
  =>
  (assert (Praga (nome besouro) (tipo animal)))
  (printout t "Praga Identificada: Besouro" crlf))

; Regras para sugerir tratamento com base na praga identificada

(defrule TratarPulgao
  (Praga (nome pulgao))
  =>
  (assert (Tratamento (tipo organico) (metodo mistura_agua_detergente_neutro)))
  (printout t "Tratamento sugerido: Mistura de água e detergente neutro." crlf))

(defrule TratarAcaro
  (Praga (nome acaro_do_bronzeamento))
  =>
  (assert (Tratamento (tipo quimico) (metodo biopesticida_oximatrine)))
  (printout t "Tratamento sugerido: Biopesticida com oximatrine." crlf))

(defrule TratarLagarta
  (Praga (nome lagarta))
  =>
  (assert (Tratamento (tipo organico) (metodo mistura_cebola_alho_agua)))
  (printout t "Tratamento sugerido: Mistura caseira de cebola, alho e água." crlf))

(defrule TratarCaracol
  (Praga (nome caracol))
  =>
  (assert (Tratamento (tipo organico) (metodo bicarbonato_sodio_solo)))
  (printout t "Tratamento sugerido: Bicarbonato de sódio no solo." crlf))

(defrule TratarBesouro
  (Praga (nome besouro))
  =>
  (assert (Tratamento (tipo organico) (metodo solucao_agua_ervas_aromaticas)))
  (printout t "Tratamento sugerido: Solução de água e ervas aromáticas." crlf))

; Caso nenhum diagnóstico seja feito, oferece a opção de tentar novamente

(defrule NenhumaPragaIdentificada
  (not (Praga (nome ?)))
  =>
  (printout t "Nenhuma praga foi identificada com base nas características fornecidas." crlf)
  (bind ?resposta (valida-entrada "Deseja tentar novamente?"))
  (if (or (eq ?resposta S) (eq ?resposta s)) then
    (reset) ;; Reinicia o sistema
    (run)   ;; Executa novamente
  else
    (printout t "Fim do programa." crlf)))

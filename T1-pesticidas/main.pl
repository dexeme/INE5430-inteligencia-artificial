praga(pulgao).
praga(acaro_do_bronzeamento).
praga(lagarta).
praga(caracol).
praga(besouro).
praga(ferrugem_do_buxo).
praga(mofo).
praga(oidio).
praga(marcha_negra).
praga(murcha_bacteriana).
praga(fogo_bacteriano).

caracteristica(pulgao, inseto_preto_ou_verde_esbranquiçado).
caracteristica(pulgao, folhas_enroladas).
caracteristica(pulgao, folhas_amareladas).
caracteristica(acaro_do_bronzeamento, pequenos_aracnideos).
caracteristica(acaro_do_bronzeamento, folhas_murchas).
caracteristica(acaro_do_bronzeamento, folhas_marrons).
caracteristica(lagarta, corpo_cilindrico_verde).
caracteristica(lagarta, folhas_picotadas).
caracteristica(caracol, moluscos_com_casco).
caracteristica(caracol, folhas_esburacadas_com_limo).
caracteristica(besouro, insetos_de_casco_escuro).
caracteristica(besouro, pequenos_furos_nas_folhas).
caracteristica(ferrugem_do_buxo, circulos_alaranjados_nas_folhas).
caracteristica(mofo, folhas_murchas).
caracteristica(mofo, folhas_marrons).
caracteristica(oidio, manchas_esbranquiçadas_nas_folhas).
caracteristica(marcha_negra, manchas_negras_arredondadas_nas_folhas).
caracteristica(murcha_bacteriana, caule_podre_e_mole).
caracteristica(fogo_bacteriano, folhas_queimadas).
caracteristica(fogo_bacteriano, folhas_marrons).

% Tratamentos orgânicos
tratamento(pulgao, organico, mistura_agua_detergente_neutro).
tratamento(lagarta, organico, mistura_cebola_alho_agua).
tratamento(caracol, organico, bicarbonato_sodio_solo).
tratamento(besouro, organico, solucao_agua_ervas_aromaticas).
tratamento(ferrugem_do_buxo, organico, oleo_neem).
tratamento(mofo, organico, extratos_aquosos_gengibre).
tratamento(oidio, organico, mistura_bicarbonato_sodio_agua).

% Tratamentos químicos
tratamento(acaro_do_bronzeamento, quimico, biopesticida_oximatrine).
tratamento(fogo_bacteriano, quimico, biopesticida_fago).

% Tratamentos culturais
tratamento(mancha_negra, cultural, poda_ramos_contaminados).
tratamento(murcha_bacteriana, cultural, poda_ramos_contaminados).


identificar_praga(inseto_preto_ou_verde_esbranquiçado, pulgao).
identificar_praga(folhas_enroladas, pulgao).
identificar_praga(pequenos_aracnideos, acaro_do_bronzeamento).
identificar_praga(corpo_cilindrico_verde, lagarta).
identificar_praga(moluscos_com_casco, caracol).
identificar_praga(insetos_de_casco_escuro, besouro).
identificar_praga(circulos_alaranjados_nas_folhas, ferrugem_do_buxo).
identificar_praga(manchas_esbranquiçadas_nas_folhas, oidio).
identificar_praga(manchas_negras_arredondadas_nas_folhas, marcha_negra).
identificar_praga(caule_podre_e_mole, murcha_bacteriana).
identificar_praga(folhas_queimadas, fogo_bacteriano).

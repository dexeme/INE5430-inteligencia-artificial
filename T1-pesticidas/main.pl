praga(pulgao).
praga(cochonilha).
praga(mosca_branca).
praga(lagarta).
praga(caracol).
praga(lesma).
praga(formiga_cortadeira).
praga(bacteria).
praga(fungo).

caracteristica(pulgao, suga_seiva).
caracteristica(pulgao, cor_verde).
caracteristica(pulgao, secrecao_acucarada).
caracteristica(cochonilha, cor_branca_ou_marrom).
caracteristica(cochonilha, secrecao_acucarada).
caracteristica(mosca_branca, cor_branca).
caracteristica(mosca_branca, suga_seiva).
caracteristica(lagarta, come_folhas).
caracteristica(lagarta, deixa_folhas_picotadas).
caracteristica(caracol, habito_noturno).
caracteristica(lesma, habito_noturno).
caracteristica(formiga_cortadeira, corta_folhas).
caracteristica(bacteria, murchidao_vascular).
caracteristica(bacteria, necrose).
caracteristica(fungo, fumagina).

tratamento(pulgao, solucao_cebola_agua_alho).
tratamento(cochonilha, solucao_cebola_agua_alho).
tratamento(mosca_branca, mistura_detergente_oleo).
tratamento(lagarta, pesticida).
tratamento(caracol, pesticida).
tratamento(lesma, pesticida).
tratamento(formiga_cortadeira, pesticida).
tratamento(bacteria, bactericida).
tratamento(fungo, fungicida).

identificar_praga(suga_seiva, pulgao).
identificar_praga(secrecao_acucarada, cochonilha).
identificar_praga(cor_branca, mosca_branca).
identificar_praga(come_folhas, lagarta).
identificar_praga(habito_noturno, caracol).
identificar_praga(murchidao_vascular, bacteria).
identificar_praga(fumagina, fungo).
# coding: utf-8
BARCODES = {

    itaú_vencido: {
         barcode: '34199310130010011560900500990007800000000000000'
    },
    concessionária_vencido: {
         barcode: '846200000004162802962017701040030002002705666887'
    },

    boleto_bb: {
        barcode: '00190000090127485500400005310172100000000034038',
        barcode_formated: '00190.00009 01274.855004 00005.310172 1 00000000034038',
        bank_name: '001-BANCO DO BRASIL SA',
        document_value: '340,38',
        discounted_value: '0,00',
        maturity_date: '24/10/2016'
    },
    erro_no_primeiro_bloco: {
        barcode: '816000000008132400971413720832060712613206140923'
    },
    erro_no_segundo_bloco: {
        barcode: '826000000008102400971413720832060712613206140923'
    },
    erro_no_terceiro_bloco: {
        barcode: '826000000008132400971413721832060712613206140923'
    },
    erro_no_quarto_bloco: {
        barcode: '826000000008132400971413720832060712613206140922'
    },
    erro_serico_indisponivel: {
        barcode: '03399492813691896828488094809063500000000000000'
    },
    erro_boleto_ja_pago: {
        barcode: '00190123431234512345412345123454566470000000150'
    },
    erro_boleto_ja_agendado: {
        barcode: '00190000090000010000800004545182167860000000001'
    },
    erro_titulo_vencido: {
        barcode: '39994072513700000001031112315226155130000021013'
    },
    erro_boleto_itau_fora_do_horario_pagamento: {
        barcode: '34191750090010273847300016220006763890000129500',
        notification: 'horário pagamento itaú',
        barcode_formated: '34191.75009 00102.738473 00016.220006 7 63890000129500',
        bank_name: '341-BANCO ITAU S.A.',
        document_value: '1.295,00',
        discounted_value: '0,00',
        maturity_date: '30/11/2016'
    },
    erro_boleto_outros_bancos_fora_do_horario_pagamento: {
        barcode: '39991731274276800206750990160017169280000017022',
        notification: 'horário pagamento outros bancos',
        barcode_formated: '39991.73127 42768.002067 50990.160017 1 69280000017022',
        bank_name: '399-HSBC BANK BRASIL S.A. - B',
        document_value: '170,22',
        discounted_value: '0,00',
        maturity_date: '25/09/2016'
    },
    sabesp: {
        barcode: '826000000008132400971413720832060712613206140923',
        recipient: 'SABESP',
        barcode_formated: '826000000008 132400971413 720832060712 613206140923',
        document_value: '13,24',
        discounted_value: '0,00',
        interest_value: '0,00',
        total_value: '13,24',
        maturity_date: '20/12/2016',
        pay_date: '20/12/2016',
        autentication: 'B757A8FF7E044C4B7FF76E1700197D3E86A19E4E'
    },
    comgas: {
        barcode: '836200000013463500577481000307862003002429600709',
        recipient: 'COMGAS',
        barcode_formated: '836200000013 463500577481 000307862003 002429600709',
        document_value: '146,35',
        discounted_value: '0,00',
        interest_value: '0,00',
        total_value: '146,35',
        maturity_date: '20/12/2016',
        pay_date: '20/12/2016',
        autentication: '8066B51BD66DA9DE2867D8005338CB57FDF10C50'
    },
    eletropaulo: {
        barcode: '836800000009718400481005146944969717000114134729',
        recipient: 'ELETROPAULO',
        barcode_formated: '836800000009 718400481005 146944969717 000114134729',
        document_value: '71,84',
        discounted_value: '0,00',
        interest_value: '0,00',
        total_value: '71,84',
        maturity_date: '20/12/2016',
        pay_date: '20/12/2016',
        autentication: '8066B51BD66DA9DE2867D8005338CB57FDF10C50'
    },
    eletropaulo_em_atraso: {
        barcode: '',
        recipient: 'ELETROPAULO',
        barcode_formated: '',
        document_value: '',
        discounted_value: '0,00',
        interest_value: '0,00',
        total_value: '',
        maturity_date: '',
        pay_date: '',
        autentication: ''
    },
    itau_valor_fechado_juros_fechados_desconto_inexistente_data_aberta_valor_visivel: {
        barcode: '34199310130010011560900500990007800000000000000',
        barcode_formated: '34199.31013 00100.115609 00500.990007 8 00000000000000',
        bank_name: '341-BANCO ITAU S.A.',
        document_value: '230,00',
        discounted_value: '0,00',
        interest_value: '40,00',
        total_value: '270,00',
        maturity_date: '20/12/2016',
        pay_date: '20/12/2016',
        autentication: '8066B51BD66DA9DE2867D8005338CB57FDF10C50'
    },
    itau_valor_fechado_juros_inexistente_desconto_editavel_zerado_data_fechada_em_valor_visivel: {
        barcode: '34191090082000097087901104670003665050000080000',
        barcode_formated: '34191.09008 20000.970879 01104.670003 6 65050000080000',
        bank_name: '341-BANCO ITAU S.A.',
        document_value: '800,00',
        discounted_value: '0,00',
        discounted_value_inserted: '50,00',
        interest_value: '0,00',
        total_value: '750,00',
        maturity_date: '31/08/2016',
        pay_date: '20/11/2016',
        autentication: '3D423248B612E885DF7169E3D795451E26EE549B'
    },
    itau_valor_fechado_juros_inexistente_desconto_inexistente_data_fechada_sem_valor_visivel: {
        barcode: '34191121848636669005403569220001465340000004664',
        barcode_formated: '34191.12184 86366.690054 03569.220001 4 65340000004664',
        bank_name: '341-BANCO ITAU S.A.',
        document_value: '46,64',
        discounted_value: '0,00',
        interest_value: '0,00',
        total_value: '46,64',
        maturity_date: '28/08/2016',
        pay_date: '20/12/2016',
        autentication: '466063C436791D10DFA7DD470A6AB1CDBE755942'
    },
    itau_valor_fechado_juros_inexistente_desconto_fechado_data_aberta_valor_visivel: {
        barcode: '34192214070201039150200508750007100000000000000',
        barcode_formated: '34192.21407 02010.391502 00508.750007 1 00000000000000',
        bank_name: '341-BANCO ITAU S.A.',
        document_value: '570,00',
        discounted_value: '495,00',
        interest_value: '0,00',
        total_value: '75,00',
        maturity_date: '28/12/2016',
        pay_date: '27/11/2016',
        autentication: '734B27CE80217A5934E89CBFAFF972DBEDBA2712'
    },
    itau_valor_fechado_juros_editavel_desconto_inexistente_data_fechada_sem_valor_visivel: {
        barcode: '34191750090000421150400520610007965250000003200',
        barcode_formated: '34191.75009 00004.211504 00520.610007 9 65250000003200',
        bank_name: '341-BANCO ITAU S.A.',
        document_value: '32,00',
        discounted_value: '0,00',
        interest_value: '0,00',
        interest_value_inserted: '1,00',
        total_value: '33,00',
        maturity_date: '19/08/2016',
        pay_date: '27/11/2016',
        autentication: 'E6BFF6498C5B28BF00C1ADA09919338BC7554202'
    },
    itau_valor_fechado_juros_inexistente_desconto_fechado_data_fechada_valor_visivel: {
        barcode: '34191155003001050150700502890007264280000198000',
        barcode_formated: '34191.15500 30010.501507 00502.890007 2 64280000198000',
        bank_name: '341-BANCO ITAU S.A.',
        document_value: '1.980,00',
        discounted_value: '990,00',
        interest_value: '0,00',
        total_value: '990,00',
        maturity_date: '07/10/2016',
        pay_date: '02/11/2016',
        autentication: '09351ED624F5A8B0429E382369F69CB6CF2DAFA0'
    },
    itau_valor_editavel_juros_fechado_desconto_inexistente_data_aberta_sem_valor_visivel: {
        barcode: '34191094040000012150900504040007800000000000000',
        barcode_formated: '34191.09404 00000.121509 00504.040007 8 00000000000000',
        bank_name: '341-BANCO ITAU S.A.',
        document_value: '0,00',
        document_value_inserted: '10,00',
        discounted_value: '0,00',
        interest_value: '0,00',
        total_value: '10,00',
        maturity_date: '20/12/2016',
        pay_date: '20/12/2016',
        autentication: '466063C436791D10DFA7DD470A6AB1CDBE755942'
    },
    bb_valor_editavel_juros_inexistente_desconto_editavel_data_aberta_valor_nao_visivel: {
        barcode: '34191094040000012150900504040007800000000000000',
        barcode_formated: '34191.09404 00000.121509 00504.040007 8 00000000000000',
        bank_name: '341-BANCO ITAU S.A.',
        document_value: '0,00',
        document_value_inserted: '10,00',
        discounted_value: '0,00',
        interest_value: '0,00',
        total_value: '10,00',
        maturity_date: '20/12/2016',
        pay_date: '20/12/2016',
        autentication: '466063C436791D10DFA7DD470A6AB1CDBE755942'
    },

    com_mais_de_um_titular: {
        agency: '1500',
        account: '052111',
        password: '12300001',
        card_password: '111111'
    },

    de_DDA: {
       title_value: 'R$ 200,00',
       pagador:'001.042.163-79 - Americo Moreno Casta'
    },

}

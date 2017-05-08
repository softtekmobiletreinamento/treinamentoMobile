# coding: utf-8
CREDENTIALS = {
    com_um_único_titular: {
        agency: '1500',
        account: '052012',
        password: '12300001',
        invalid_password: '123456',
        block_password: '123456',
        card_password: '111111',
        account_balance: '2.000.000.000,00'
    },
    com_mais_de_um_titular: {
        agency: '1500',
        account: '052111',
        password: '12300001',
        card_password: '111111'
    },
    válida: {
        agency: '3977',
        account: '052012',
        password: '12300001',
        card_password: '111111'
    },
    de_agência_ou_inválida: {
        agency: '1500',
        account: '052138',
        password: '',
        card_password: '111111'
    },
    de_acesso_rápido_0: {
        agency: '1500',
        account: '024532',
        password: '12300001',
        card_password: '111111'
    },
    de_acesso_rápido_1: {
        agency: '3977',
        account: '052012',
        password: '12300001',
        card_password: '111111'
    },
    de_acesso_rápido_2: {
        agency: '1500',
        account: '052509',
        password: '12300001',
        card_password: '111111'
    },
    de_acesso_rápido_3: {
        agency: '3977',
        account: '052013',
        password: '12300001',
        card_password: '111111'
    },
    de_acesso_rápido_4: {
        agency: '1500',
        account: '025533',
        password: '12300001',
        card_password: '111111'
    },
    de_senha_errada_uma_vez: {
        agency: '1500',
        account: '025534',
        password: '222222'
    },
    de_senha_errada_duas_vezes: {
        agency: '1500',
        account: '025534',
        password: '000000'
    },
    de_senha_errada_três_vezes: {
        agency: '1500',
        account: '025534',
        password: '111111'
    },
    de_senha_bloqueada: {
        agency: '1500',
        account: '025534',
        password: '111111'
    },
    varejo_senha_bloqueada_por_fraude: {
        agency: '1500',
        account: '010820',
        password: '12300001',
        card_password: '111111'
    },
    uniclass_senha_bloqueada_por_fraude: {
        agency: '1500',
        account: '025026',
        password: '12300001',
        card_password: '111111'
    },
    private_senha_bloqueada_por_fraude: {
        agency: '1500',
        account: '021058',
        password: '12300001',
        card_password: '111111'
    },
    personnalite_senha_bloqueada_por_fraude: {
        agency: '3977',
        account: '062227',
        password: '12300001',
        card_password: '111111'
    },

    varejo_senha_errada_cliente: {
        agency: '1500',
        account: '010838',
        password: '12300001',
        card_password: '111111',
        block_password: '123456'
    },
    uniclass_senha_errada_cliente: {
        agency: '1500',
        account: '024987',
        password: '12300001',
        card_password: '111111',
        block_password: '123456'
    },
    private_senha_errada_cliente: {
        agency: '1500',
        account: '022080',
        password: '12300001',
        card_password: '147258',
        block_password: '123456'
    },
    personnalite_senha_errada_cliente: {
        agency: '3977',
        account: '013089',
        password: '12300001',
        card_password: '111111',
        block_password: '123456'
    },

    varejo_sem_lis: {
        agency: '1500',
        account: '052293',
        password: '12300001',
        card_password: '111111',
        block_password: '123456'
    },
    uniclass_sem_lis: {
        agency: '1500',
        account: '024250',
        password: '12300001',
        card_password: '111111',
        block_password: '123456'
    },
    private_sem_lis: {
        agency: '1500',
        account: '102502',
        password: '12300001',
        card_password: '111111',
        block_password: '123456'
    },
    personnalite_sem_cep: {
        agency: '3977',
        account: '062268',
        password: '12300001',
        card_password: '111111',
        block_password: '123456'
    },

    varejo_acima_do_lis: {
        agency: '1500',
        account: '062706',
        password: '12300000',
        card_password: '111111',
        block_password: '123456'
    },
    uniclass_acima_do_lis: {
        agency: '1500',
        account: '023989',
        password: '12300001',
        card_password: '111111',
        block_password: '123456'
    },
    private_acima_do_lis: {
        agency: '1500',
        account: '352503',
        password: '12300001',
        card_password: '111111',
        block_password: '123456'
    },
    personnalite_acima_do_cep: {
        agency: '3977',
        account: '062557',
        password: '12300001',
        card_password: '111111',
        block_password: '123456'
    },

    varejo_acima_do_lis_adicional: {
        agency: '1500',
        account: '062706',
        password: '12300000',
        card_password: '111111',
        block_password: '123456'
    },
    uniclass_acima_do_lis_adicional: {
        agency: '1500',
        account: '023989',
        password: '12300001',
        card_password: '111111',
        block_password: '123456'
    },
    private_acima_do_lis_adicional: {
        agency: '1500',
        account: '352503',
        password: '12300001',
        card_password: '111111',
        block_password: '123456'
    },
    personnalite_acima_do_cep_adicional: {
        agency: '3977',
        account: '062557',
        password: '12300001',
        card_password: '111111',
        block_password: '123456'
    },

    de_senha_eletrônica_não_cadastrada: {
        agency: '1500',
        account: '013915',
        password: '12300001'
    },
    logada_em_outro_canal: {
        agency: '1500',
        account: '010044',
        password: '12300001'
    },
    com_2_titulares: {
        agency: '1500',
        account: '052111',
        password: '12300001'
    },
    conta_com_investimento: {
        agency: '1500',
        account: '010796',
        password: '12300001',
        card_password: '111111',
        holder_name: 'AMERICO'
    },
    varejo_com_mais_de_um_titular: {
        agency: '1500',
        account: '010705',
        password: '12300001',
        card_password: '111111',
        holder_name: 'AMERICO'
    },
    uniclass_com_mais_de_um_titular: {
        agency: '1500',
        account: '013311',
        password: '12300001',
        card_password: '111111',
        holder_name: 'AMERICO'
    },
    private_com_mais_de_um_titular: {
        agency: '3977',
        account: '012503',
        password: '12300001',
        card_password: '111111',
        holder_name: 'JACQUES'
    },
    personnalite_com_mais_de_um_titular: {
        agency: '3977',
        account: '062615',
        password: '12300001',
        card_password: '111111',
        holder_name: 'AMERICO'
    },
    com_mais_de_cinco_titulares: {
        agency: '1500',
        account: '012503',
        password: '12300001'
    },
    de_senha_expirada: {
        agency: '1500',
        account: '052116',
        password: '12300001'
    },
    de_sistema_indisponível: {
        agency: '1500',
        account: '025537',
        password: '12300001'
    },
    de_problemas_de_comunicação: {
        agency: '1500',
        account: '025537',
        password: '12300001'
    },
    de_pessoa_juridica: {
        agency: '1500',
        account: '010045',
        password: '12300001'
    },
    de_conta_judicialmente_bloqueada: {
        agency: '1500',
        account: '052086',
        password: '12300001'
    },
    de_conta_sem_movimentação: {
        agency: '1500',
        account: '052115',
        password: '12300001'
    },
    de_erro_de_processamento: {
        agency: '1500',
        account: '052085',
        password: '12300001'
    },
    de_acesso_já_cadastrado: {
        agency: '1500',
        account: '052012',
        password: '12300001',
        card_password: '111111'
    },
    de_agência_e_conta_incompletos: {
        agency: '150',
        account: '05201',
        password: '12300001',
        card_password: '111111'
    },
    varejo: {
        agency: '1500',
        account: '052012',
        password: '12300001',
        invalid_password: '123456',
        block_password: '123456',
        card_password: '111111',
        balance: '31.050,28'
    },
    personnalite: {
        agency: '3977',
        account: '052012',
        password: '12300001',
        card_password: '111111',
        balance: '13.166.188,41'
    },
    uniclass: {
        agency: '1500',
        account: '024532',
        password: '12300001',
        card_password: '111111',
        balance: '11.919,00'
    },
    private: {
        agency: '1500',
        account: '052509',
        password: '12300001',
        card_password: '111111',
        balance: '14.423,79'
    },
    poupança: {
        agency: '1500',
        account: '025533',
        password: '12300001',
        card_password: '111111'
    },
    de_agência_ou_conta_inválida: {
        agency: '1500',
        account: '052138',
        password: '12300001',
        card_password: '111111'
    },
    varejo_digital: {
        agency: '1500',
        account: '052013',
        password: '12300001',
        card_password: '111111'
    },
    personnalite_digital: {
        agency: '3977',
        account: '052012',
        password: '12300001',
        card_password: '222222'
    },

    uniclass_digital: {
        agency: '1500',
        account: '024532',
        password: '12300001',
        card_password: '111111'
    },
    varejo_física: {
        agency: '1500',
        account: '052012',
        password: '12300001',
        card_password: '111111'
    },
    personnalite_física: {
        agency: '3977',
        account: '052013',
        password: '12300001',
        card_password: '111111'
    },
    uniclass_física: {
        agency: '1500',
        account: '025532',
        password: '12300001',
        card_password: '111111'
    },
    private_física: {
        agency: '1500',
        account: '052509',
        password: '12300001',
        card_password: '111111'
    },
    poupança_física: {
        agency: '1500',
        account: '025533',
        password: '12300001',
        card_password: '111111'
    },
    cep: {
        agency: '2818',
        account: '052222',
        password: '12300001',
        card_password: '111111'
    },
    cep_adicional: {
        agency: '2819',
        account: '052002',
        password: '12300001',
        card_password: '111111'
    },
    acima_cep: {
        agency: '2820',
        account: '052002',
        password: '12300001',
        card_password: '111111'
    },
    sem_cartão: {
        agency: '1500',
        account: '052509',
        password: '12300001',
        card_password: '111111'
    },
    com_cartão: {
        agency: '1500',
        account: '052012',
        password: '12300001',
        card_password: '111111'
    },
    com_mais_de_um_cartão: {
        agency: '3977',
        account: '052012',
        password: '12300001',
        card_password: '111111'
    },
    conta_sem_lançamento: {
        agency: '3977',
        account: '052012',
        password: '12300001',
        card_password: '111111'
    },
    com_limite_negativo: {
        agency: '3977',
        account: '052012',
        password: '12300001',
        card_password: '111111'
    },
    de_transferência: {
        agency: '1500',
        account: '012081',
        password: '12300001',
        invalid_password: '123456',
        block_password: '123456',
        card_password: '111111',
        account_balance: '2.000.000.000,00'
    },
    transferência_sem_contato: {
        agency: '1500',
        account: '012081',
        password: '12300001',
        invalid_password: '123456',
        block_password: '123456',
        card_password: '111111',
        account_balance: '2.000.000.000,00'
    },
    de_comprovantes: {
        agency: '1500',
        account: '010465',
        password: '12300001',
        card_password: '111111'
    },
    conta_com_faturas: {
        agency: '1501',
        account: '052012',
        password: '11111111'
    },
    conta_com_dda: {
        agency: '1502',
        account: '052012',
        password: '11111111'
    },
    conta_com_dai: {
        agency: '1503',
        account: '052012',
        password: '11111111'
    },
    conta_com_proximos_pagamentos: {
        agency: '1504',
        account: '052012',
        password: '11111111'
    },
    usuário_sem_itoken: {
        agency: '1500',
        account: '052012',
        password: '12300001',
        card_password: '111111'
    },
    funcionario: {
        agency: '1500',
        account: '052012',
        password: '12300001',
        card_password: '111111'
    },
    de_DDA: {
        agency: '1500',
        account: '052202',
        password: '12300001',
        card_password: '111111'
    },
    sem_débitos_a_autorizar: {
        agency: '1500',
        account: '010465',
        password: '12300001',
        card_password: '111111'
    },
    com_débitos_a_autorizar: {
        agency: '1500',
        account: '023807',
        password: '12300001',
        card_password: '111111'
    },

    com_lancamentos_de_cartao: {
        agency: '1500',
        account: '012867',
        password: '12300001',
        card_password: '111111'
    },

    fatura_em_aberto: {
        agency: '1500',
        account: '012081',
        password: '12300001',
        card_password: '111111'
    },
    limite_de_credito: {
        agency: '1500',
        account: '012081',
        password: '12300001',
        card_password: '111111'
    },
    cartao_bloqueado: {
        agency: '1500',
        account: '012867',
        password: '12300001',
        card_password: '111111'
    },

    fatura_digital: {
        agency: '1500',
        account: '012081',
        password: '12300001',
        card_password: '111111'
    },

    cartao_troca_senha: {
        agency: '1500',
        account: '012867',
        password: '12300001',
        card_password: '111111'
    },
    de_aviso_viagem: {
        agency: '1500',
        account: '012081',
        password: '12300001',
        invalid_password: '123456',
        block_password: '123456',
        card_password: '111111',
        account_balance: '2.000.000.000,00'
    },
    de_seguro_viagem: {
        agency: '1500',
        account: '052202',
        password: '12300001',
        card_password: '111111',
        holder_name: 'AMERICO'
    },
}
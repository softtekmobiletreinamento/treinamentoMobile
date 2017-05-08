# coding: utf-8
CARTOES = {
    fatura_em_aberto: {
        texto_cartao: 'Personnalite Visa - final 5701'
    },
    limite_de_credito: {
        texto_cartao: 'Itau Uniclass 2.0 Mc Platinum - final 2006',
        limite_credito: 'R$ 6.571,89'
    },
    cartao_bloqueado: {
        texto_cartao: 'ITAUCARD VISA NACIONAL - Final 5403',
        card_cvv: '396'
    },
    cartao_troca_senha: {
        texto_cartao: 'TAM ITAUCARD MASTERCARD NACIONAL - Final 0700',
        card_cvv: '784',
        nova_senha: '1740'
    },
    fatura_por_email: {
        texto_cartao: 'Tam Itaucard Mastercard Nacional                  Final 4504',
        meio: 'não receber fatura pelo correio',
        opcao: 'email',
        email: 'teste@teste.com'
    },
    fatura_por_celular: {
        texto_cartao: 'Fiat Itaucard 2.0 Mci Nacional                    Final 8109',
        meio: 'não receber fatura pelo correio',
        opcao: 'celular',
        ddd: '11',
        celular: '988888181'
    },
    fatura_por_correio: {
        texto_cartao: 'Itaucard 2.0 Visa Nacional                        Final 2408',
        meio: 'receber fatura em papel pelo correio',
        opcao: 'correio',
        endereco: 'RUA TESTE',
        numero: '2016',
        complemento: 'BL 05 APT 20',
        bairro: 'VILA TESTE',
        cep: '03146030',
        cidade: 'SAO PAULO',
        estado: 'SP'
    },
    fatura_em_duplicidade: {
        texto_cartao: 'Fiat Itaucard 2.0 Mc Nacional - final 8109'
    }
}
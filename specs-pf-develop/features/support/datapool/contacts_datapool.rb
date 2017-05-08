class ContactsDatapool < Datapool
    init do
    {
      "Favorecido" => {
        "Valido" => {
            "nome"     => "George Orwell",
            "apelido"  => "",
            "e-mail"   => "",
            "favorito" => true,
            "contas" =>  [
                {
                    "banco"    => "Banco Itau S/A",
                    "agência"  => "0244",
                    "conta"    => "85432",
                    "digito"   => "9"
                }
            ]
        },
        "Valido nao correntista" => {
            "contas" =>  [
                {
                    "banco"    => "Banco Safra S.A",
                    "agência"  => "0244",
                    "conta"    => "54321",
                    "digito"   => "1"
                }
            ]
        },
        "Valido com 3 contas" => {
            "nome"     => "Carlos Bidu Ferraz",
            "apelido"  => "",
            "e-mail"   => "",
            "favorito" => true,
            "contas" =>  [
                {
                    "banco"    => "Banco Itau S/A",
                    "agência"  => "0244",
                    "conta"    => "85432",
                    "digito"   => "9"
                },
                {
                    "banco"    => "Banco Safra S.A",
                    "agência"  => "1234",
                    "conta"    => "54321",
                    "digito"   => "1"
                },
                {
                    "banco"    => "Banco Safra S.A",
                    "agência"  => "0244",
                    "conta"    => "54321",
                    "digito"   => "1"
                }
            ]
        },
        "Invalido" => {
            "e-mail"   => "A",
            "contas" =>  [
                {
                    "banco"    => "banco",
                    "agência"  => "123",
                    "conta"    => "123",
                    "digito"   => "@"
                }
            ]
        },
        "Invalido nao correntista" => {
            "contas" =>  [
                {
                    "banco"    => "Banco Safra S.A",
                    "agência"  => "1234",
                    "conta"    => "1",
                    "digito"   => "@"
                }
            ]
        },
        "Em branco" => {
            "nome"     => "",
            "apelido"  => "",
            "e-mail"   => "",
            "favorito" => true,
            "contas" =>  [
                {
                    "banco"    => "banco",
                    "agência"  => "",
                    "conta"    => "",
                    "digito"   => ""
                }
            ]
        },
        "Fulano" => {
            "nome"     => "Fulado da Silva",
            "apelido"  => "Fulano",
            "e-mail"   => "fulano@algumacoisa.com",
            "contas" => [
                {
                    "banco"    => "Banco Bradesco S.A",
                    "agência"  => "0000",
                    "conta"    => "1234567890",
                    "digito"   => "12"
                }
            ]
        },
        "Fulano com 3 contas" => {
            "nome"     => "Fulado da Silva",
            "apelido"  => "Fulano",
            "e-mail"   => "fulano@algumacoisa.com",
            "contas" =>  [
                {
                    "banco"    => "Banco Bradesco S.A",
                    "agência"  => "1234",
                    "conta"    => "54321",
                    "digito"   => "0"
                },
                {
                    "banco"    => "Banco Itau S/A",
                    "agência"  => "1234",
                    "conta"    => "54321",
                    "digito"   => "0"
                },
                {
                    "banco"    => "Banco Bradesco S.A",
                    "agência"  => "0000",
                    "conta"    => "1234567890",
                    "digito"   => "12"
                }                
            ]
        }
      }
    }
  end
end
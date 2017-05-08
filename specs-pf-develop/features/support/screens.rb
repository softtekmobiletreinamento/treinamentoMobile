# -*- encoding : utf-8 -*-
MENU_SCREEN = "menu"

SCREENS = {
    MENU_SCREEN => "MenuScreen",
    "Whats New" => "WhatsNewIntroScreen",
    "Home Não Logada" => "HomeNaoLogadaScreen",
    "Senha Eletrônica"  => "SenhaeletronicaScreen",
    "transferências" => "TransferenciaScreen",
    "Editar contato" => "EdicaoFavorecidosScreen",
    "iToken" => "EnterTokenScreen",
    "iToken não Instalado"  => "ItokennaoinstaladoScreen",
    "Ganhe agilidade nas suas Transações"  => "GanheAgilidadeScreen",
    "Orientações de Segurança"  => "OrientacaoSegurancaScreen",
    "Ativação iToken"  => "AtivacaoiTokenScreen",
    "SMS"  => "SmsScreen",
    "valor da transferências" => "TransferenciaValorScreen",
    "Pagamentos" => "PagamentoScreen",
    "detalhe pagamento" => "DetalhePagamentoScreen",
    "login" => "LoginScreen",
    "Dashboard de Pagamentos" => "DashboardScreen",
    "leitura de código de barras" => "LeitorCodigoBarrasScreen",
    "conta corrente" => "ContaCorrenteScreen",
    "central de alertas de pagamentos" => "DashboardCentralAlertasScreen",
    "lista de pagamentos" => "ListaPagamentosScreen"
}

def getScreen(screen)
  @class_name = SCREENS[screen]
  return page(Object.const_get(@class_name)).await()
end

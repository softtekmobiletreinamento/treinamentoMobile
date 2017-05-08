require 'calabash-android/management/app_installation'

Before do
  # antes de executar qualquer cenário, instala o app, caso este não esteja instalado
  # na execução do primeiro cenário, é verificado se o app está instalado ou não, verificando o bundle_id
  # a partir da segunda execução, a variável $status_instalacao_app possui um valor true ou false e recebe o valor true
  # $status_instalacao_app = true, o app somente será instalado no caso do @reinstall, onde será desinstalado e instalado novamente
  if $status_instalacao_app.nil?
    bundle_id = package_name(ENV['APP_PATH'])
    $status_instalacao_app = `#{adb_command} shell pm list packages`.lines.map { |line| line.chomp.sub("package:", "") }.include?(bundle_id)
    instalar_app
  else
    $status_instalacao_app = true
  end
end

Before('@reset') do
  clear_app_data
end

Before('@reinstall') do
  # na primeira execução, caso o app acabou de ser instalado, e caiu neste fluxo do @reinstall, o app não será reinstalado
  reinstalar_app if $status_instalacao_app.eql? true
end

def instalar_app
  install_app(ENV['TEST_APP_PATH'])
  install_app(ENV['APP_PATH'])
end

def reinstalar_app
  uninstall_apps
  instalar_app
end
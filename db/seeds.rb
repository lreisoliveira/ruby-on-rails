#Tabela admin  - cria dados iniciais de acesso
Admin.find_or_create_by!(id: 1, nome: 'admin', login: 'admin', senha: Digest::MD5.hexdigest('#cipa$Quest2016'), vigente: true)
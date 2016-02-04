class Funcionario < ApdataConnection
  self.table_name = "TBFCL_SOLICITANTE"

  alias_attribute :situacao, :cd_situacao
  alias_attribute :nome,     :nm_solicitante
  alias_attribute :email,    :nm_email
  alias_attribute :re,       :cd_solicitante

  scope :desativados, -> {
    where('CD_SITUACAO in (0, 2, 3, 14, 51, 99)')
  }
end
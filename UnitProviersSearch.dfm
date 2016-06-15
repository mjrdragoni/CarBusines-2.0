inherited frmprovidersearch: Tfrmprovidersearch
  Caption = 'frmprovidersearch'
  ClientWidth = 515
  ExplicitWidth = 521
  PixelsPerInch = 96
  TextHeight = 13
  inherited pesqstring: TLabel
    Left = 138
    Top = 20
    Width = 353
    Caption = 'Digite o Nome ou Parte do Nome ou Sobrenome do  Fornecedor'
    ExplicitLeft = 138
    ExplicitTop = 20
    ExplicitWidth = 353
  end
  inherited Label2: TLabel
    Top = 57
    ExplicitTop = 57
  end
  inherited Panel1: TPanel
    Height = 128
    inherited Image1: TImage
      Height = 128
    end
  end
  inherited BitBtn1: TBitBtn
    Top = 90
    ExplicitTop = 90
  end
  inherited BitBtn2: TBitBtn
    Top = 90
    ExplicitTop = 90
  end
  inherited Edit1: TEdit
    Top = 57
    ExplicitTop = 57
  end
  inherited DBGrid1: TDBGrid
    Top = 128
    Width = 515
    Height = 291
    DataSource = DataSource1
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'C'#243'd.'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name_conpany_name'
        Title.Caption = 'Raz'#227'o Social'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'phone'
        Title.Caption = 'Telefone'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cell'
        Title.Caption = 'Celular'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Title.Caption = 'E-mail'
        Width = 154
        Visible = True
      end>
  end
  inherited FDTable1: TFDTable
    IndexFieldNames = 'id'
    UpdateOptions.UpdateTableName = 'CarRent.dbo.providers'
    TableName = 'CarRent.dbo.providers'
    Left = 328
    object FDTable1id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTable1name_conpany_name: TStringField
      FieldName = 'name_conpany_name'
      Origin = 'name_conpany_name'
      Required = True
      Size = 50
    end
    object FDTable1phone: TStringField
      FieldName = 'phone'
      Origin = 'phone'
      Required = True
    end
    object FDTable1cell: TStringField
      FieldName = 'cell'
      Origin = 'cell'
    end
    object FDTable1email: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
  end
  inherited FDQuery1: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'SELECT * FROM providers')
  end
  inherited DataSource1: TDataSource
    Top = 16
  end
end

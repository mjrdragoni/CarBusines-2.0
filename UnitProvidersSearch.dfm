inherited frmpatternseachstring1: Tfrmpatternseachstring1
  Caption = 'frmpatternseachstring1'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 144
    inherited Image1: TImage
      Height = 144
    end
  end
  inherited BitBtn2: TBitBtn
    OnClick = BitBtn2Click
  end
  inherited DBGrid1: TDBGrid
    Top = 144
    Height = 275
    DataSource = DataSource1
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name_conpany_name'
        Width = 282
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'phone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cell'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Visible = True
      end>
  end
  inherited FDTable1: TFDTable
    IndexFieldNames = 'id'
    UpdateOptions.UpdateTableName = 'CarRent.dbo.providers'
    TableName = 'CarRent.dbo.providers'
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
    SQL.Strings = (
      'SELECT * FROM providers')
    Left = 272
    Top = 8
  end
  inherited DataSource1: TDataSource
    Left = 352
    Top = 8
  end
  inherited DataSource2: TDataSource
    Top = 88
  end
end

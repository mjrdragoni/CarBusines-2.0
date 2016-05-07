object DM: TDM
  OldCreateOrder = False
  Height = 231
  Width = 268
  object FDConnection1: TFDConnection
    Params.Strings = (
      'SERVER=NOTE-DRAGONI\SQLEXPRESS'
      'OSAuthent=Yes'
      'ApplicationName=Architect'
      'Workstation=NOTE-DRAGONI'
      'DATABASE=CarRent'
      'MARS=yes'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 120
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 192
    Top = 104
  end
end

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
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 104
  end
  object FDConnectionWeb: TFDConnection
    Params.Strings = (
      'User_Name= u130462423_carrt'
      'Server=31.220.104.130'
      'Database= u130462423_carrt'
      'Password=1983dragoni'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 168
    Top = 24
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Program Files (x86)\MySQL\MySQL Connector C 6.1\lib\libmysql.' +
      'dll'
    Left = 176
    Top = 104
  end
end

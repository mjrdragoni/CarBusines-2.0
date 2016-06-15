object DM: TDM
  OldCreateOrder = False
  Height = 231
  Width = 268
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=192.168.3.110'
      'OSAuthent=No'
      'ApplicationName=Architect'
      'Workstation=NOTE-DRAGONI'
      'DATABASE=CarRent'
      'MARS=yes'
      'User_Name=sa'
      'Password=1983dragoni'
      'ODBCAdvanced=Failover_Partner=192.168.3.101'
      'DriverID=MSSQL')
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

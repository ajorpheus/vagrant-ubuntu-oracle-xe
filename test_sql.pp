  file {
    '/tmp/setup.sql':
      ensure                                             => file,
      source                                             => '/tmp/setup.sql';
  }

  exec { 'oracle-script':
    path                                    => ['/bin', '/u01/app/oracle/product/11.2.0/xe/bin'],
    command                                 => 'sqlplus system/manager@xe < /tmp/setup.sql',
    require                                 => [ File['/tmp/setup.sql']],
    timeout                                 => '0',
  }

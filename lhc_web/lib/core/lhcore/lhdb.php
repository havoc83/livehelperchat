<?php

class erLhcoreClassLazyDatabaseConfiguration implements ezcBaseConfigurationInitializer
{
     private static $connectionMaster;
     //Find a way to bring this in dynamically.
     public static function configureObject( $instance )
     {
         $cfg = erConfigClassLhConfig::getInstance();
         switch ( $instance )
         {
             case 'slave':
                 if ($cfg->getSetting( 'db', 'use_slaves' ) === true) {
                     try {
        		         $dbSlaves = $cfg->getSetting( 'db', 'db_slaves' );
        		         $slaveParams = $dbSlaves[rand(0,count($dbSlaves)-1)];
                         $db = ezcDbFactory::create( "mysql://{$slaveParams['user']}:{$slaveParams['password']}@{$slaveParams['host']}:{$slaveParams['port']}/{$slaveParams['database']}" );
                         $db->query('SET NAMES utf8');
                     } catch (Exception $e){
                         error_log($e);
                         die('Cannot connect to database.') ;
                     }
                     return $db;
                 } else {
                     // Perhaps connection is already done with master?
                     if (isset(self::$connectionMaster)) return self::$connectionMaster;
                     try {
                        $db = ezcDbFactory::create("{$dbhost}://{$cfg->getSetting( 'db', 'user' )}:{$cfg->getSetting( 'db', 'password' )}@{$cfg->getSetting( 'db', 'host' )}:{$cfg->getSetting( 'db', 'port' )}/{$cfg->getSetting( 'db', 'database' )}" );
                        $db->query('SET NAMES utf8');
                        self::$connectionMaster = $db;
                        return $db;
                    } catch (Exception $e) {
                      error_log($e);
                      die('Cannot connect to database.....') ;
                    }
                 }
                 break;

             case 'dbmongo':
                 try {
                    $cfg = erConfigClassLhConfig::getInstance();
                    $db = ezcDbFactory::create( "mongodb://{$cfg->getSetting( 'dbmongo', 'user' )}:{$cfg->getSetting( 'dbmongo', 'password' )}@{$cfg->getSetting( 'dbmongo', 'host' )}:{$cfg->getSetting( 'dbmongo', 'port' )}/{$cfg->getSetting( 'dbmongo', 'database' )}" );
                    return $db;
                 } catch (Exception $e) {
                    error_log($e);
                    die('Cannot connect to mongo database.') ;
                 }
                 break;

             case false: // Default instance
             {
                try {
                  if (isset(self::$connectionMaster)) return self::$connectionMaster; // If we do not user slaves and slave request already got connection
                  $db = ezcDbFactory::create("{$cfg->getSetting('db', 'driver')}://{$cfg->getSetting( 'db', 'user' )}:{$cfg->getSetting( 'db', 'password' )}@{$cfg->getSetting( 'db', 'host' )}:{$cfg->getSetting( 'db', 'port' )}/{$cfg->getSetting( 'db', 'database' )}" );
                    $db->query('SET search_path TO '.$cfg->getSetting( 'db', 'search_path'));
                    
                    //$def->idProperty->generator = new ezcPersistentGeneratorDefinition(  'ezcPersistentSequenceGenerator' );
                    //$def->idProperty->generator->params['sequence'] = 'lh_article_id_seq';
                    
                    self::$connectionMaster = $db;
                    return $db;
                } catch (Exception $e) {
                	// Are we installed?
                	if ($cfg->getSetting( 'site', 'installed' ) == false) {
                		header('Location: ' .erLhcoreClassDesign::baseurldirect('site_admin/install/install') );
                		exit;
                  	}
                    	error_log($e);
                  	die('Cannot connect to database. If you are installing application please use /index.php/install/install url. If you keep getting this error please check that application can write to cache folder and cgi.fix_pathinfo = 1') ;
                }
             }

             case 'sqlite':
             return ezcDbFactory::create( 'sqlite://:memory:' );
         }
     }
 }




?>
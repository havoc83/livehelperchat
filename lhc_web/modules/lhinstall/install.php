<?php

try {

$cfgSite = erConfigClassLhConfig::getInstance();

if ($cfgSite->getSetting( 'site', 'installed' ) == true)
{
    $Params['module']['functions'] = array('install');
    include_once('modules/lhkernel/nopermission.php');

    $Result['pagelayout'] = 'install';
    $Result['path'] = array(array('title' => 'Live helper chat installation'));
    return $Result;

    exit;
}

$instance = erLhcoreClassSystem::instance();

if ($instance->SiteAccess != 'site_admin') {
    header('Location: ' .erLhcoreClassDesign::baseurldirect('site_admin/install/install') );
    exit;
}

$tpl = new erLhcoreClassTemplate( 'lhinstall/install1.tpl.php');

switch ((int)$Params['user_parameters']['step_id']) {

	case '1':
		$Errors = array();
		if (!is_writable("cache/cacheconfig"))
	       $Errors[] = "cache/cacheconfig is not writable";

	    if (!is_writable("settings/"))
	       $Errors[] = "settings/ is not writable";

		if (!is_writable("cache/translations"))
	       $Errors[] = "cache/translations is not writable";

		if (!is_writable("cache/userinfo"))
	       $Errors[] = "cache/userinfo is not writable";

		if (!is_writable("cache/compiledtemplates"))
	       $Errors[] = "cache/compiledtemplates is not writable";

		if (!is_writable("var/storage"))
	       $Errors[] = "var/storage is not writable";

		if (!is_writable("var/storageform"))
	       $Errors[] = "var/storageform is not writable";

		if (!is_writable("var/userphoto"))
	       $Errors[] = "var/userphoto is not writable";

		if (!is_writable("var/tmpfiles"))
	       $Errors[] = "var/tmpfiles is not writable";

		if (!is_writable("var/storagetheme"))
	       $Errors[] = "var/storagetheme is not writable";

		if (!is_writable("var/storageadmintheme"))
	       $Errors[] = "var/storageadmintheme is not writable";

		if (!(extension_loaded ('pdo_mysql' )||extension_loaded('pdo_pgsql')))
	       $Errors[] = "php-pdo extension not detected. Please install php extension";
		
		if (!extension_loaded('curl'))
			$Errors[] = "php_curl extension not detected. Please install php extension";	
		
		if (!extension_loaded('mbstring'))
			$Errors[] = "mbstring extension not detected. Please install php extension";	
		
		if (!extension_loaded('gd'))
			$Errors[] = "gd extension not detected. Please install php extension";	
		
		if (!function_exists('json_encode'))
			$Errors[] = "json support not detected. Please install php extension";	
		
		if (version_compare(PHP_VERSION, '5.4.0','<')) {
			$Errors[] = "Minimum 5.4.0 PHP version is required";	
		}
		
       if (count($Errors) == 0){
           $tpl->setFile('lhinstall/install2.tpl.php');
       }
	  break;

	  case '2':
		$Errors = array();

		$definition = array(
		    'DatabaseDriver' => new ezcInputFormDefinitionElement(
		        ezcInputFormDefinitionElement::REQUIRED, 'string'
		    ),
            'DatabaseUsername' => new ezcInputFormDefinitionElement(
                ezcInputFormDefinitionElement::REQUIRED, 'unsafe_raw'
            ),
            'DatabasePassword' => new ezcInputFormDefinitionElement(
                ezcInputFormDefinitionElement::REQUIRED, 'unsafe_raw'
            ),
            'DatabaseHost' => new ezcInputFormDefinitionElement(
                ezcInputFormDefinitionElement::REQUIRED, 'string'
            ),
            'DatabasePort' => new ezcInputFormDefinitionElement(
                ezcInputFormDefinitionElement::REQUIRED, 'int'
            ),
            'DatabaseDatabaseName' => new ezcInputFormDefinitionElement(
                ezcInputFormDefinitionElement::REQUIRED, 'string'
            ),
        );

	   $form = new ezcInputForm( INPUT_POST, $definition );


	   if ( !$form->hasValidData( 'DatabaseUsername' ) )
       {
           $Errors[] = 'Please enter database username';
       }

	   if ( !$form->hasValidData( 'DatabasePassword' ) )
       {
           $Errors[] = 'Please enter database password';
       }

	   if ( !$form->hasValidData( 'DatabaseHost' ) || $form->DatabaseHost == '' )
       {
           $Errors[] = 'Please enter database host';
       }

	   if ( !$form->hasValidData( 'DatabasePort' ) || $form->DatabasePort == '' )
       {
           $Errors[] = 'Please enter database post';
       }

	   if ( !$form->hasValidData( 'DatabaseDatabaseName' ) || $form->DatabaseDatabaseName == '' )
       {
           $Errors[] = 'Please enter database name';
       }

       if (count($Errors) == 0)
       {
           try {
           	$db = ezcDbFactory::create( "{$form->DatabaseDriver}://{$form->DatabaseUsername}:{$form->DatabasePassword}@{$form->DatabaseHost}:{$form->DatabasePort}/{$form->DatabaseDatabaseName}" );
           } catch (Exception $e) {
                  $Errors[] = 'Cannot login with provided logins. Returned message: <br/>'.$e->getMessage();
           }
       }

	       if (count($Errors) == 0){

	           $cfgSite = erConfigClassLhConfig::getInstance();
	           $cfgSite->setSetting( 'db', 'driver', $form->DatabaseDriver);
	           $cfgSite->setSetting( 'db', 'host', $form->DatabaseHost);
	           $cfgSite->setSetting( 'db', 'user', $form->DatabaseUsername);
	           $cfgSite->setSetting( 'db', 'password', $form->DatabasePassword);
	           $cfgSite->setSetting( 'db', 'database', $form->DatabaseDatabaseName);
	           $cfgSite->setSetting( 'db', 'port', $form->DatabasePort);

	           $cfgSite->setSetting( 'site', 'secrethash', substr(md5(time() . ":" . mt_rand()),0,10));

	           $cfgSite->save();

	           $tpl->setFile('lhinstall/install3.tpl.php');
	       } else {
	          $tpl->set('db_username',$form->DatabaseUsername);
	          $tpl->set('db_password',$form->DatabasePassword);
	          $tpl->set('db_host',$form->DatabaseHost);
	          $tpl->set('db_port',$form->DatabasePort);
	          $tpl->set('db_name',$form->DatabaseDatabaseName);
	          $tpl->set('errors',$Errors);
	          $tpl->setFile('lhinstall/install2.tpl.php');
	       }
	  break;

	case '3':

	    $Errors = array();

	    if ($_SERVER['REQUEST_METHOD'] == 'POST')
	    {
    		$definition = array(
                'AdminUsername' => new ezcInputFormDefinitionElement(
                    ezcInputFormDefinitionElement::REQUIRED, 'unsafe_raw'
                ),
                'AdminPassword' => new ezcInputFormDefinitionElement(
                    ezcInputFormDefinitionElement::REQUIRED, 'unsafe_raw'
                ),
                'AdminPassword1' => new ezcInputFormDefinitionElement(
                    ezcInputFormDefinitionElement::REQUIRED, 'unsafe_raw'
                ),
                'AdminEmail' => new ezcInputFormDefinitionElement(
                    ezcInputFormDefinitionElement::REQUIRED, 'validate_email'
                ),
                'AdminName' => new ezcInputFormDefinitionElement(
                    ezcInputFormDefinitionElement::OPTIONAL, 'unsafe_raw'
                ),
                'AdminSurname' => new ezcInputFormDefinitionElement(
                    ezcInputFormDefinitionElement::OPTIONAL, 'unsafe_raw'
                ),
                'DefaultDepartament' => new ezcInputFormDefinitionElement(
                    ezcInputFormDefinitionElement::REQUIRED, 'string'
                )
            );

    	    $form = new ezcInputForm( INPUT_POST, $definition );


    	    if ( !$form->hasValidData( 'AdminUsername' ) || $form->AdminUsername == '')
            {
                $Errors[] = 'Please enter admin username';
            }

            if ($form->hasValidData( 'AdminUsername' ) && $form->AdminUsername != '' && strlen($form->AdminUsername) > 40)
            {
                $Errors[] = 'Maximum 40 characters for admin username';
            }

    	    if ( !$form->hasValidData( 'AdminPassword' ) || $form->AdminPassword == '')
            {
                $Errors[] = 'Please enter admin password';
            }

    	    if ($form->hasValidData( 'AdminPassword' ) && $form->AdminPassword != '' && strlen($form->AdminPassword) > 40)
            {
                $Errors[] = 'Maximum 40 characters for admin password';
            }

    	    if ($form->hasValidData( 'AdminPassword' ) && $form->AdminPassword != '' && strlen($form->AdminPassword) <= 40 && $form->AdminPassword1 != $form->AdminPassword)
            {
                $Errors[] = 'Passwords missmatch';
            }


    	    if ( !$form->hasValidData( 'AdminEmail' ) )
            {
                $Errors[] = 'Wrong email address';
            }


            if ( !$form->hasValidData( 'DefaultDepartament' ) || $form->DefaultDepartament == '')
            {
                $Errors[] = 'Please enter default department name';
            }

            if (count($Errors) == 0) {

               $tpl->set('admin_username',$form->AdminUsername);
               $adminEmail = '';
               if ( $form->hasValidData( 'AdminEmail' ) ) {
               		$tpl->set('admin_email',$form->AdminEmail);
               		$adminEmail = $form->AdminEmail;
               }
    	       $tpl->set('admin_name',$form->AdminName);
    	       $tpl->set('admin_surname',$form->AdminSurname);
    	       $tpl->set('admin_departament',$form->DefaultDepartament);

    	       /*DATABASE TABLES SETUP*/
    	       $db = ezcDbInstance::get();
    	       if($form->DatabaseDriver == 'pgsql'){
    	           $query = file_get_contents('../../doc/postgresql.sql');
    	       } else {
    	           $query = file_get_contents('../../doc/mysql.sql');
    	       }
    	       
    	       $randomHash = erLhcoreClassModelForgotPassword::randomPassword(9);
    	       $randomHashLength = strlen($randomHash);
    	       $exportHash = erLhcoreClassModelForgotPassword::randomPassword(9);
    	       
    	       if (extension_loaded('bcmath')){
    	           $geoRow = "('geo_data','a:5:{i:0;b:0;s:21:\"geo_detection_enabled\";i:1;s:22:\"geo_service_identifier\";s:8:\"max_mind\";s:23:\"max_mind_detection_type\";s:7:\"country\";s:22:\"max_mind_city_location\";s:37:\"var/external/geoip/GeoLite2-City.mmdb\";}',0,'',1)";
    	       } else {
    	           $geoRow = "('geo_data', '', '0', '', '1')";
    	       }
    	       
    	       $Departament = new erLhcoreClassModelDepartament();
    	       $Departament->name = $form->DefaultDepartament;
    	       erLhcoreClassDepartament::getSession()->save($Departament);
    	       
    	       // Admin group
    	       $GroupData = new erLhcoreClassModelGroup();
    	       $GroupData->name    = "Administrators";
    	       erLhcoreClassUser::getSession()->save($GroupData);
    	       
    	       // Precreate operators group
    	       $GroupDataOperators = new erLhcoreClassModelGroup();
    	       $GroupDataOperators->name    = "Operators";
    	       erLhcoreClassUser::getSession()->save($GroupDataOperators);
    	       
    	       // Administrators role
    	       $Role = new erLhcoreClassModelRole();
    	       $Role->name = 'Administrators';
    	       erLhcoreClassRole::getSession()->save($Role);
    	       
    	       // Operators role
    	       $RoleOperators = new erLhcoreClassModelRole();
    	       $RoleOperators->name = 'Operators';
    	       erLhcoreClassRole::getSession()->save($RoleOperators);
    	       
    	       // Assign admin role to admin group
    	       $GroupRole = new erLhcoreClassModelGroupRole();
    	       $GroupRole->group_id =$GroupData->id;
    	       $GroupRole->role_id = $Role->id;
    	       erLhcoreClassRole::getSession()->save($GroupRole);
    	       
    	       // Assign operators role to operators group
    	       $GroupRoleOperators = new erLhcoreClassModelGroupRole();
    	       $GroupRoleOperators->group_id =$GroupDataOperators->id;
    	       $GroupRoleOperators->role_id = $RoleOperators->id;
    	       erLhcoreClassRole::getSession()->save($GroupRoleOperators);
    	       
    	       $UserData = new erLhcoreClassModelUser();
    	       
    	       $UserData->setPassword($form->AdminPassword);
    	       $UserData->email   = $form->AdminEmail;
    	       $UserData->name    = $form->AdminName;
    	       $UserData->surname = $form->AdminSurname;
    	       $UserData->username = $form->AdminUsername;
    	       $UserData->all_departments = 1;
    	       $UserData->departments_ids = 0;
    	       
    	       erLhcoreClassUser::getSession()->save($UserData);
    	       
    	       $GroupUser = new erLhcoreClassModelGroupUser();
    	       $GroupUser->group_id = $GroupData->id;
    	       $GroupUser->user_id = $UserData->id;
    	       erLhcoreClassUser::getSession()->save($GroupUser);
    	       
    	       // Admin role and function
    	       $RoleFunction = new erLhcoreClassModelRoleFunction();
    	       $RoleFunction->role_id = $Role->id;
    	       $RoleFunction->module = '*';
    	       $RoleFunction->function = '*';
    	       erLhcoreClassRole::getSession()->save($RoleFunction);
    	       try{
    	           $db->query($query);
    	       } catch(PDOException $Exception){
        	       echo $Exception->getCode();
        	       echo $Exception->getMessage();
        	   }
             
                // Operators rules and functions
                $permissionsArray = array(
                    array('module' => 'lhuser',  'function' => 'selfedit'),
                    array('module' => 'lhuser',  'function' => 'changeonlinestatus'),
                    array('module' => 'lhuser',  'function' => 'changeskypenick'),
                    array('module' => 'lhuser',  'function' => 'personalcannedmsg'),
                    array('module' => 'lhuser',  'function' => 'change_visibility_list'),
                    array('module' => 'lhuser',  'function' => 'see_assigned_departments'),
                    array('module' => 'lhuser',  'function' => 'canseedepartmentstats'),
                    array('module' => 'lhchat',  'function' => 'use'),
                    array('module' => 'lhchat',  'function' => 'chattabschrome'),
                    array('module' => 'lhchat',  'function' => 'singlechatwindow'),
                    array('module' => 'lhchat',  'function' => 'allowopenremotechat'),
                    array('module' => 'lhchat',  'function' => 'allowchattabs'),
                    array('module' => 'lhchat',  'function' => 'use_onlineusers'),
                    array('module' => 'lhchat',  'function' => 'take_screenshot'),
                    array('module' => 'lhfront', 'function' => 'use'),
                    array('module' => 'lhsystem','function' => 'use'),
                    array('module' => 'lhtranslation','function' => 'use'),
                    array('module' => 'lhchat',  'function' => 'allowblockusers'),
                    array('module' => 'lhsystem','function' => 'generatejs'),
                    array('module' => 'lhsystem','function' => 'changelanguage'),
                    array('module' => 'lhchat',  'function' => 'allowredirect'),
                    array('module' => 'lhchat',  'function' => 'allowtransfer'),
                    array('module' => 'lhchat',  'function' => 'allowtransferdirectly'),
                    array('module' => 'lhchat',  'function' => 'administratecannedmsg'),
                    array('module' => 'lhchat',  'function' => 'sees_all_online_visitors'),
                    array('module' => 'lhpermission',   'function' => 'see_permissions'),
                    array('module' => 'lhquestionary',  'function' => 'manage_questionary'),
                    array('module' => 'lhfaq',   		'function' => 'manage_faq'),
                    array('module' => 'lhchatbox',   	'function' => 'manage_chatbox'),
                    array('module' => 'lhbrowseoffer',  'function' => 'manage_bo'),
                    array('module' => 'lhxml',   		'function' => '*'),
                    array('module' => 'lhcobrowse',   	'function' => 'browse'),
                    array('module' => 'lhfile',   		'function' => 'use_operator'),
                    array('module' => 'lhfile',   		'function' => 'file_delete_chat'),
                    array('module' => 'lhstatistic',   	'function' => 'use'),
                    array('module' => 'lhspeech', 'function' => 'changedefaultlanguage'),
                    array('module' => 'lhspeech', 'function' => 'use'),
                    array('module' => 'lhcannedmsg', 'function' => 'use'),
                    array('module' => 'lhspeech', 'function' => 'change_chat_recognition'),
                );
                
                foreach ($permissionsArray as $paramsPermission) {
                    $RoleFunctionOperator = new erLhcoreClassModelRoleFunction();
                    $RoleFunctionOperator->role_id = $RoleOperators->id;
                    $RoleFunctionOperator->module = $paramsPermission['module'];
                    $RoleFunctionOperator->function = $paramsPermission['function'];
                    erLhcoreClassRole::getSession()->save($RoleFunctionOperator);
                }

               $cfgSite = erConfigClassLhConfig::getInstance();
	           $cfgSite->setSetting( 'site', 'installed', true);
	           $cfgSite->setSetting( 'site', 'templatecache', true);
	           $cfgSite->setSetting( 'site', 'templatecompile', true);
	           $cfgSite->setSetting( 'site', 'modulecompile', true);
	           $cfgSite->save();

    	       $tpl->setFile('lhinstall/install4.tpl.php');

            } else {

               $tpl->set('admin_username',$form->AdminUsername);
               if ( $form->hasValidData( 'AdminEmail' ) ) $tpl->set('admin_email',$form->AdminEmail);
    	       $tpl->set('admin_name',$form->AdminName);
    	       $tpl->set('admin_surname',$form->AdminSurname);
    	       $tpl->set('admin_departament',$form->DefaultDepartament);

    	       $tpl->set('errors',$Errors);

    	       $tpl->setFile('lhinstall/install3.tpl.php');
            }
	    } else {
	        $tpl->setFile('lhinstall/install3.tpl.php');
	    }

	    break;

	case '4':
	    $tpl->setFile('lhinstall/install4.tpl.php');
	    break;

	default:
	    $tpl->setFile('lhinstall/install1.tpl.php');
		break;
}

$Result['content'] = $tpl->fetch();
$Result['pagelayout'] = 'install';
$Result['path'] = array(array('title' => 'Live helper chat installation'));

} catch (Exception $e) {
	echo "Make sure that &quot;cache/*&quot; is writable and then <a href=\"".erLhcoreClassDesign::baseurl('install/install')."\">try again</a>";

	echo "<pre>";
	print_r($e);
	echo "</pre>";
	exit;
}
?>